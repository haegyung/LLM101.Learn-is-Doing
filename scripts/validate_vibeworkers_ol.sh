#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$ROOT_DIR/ol/manifest.tsv"
PRIVATE_MANIFEST="$ROOT_DIR/.ops/ol/manifest.private.tsv"
PRIVATE_MANIFEST_TEMPLATE="$ROOT_DIR/ol/manifest.private.example.tsv"
PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

pass() {
  echo "[PASS][MUST] $1"
  PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
  echo "[FAIL][MUST] $1"
  FAIL_COUNT=$((FAIL_COUNT + 1))
}

warn() {
  echo "[WARN][SHOULD] $1"
  WARN_COUNT=$((WARN_COUNT + 1))
}

EXPECTED_PUBLIC_HEADER=$'page_key\ttitle\tparent_key\tcollection_name\tol_source_file\tupstream_paths'
EXPECTED_PRIVATE_HEADER=$'page_key\tdoc_id\turl_id\tcollection_id\tparent_doc_id'

echo "== Validate Vibeworkers OL manifest =="
if [[ -f "$MANIFEST" ]]; then
  pass "manifest exists: ol/manifest.tsv"
else
  fail "missing manifest: ol/manifest.tsv"
fi

if [[ -f "$PRIVATE_MANIFEST" ]]; then
  pass "private manifest exists: .ops/ol/manifest.private.tsv"
else
  if [[ -f "$PRIVATE_MANIFEST_TEMPLATE" ]]; then
    warn "private manifest missing: .ops/ol/manifest.private.tsv (bootstrap with ol/manifest.private.example.tsv)"
  else
    warn "private manifest missing: .ops/ol/manifest.private.tsv (no bootstrap template found at ol/manifest.private.example.tsv)"
  fi
fi

if git -C "$ROOT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if git -C "$ROOT_DIR" check-ignore -q "$PRIVATE_MANIFEST"; then
    pass "private manifest path is gitignored: .ops/ol/manifest.private.tsv"
  else
    warn "private manifest path is not covered by .gitignore: .ops/ol/manifest.private.tsv"
  fi

  if [[ -f "$PRIVATE_MANIFEST" ]]; then
    if git -C "$ROOT_DIR" ls-files --error-unmatch .ops/ol/manifest.private.tsv >/dev/null 2>&1; then
      fail "private manifest is tracked in git: .ops/ol/manifest.private.tsv"
    else
      pass "private manifest is intentionally untracked"
    fi
  fi
fi

if [[ -f "$MANIFEST" ]]; then
  IFS= read -r header <"$MANIFEST" || header=""
  if [[ "$header" == "$EXPECTED_PUBLIC_HEADER" ]]; then
    pass "public manifest header matches expected schema"
  else
    fail "public manifest header does not match expected schema"
  fi
fi

if [[ -f "$PRIVATE_MANIFEST" ]]; then
  IFS= read -r private_header <"$PRIVATE_MANIFEST" || private_header=""
  if [[ "$private_header" == "$EXPECTED_PRIVATE_HEADER" ]]; then
    pass "private manifest header matches expected schema"
  else
    fail "private manifest header does not match expected schema"
  fi
else
  warn "private metadata validation skipped: .ops/ol/manifest.private.tsv not found"
fi

if [[ -f "$PRIVATE_MANIFEST_TEMPLATE" ]]; then
  IFS= read -r template_header <"$PRIVATE_MANIFEST_TEMPLATE" || template_header=""
  if [[ "$template_header" == "$EXPECTED_PRIVATE_HEADER" ]]; then
    echo "[PASS][SHOULD] bootstrap template schema is valid: ol/manifest.private.example.tsv"
  else
    fail "bootstrap template schema is invalid: ol/manifest.private.example.tsv"
  fi
else
  warn "bootstrap template missing: ol/manifest.private.example.tsv"
fi

TMP_KEYS="$(mktemp)"
TMP_PARENTS="$(mktemp)"
TMP_PRIV_KEYS="$(mktemp)"
TMP_PRIV_DOC_IDS="$(mktemp)"
TMP_PRIV_URL_IDS="$(mktemp)"
trap 'rm -f "$TMP_KEYS" "$TMP_PARENTS" "$TMP_PRIV_KEYS" "$TMP_PRIV_DOC_IDS" "$TMP_PRIV_URL_IDS"' EXIT

required_keys=(
  "lesson-hub"
  "lesson-1"
  "lesson-2"
  "workshop-90min-15"
)

