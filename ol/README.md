# VibeWorkers OL System

이 디렉터리는 `LLM101.tools.Learn-is-doing`와 VibeWorkers OL 사이의 연결 정본이다.

핵심 원칙:
- 로컬 repo는 작업 자산과 상세 정본을 유지한다.
- VibeWorkers OL은 학생/운영자가 반복해서 보는 얇은 surface를 유지한다.
- OL 페이지는 로컬 문서를 그대로 복사한 mirror가 아니라, 로컬 정본을 바탕으로 다시 구성한 파생 페이지로 본다.

## Publishable SoT

- OL 연동 정본 경로: `ol/`
- 원격 문서 인벤토리 SoT: `ol/manifest.tsv`
- 페이지별 계약 문서 SoT: `ol/pages/*.md`
- 운영 메타(비공개) SoT: `.ops/ol/manifest.private.tsv` (GitHub 추적 제외)
- 로컬 검증 엔트리: `scripts/validate_vibeworkers_ol.sh`

## Current Collection

- collection name: `UrbanTech-Vibe`
- root doc:
  - title: `LLM101.Learn-is-Doing Lesson`
  - page key: `lesson-hub`

## Inventory

| key | remote title | local OL source contract | upstream local SoT |
| --- | --- | --- | --- |
| `lesson-hub` | `LLM101.Learn-is-Doing Lesson` | `ol/pages/lesson-hub.md` | `README.md`, `PROJECT_DEFINITION.md`, `LESSON_TEMPLATE.md` |
| `lesson-1` | `Lesson 1. 스킬을 활용해 리서치부터 글쓰기까지` | `ol/pages/lesson-1.md` | `lessons/lesson-1-research-writing/README.md` |
| `lesson-2` | `Lesson 2. Skill을 에이전트처럼 이해하고 내 과제에 맞게 remix하기` | `ol/pages/lesson-2.md` | `lessons/lesson-2-remix-skill-and-command/README.md`, `lessons/lesson-2-remix-skill-and-command/notes/progress-log.md`, `knol/agent-skills/skill-as-agent-shared-guide.md` |
| `workshop-90min-15` | `Workshop (90분 / 15명) 운영 패키지` | `ol/pages/workshop-90min-15.md` | `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-run-sheet.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-student-handout.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-d-1-preflight.md` |

## Update Sequence

1. upstream 로컬 정본을 먼저 수정한다.
2. 바뀐 내용을 기준으로 해당 `ol/pages/*.md` 계약 문서를 맞춘다.
3. 운영 메타 문서가 바뀌면 `.ops/ol/manifest.private.tsv`를 함께 갱신한다.
4. VibeWorkers OL 본문을 갱신한다.
5. `bash scripts/validate_vibeworkers_ol.sh`로 매핑/경로/중복을 검증한다.
6. `bash scripts/run_quality_gate.sh`로 tools 게이트를 닫는다.

## Guardrails

- 반복해서 다시 보는 안내는 OL 본문으로 올리고, 상세 구현/정본/작업 파일은 로컬에 둔다.
- `doc id`, `url id`, `parent doc id` 같은 운영 메타데이터는 `.ops/ol/manifest.private.tsv`에서만 관리한다.
- OL 본문에서 참조하는 lesson 흐름, git preflight, prompt 구조는 로컬 정본과 의미가 어긋나면 안 된다.
- local 폴더 전체를 학생 기본 surface로 삼지 않는다.

## Private manifest bootstrap

`.ops/ol/manifest.private.tsv`는 공개 저장소에 올라가면 안 됩니다.

1. `cp ol/manifest.private.example.tsv .ops/ol/manifest.private.tsv`
2. `vim .ops/ol/manifest.private.tsv` (또는 원하는 편집기)
3. 각 row의 `doc_id`, `url_id`, `collection_id`, `parent_doc_id` 값을 운영 환경 값으로 대체
4. `bash scripts/validate_vibeworkers_ol.sh` 실행

운영 환경 값은 외부로 유출되지 않도록 하드코딩/공개 배포에서 제거한 채, 개인 환경에서만 유지합니다.

## Drift Checks

- manifest row마다 `ol_source_file`과 `upstream_paths`가 모두 존재해야 한다.
- parent key는 같은 manifest 안에서만 참조한다.
- `page key`는 중복되면 안 된다.
- 원격 페이지 제목이 바뀌면 계약 문서와 manifest를 같이 갱신한다.