if [[ -f "$MANIFEST" ]]; then
  while IFS=$'\t' read -r page_key title parent_key collection_name ol_source_file upstream_paths; do
    [[ "$page_key" == "page_key" ]] && continue

    if [[ -z "$page_key" || -z "$title" || -z "$parent_key" || -z "$collection_name" || -z "$ol_source_file" ]]; then
      fail "manifest row has empty required field: $page_key"
      continue
    fi

    if grep -Fxq "$page_key" "$TMP_KEYS"; then
      fail "duplicate page_key: $page_key"
    else
      printf '%s\n' "$page_key" >>"$TMP_KEYS"
    fi

    printf '%s\t%s\n' "$page_key" "$parent_key" >>"$TMP_PARENTS"

    if [[ -f "$ROOT_DIR/$ol_source_file" ]]; then
      pass "OL source file exists: $ol_source_file"
    else
      fail "missing OL source file: $ol_source_file"
      continue
    fi

    if git -C "$ROOT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      if git -C "$ROOT_DIR" ls-files --error-unmatch "$ol_source_file" >/dev/null 2>&1; then
        echo "[PASS][SHOULD] OL source file is git-tracked: $ol_source_file"
      else
        warn "OL source file is not yet git-tracked: $ol_source_file"
      fi
    fi

    if [[ "$upstream_paths" == "-" || -z "$upstream_paths" ]]; then
      warn "no upstream paths declared for: $page_key"
    else
      IFS=';' read -r -a upstream_array <<<"$upstream_paths"
      for upstream_path in "${upstream_array[@]}"; do
        if [[ -f "$ROOT_DIR/$upstream_path" ]]; then
          pass "upstream path exists for $page_key: $upstream_path"
        else
          fail "missing upstream path for $page_key: $upstream_path"
        fi

        if git -C "$ROOT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
          if [[ "$upstream_path" == ../* ]]; then
            echo "[PASS][SHOULD] upstream path is external publishable SoT for $page_key: $upstream_path"
          elif git -C "$ROOT_DIR" ls-files --error-unmatch "$upstream_path" >/dev/null 2>&1; then
            echo "[PASS][SHOULD] upstream path is git-tracked for $page_key: $upstream_path"
          else
            warn "upstream path is not yet git-tracked for $page_key: $upstream_path"
          fi
        fi
      done
    fi
  done <"$MANIFEST"
fi

echo
echo "== Validate parent links =="
while IFS=$'\t' read -r page_key parent_key; do
  if [[ "$parent_key" == "-" ]]; then
    pass "root page parent is unset: $page_key"
  elif grep -Fxq "$parent_key" "$TMP_KEYS"; then
    pass "parent key resolves for $page_key -> $parent_key"
  else
    fail "parent key does not resolve for $page_key -> $parent_key"
  fi
done <"$TMP_PARENTS"

echo
echo "== Validate private metadata =="
if [[ -f "$PRIVATE_MANIFEST" ]]; then
  while IFS=$'\t' read -r page_key doc_id url_id collection_id parent_doc_id; do
    [[ "$page_key" == "page_key" ]] && continue

    if [[ -z "$page_key" || -z "$doc_id" || -z "$url_id" || -z "$collection_id" || -z "$parent_doc_id" ]]; then
      fail "private manifest row has empty required field: $page_key"
      continue
    fi

    if grep -Fxq "$page_key" "$TMP_KEYS"; then
      true
    else
      fail "private manifest has key not in public manifest: $page_key"
      continue
    fi

    if grep -Fxq "$page_key" "$TMP_PRIV_KEYS"; then
      fail "duplicate private page_key: $page_key"
    else
      printf '%s\n' "$page_key" >>"$TMP_PRIV_KEYS"
    fi

    if grep -Fxq "$doc_id" "$TMP_PRIV_DOC_IDS"; then
      fail "duplicate private doc_id: $doc_id"
    else
      printf '%s\n' "$doc_id" >>"$TMP_PRIV_DOC_IDS"
    fi

    if grep -Fxq "$url_id" "$TMP_PRIV_URL_IDS"; then
      fail "duplicate private url_id: $url_id"
    else
      printf '%s\n' "$url_id" >>"$TMP_PRIV_URL_IDS"
    fi
  done <"$PRIVATE_MANIFEST"

  echo
  echo "== Validate required key coverage =="
  for required_key in "${required_keys[@]}"; do
    if grep -Fxq "$required_key" "$TMP_PRIV_KEYS"; then
      pass "required key has private metadata: $required_key"
    else
      fail "required key missing private metadata: $required_key"
    fi
  done

  while IFS= read -r public_key; do
    [[ -z "$public_key" ]] && continue
    if grep -Fxq "$public_key" "$TMP_PRIV_KEYS"; then
      pass "private manifest coverage exists for: $public_key"
    else
      fail "public key has no private metadata: $public_key"
    fi
  done <"$TMP_KEYS"
else
  warn "private metadata validation skipped: .ops/ol/manifest.private.tsv not found"
fi

echo
echo "== Validate required inventory =="
for required_key in "${required_keys[@]}"; do
  if grep -Fxq "$required_key" "$TMP_KEYS"; then
    pass "required page key exists: $required_key"
  else
    fail "required page key missing: $required_key"
  fi
done

echo
echo "== SHOULD checks =="
if [[ -f "$ROOT_DIR/ol/README.md" ]]; then
  if grep -Fq "ol/manifest.tsv" "$ROOT_DIR/ol/README.md"; then
    echo "[PASS][SHOULD] ol/README.md documents public manifest path"
  else
    warn "ol/README.md should document public manifest path"
  fi
else
  warn "ol/README.md should exist"
fi

echo
echo "== Summary =="
echo "PASS=$PASS_COUNT FAIL=$FAIL_COUNT WARN=$WARN_COUNT"

if ((FAIL_COUNT > 0)); then
  exit 1
fi
