# LLM101.Learn-is-Doing Combined

> Auto-generated file. Edit course README or lesson README files, then rebuild.

Included sources:
- README.md
- lessons/lesson-1-research-writing/README.md
- lessons/lesson-2-remix-skill-and-command/README.md

---

# LLM101.Learn-is-Doing

이 폴더는 `LLM101.Learn-is-Doing` 튜토리얼 시리즈의 tools 정본(course root)입니다.  
시리즈 이름은 `LLM101.Learn-is-Doing`이고, 현재 tools workspace의 실제 경로는 `LLM101.tools.Learn-is-doing/`입니다.  
기준 문서인 학생 실습용 Gemini CLI 튜토리얼을 lesson 단위 실행 자산으로 다시 정리해 둔 workspace입니다.

현재 포함된 lesson:
- [Lesson 1. 스킬을 활용해서 리서치부터 글쓰기까지](./lessons/lesson-1-research-writing/README.md)
- [Lesson 2. Skill을 에이전트처럼 이해하고 내 과제에 맞게 remix하기](./lessons/lesson-2-remix-skill-and-command/README.md)

워크숍 운영 문서:
- [Workshop Materials](./workshop/README.md)

프로젝트 정의:
- [PROJECT_DEFINITION.md](./PROJECT_DEFINITION.md)

기준 학습 문서:
- [학생 실습용: Gemini CLI 작업 워크플로](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md)

교재/심화 문서:
- [Gemini CLI 실습 교재 (MD 구조화 버전)](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-textbook.md)
- [학생 Task 중심 Gemini CLI 튜토리얼 (긴 버전)](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-structured.md)

공유 공식 가이드 허브:
- [knol/agent-skills/skill-as-agent-shared-guide.md](./knol/agent-skills/skill-as-agent-shared-guide.md)
- [knol/agent-skills/official-source-map.md](./knol/agent-skills/official-source-map.md)

## 0. 이 코스의 목적

이 코스는 위 기준 문서의 학생 실습 흐름을 재사용 가능한 lesson 형태로 옮긴 것입니다.

핵심 원칙:
- 기준은 `실제 작업 1개를 끝까지 굴리는 workflow` 입니다.
- lesson 1은 기준 문서의 `GEMINI.md 작성 -> SKILL 5개 -> custom command 2개 -> 첫 실행 -> revise loop`를 lesson 자산으로 정리한 버전입니다.
- lesson 2는 같은 흐름을 자기 과제에 맞게 최소 수정하되, skill을 `agent capability`로 읽는 extension 입니다.
- lesson 2 이후의 코스 공통 기준은 `프롬프트에 상황 정보 + 선언적 지식 + 절차적 지식이 모두 있어야 한다`는 점을 명시하는 것입니다.
- lesson 실행 전 현재 작업 폴더가 git repo 라면 `local sync`부터 점검하는 것을 기본 preflight로 둡니다.
- `Gemini CLI`, `Codex`, `Claude Code`를 별도 커리큘럼으로 나누지 않고, 같은 workflow와 산출물 구조를 유지한 채 필요한 차이만 따로 안내합니다.
- runtime별 skill 구조 차이는 `./knol/agent-skills/`의 공유 요약을 기준으로 통일합니다.

## 1. 가장 짧은 시작 순서

1. 기준 학습 문서 [`tutorial-gemini-cli-student-workflow.md`](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md) 를 한 번 읽습니다.
2. 현재 작업 폴더가 git repo 라면 `git status -sb`, `git fetch origin`, `git pull --ff-only` 순서로 local sync 가능 여부를 먼저 점검합니다.
3. 이번 주에 실제로 해야 하는 작업 1개를 문장으로 적습니다.
4. `lessons/lesson-1-research-writing/` 폴더를 현재 작업 환경으로 import 합니다.
5. `GEMINI.md`, `.gemini/`, `outputs/`를 현재 환경 규약에 맞게 불러옵니다.
6. `start` 단계에 해당하는 요청 1회를 실행합니다.
7. `outputs/`에 결과를 남깁니다.
8. 결과를 보고 `revise` 또는 `remix` 단계로 한 번 더 수정합니다.

권장 진행 순서:
- `lessons/lesson-1-research-writing/`
- `lessons/lesson-2-remix-skill-and-command/`

## 2. lesson 맵

### Lesson 1

- 목적: 학생의 실제 과제, 발표, 보고서, 학습 작업을 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기` 순서로 한 번 끝까지 돌립니다.
- 기준 근거:
  - 기준 문서의 `5) GEMINI.md 작성`
  - `6) Task용 작은 SKILL 제작`
  - `7) 오케스트레이션용 custom command 2개 만들기`
  - `8) 실제 작업에 적용`
  - `9) 결과 수정 루프`

### Lesson 2

- 목적: Lesson 1 예제를 버리지 않고 자기 과제에 맞게 최소 수정하되, skill을 `재사용 가능한 agent capability`로 이해합니다.
- 추가 기준: 프롬프트를 `상황 정보 + 선언적 지식 + 절차적 지식`으로 분해해 보고, 시작 전에 git local sync를 먼저 점검합니다.
- 기준 근거:
  - 기준 문서의 `9) 결과 수정 루프`
  - `10) 다음에 다시 쓸 때 기본 실행 패턴`
  - `12) 체크리스트`
- 공유 해설 근거:
  - `./knol/agent-skills/skill-as-agent-shared-guide.md`
  - `./knol/agent-skills/official-source-map.md`

## 3. 기준 실행 흐름

### 3-1. Gemini CLI

기준 문서에 직접 나온 기본 흐름을 그대로 씁니다.

- 준비물:
  - macOS 또는 Linux 터미널
  - Node.js 20+
  - 인터넷 연결
  - 개인 Google 계정 또는 Gemini API Key
  - 실제 작업 1개
- 설치 / 인증:
  - `npm install -g @google/gemini-cli`
  - `brew install gemini-cli`
  - 또는 `npx @google/gemini-cli`
- 확인:
  - `gemini --version`
  - `gemini`
  - `/about`
- lesson 자산을 가져온 뒤 필요하면 아래를 다시 읽습니다.

```text
/memory reload
/skills reload
/commands reload
```

### 3-2. Codex / Claude Code

기준 문서에는 Gemini CLI 단계가 상세히 적혀 있고, 이 코스에서는 같은 workflow를 다른 환경으로 옮길 때 필요한 차이만 적습니다.

공통 원칙:
- 실제 작업 1개를 적는 방식은 같습니다.
- 산출물 구조는 같은 뜻을 유지합니다.
- `GEMINI.md`의 규칙을 각 환경의 runtime 파일로 옮깁니다.
- `.gemini` 자산은 각 환경의 skill / command 구조로 다시 만듭니다.
- 현재 폴더가 git repo 라면 lesson 시작 전에 local sync 상태부터 확인합니다.
- 프롬프트를 설명할 때는 `상황 정보`, `선언적 지식`, `절차적 지식`을 분리하고, `출력 계약`은 선언적 지식의 닫기 단계로 둡니다.

필요할 때만 별도 안내:
- `Codex`: `GEMINI.md` -> `AGENTS.md`
- `Claude Code`: `GEMINI.md` -> `CLAUDE.md`
- native command가 없으면 lesson `README.md`의 시작 / 수정 요청을 plain prompt로 실행합니다.

## 4. 구조와 SoT

이 코스의 정본 경로는 아래처럼 나눕니다.
- course 공통 안내 SoT: `README.md`
- project 정의 SoT: `PROJECT_DEFINITION.md`
- lesson 템플릿 SoT: `LESSON_TEMPLATE.md`
- 합본 SoT: `COMBINED.md`
- 합본 생성 스크립트 SoT: `scripts/build_combined.sh`
- lesson 1 본문 SoT: `lessons/lesson-1-research-writing/README.md`
- lesson 1 runtime 규칙 SoT: `lessons/lesson-1-research-writing/GEMINI.md`
- lesson 2 본문 SoT: `lessons/lesson-2-remix-skill-and-command/README.md`
- lesson 2 runtime 규칙 SoT: `lessons/lesson-2-remix-skill-and-command/GEMINI.md`
- 기준 학습 문서 SoT: `../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md`
- shared agent-skills guide SoT: `knol/agent-skills/skill-as-agent-shared-guide.md`

현재 폴더 구조:

```text
LLM101.Learn-is-Doing/
├── README.md
├── PROJECT_DEFINITION.md
├── LESSON_TEMPLATE.md
├── COMBINED.md
├── scripts/
│   └── build_combined.sh
└── lessons/
    ├── lesson-1-research-writing/
    │   ├── README.md
    │   ├── GEMINI.md
    │   ├── .gemini/
    │   ├── outputs/
    │   └── notes/
    └── lesson-2-remix-skill-and-command/
        ├── README.md
        ├── GEMINI.md
        ├── .gemini/
        ├── outputs/
        └── notes/
```

## 5. 합본 정책

이 코스는 업데이트가 끝날 때마다 합본을 같이 관리합니다.

합본 원칙:
- 편집 대상은 `README.md`, `lessons/*/README.md`, `LESSON_TEMPLATE.md`
- 최종 합본은 `COMBINED.md`
- 합본은 직접 편집하지 않고 스크립트로 다시 생성합니다.

생성 명령:

```bash
bash scripts/build_combined.sh
```

## 6. Quality Gate 실행

문서 / lesson 자산을 수정한 뒤에는 아래 게이트를 실행합니다.

```bash
bash scripts/run_quality_gate.sh
```

해석 기준:
- `PASS`(exit code 0): Must 완료 조건 충족
- `FAIL`(exit code 1): 미완료. 로그에 나온 실패 항목부터 수정 후 재실행

---

<!-- BEGIN lessons/lesson-1-research-writing/README.md -->

# Lesson 1. 스킬을 활용해서 리서치부터 글쓰기까지

이 문서는 `LLM101.tools.Learn-is-doing/lessons/lesson-1-research-writing/` 폴더의 정본 lesson guide 입니다.  
시리즈 이름은 `LLM101.Learn-is-Doing`이지만, 현재 lesson 자산의 실제 경로는 위 tools workspace 기준입니다.  
course 공통 안내는 상위 폴더의 `../../README.md`를 보고, 현재 lesson 실행은 이 파일을 기준으로 진행합니다.

## 1. 이 lesson의 목표

이번 lesson의 목적은 하나입니다.
- 작은 Skill과 command를 써서 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기` 흐름을 한 번 끝까지 돌려보는 것

핵심은 세 가지입니다.
- 입력은 외부 글 읽기가 아니라 `이번 주에 실제로 해야 하는 작업 1개`입니다.
- 완벽한 결과보다 작은 성공 경험을 먼저 만듭니다.
- 예제 Skill과 command를 그대로 한 번 실행한 뒤, 자기 작업에 맞게 고칩니다.

## 2. 기준 학습 문서와 기본 연습 과제

기준 학습 문서:
- [학생 실습용: Gemini CLI 작업 워크플로](../../../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md)

이 lesson이 옮긴 기준 단계:
- `5) GEMINI.md 작성`
- `6) Task용 작은 SKILL 제작 (5개)`
- `7) 오케스트레이션용 custom command 2개 만들기`
- `8) 실제 작업에 적용`
- `9) 결과 수정 루프`

기본 연습 과제:
- `AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기`

원칙:
- 사용자가 별도 과제를 지정하지 않으면 위 기본 연습 과제로 시작합니다.
- lesson의 목표와 출력 형식은 기준 학습 문서의 학생 workflow를 그대로 따릅니다.
- `Codex`와 `Claude Code` 안내가 필요하더라도, 같은 workflow와 outputs를 유지한 채 필요한 차이만 따로 적습니다.

## 3. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
  - 현재 lesson 실행 가이드
- `GEMINI.md`
  - lesson runtime 규칙 정본
- `.gemini/skills/research-task/SKILL.md`
  - 리서치 시작용 예시 Skill
- `.gemini/skills/organize-task/SKILL.md`
  - 정리용 예시 Skill
- `.gemini/skills/analysis-task/SKILL.md`
  - 분석용 예시 Skill
- `.gemini/skills/writing-task/SKILL.md`
  - 초안 작성용 예시 Skill
- `.gemini/skills/revise-task/SKILL.md`
  - 수정용 예시 Skill
- `.gemini/commands/taskflow/start.toml`
  - 리서치부터 초안까지 시작하는 예시 command
- `.gemini/commands/taskflow/revise.toml`
  - 초안을 기준으로 다듬는 예시 command
- `outputs/`
  - lesson 산출물 저장 폴더
- `notes/`
  - lesson 메모 폴더

## 4. 먼저 고를 것: 이번 주에 실제로 해야 하는 작업 1개

좋은 시작 과제 예시:
- 발표 자료 조사해서 초안 만들기
- 비교 보고서 구조 잡기
- 사회심리학 과제 초안 쓰기
- 팀플 발표용 5분 스크립트 초안 만들기

처음에는 피하는 것이 좋은 과제:
- 너무 넓은 주제 하나 전체 공부하기
- 아직 마감이나 제출 맥락이 없는 추상 주제
- 한 번에 너무 긴 최종 결과물을 만들려는 과제

계속 기억할 문장:
- 리서치는 그럴듯한 문장을 만드는 단계가 아니라 근거를 모으는 단계입니다.
- 정리는 요약과 구조화를 분리하면 더 안전합니다.
- 분석은 느낌이 아니라 주장과 근거를 연결하는 일입니다.
- 초안은 완벽할 필요가 없습니다. 대신 근거가 달린 문장으로 끝까지 써보는 것이 먼저입니다.
- 작은 Skill은 큰 이론서가 아니라, 하나의 Task를 덜 막히게 하는 작은 도우미입니다.

## 5. Lesson 1 실행하기

세 환경 공통 원칙:
- 실제 작업 1개를 먼저 적습니다.
- 사용자가 별도 과제를 주지 않았다면 기본 연습 과제를 그대로 씁니다.
- 산출물 의미는 `research -> outline -> analysis -> draft -> revision` 순서를 유지합니다.

### 5-1. 공통 시작 요청

환경과 상관없이 아래 뜻으로 시작하면 됩니다.

```text
이 lesson-1 research-writing workflow를 사용해서
"예시: AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기"
작업을 시작해줘.
가능하면 outputs/research.md부터 제안해줘.
```

이 요청은 보통 아래 흐름으로 이어집니다.
- `research-task` 기준으로 질문과 검색 키워드를 잡기
- `organize-task` 기준으로 자료를 구조화하기
- `analysis-task` 기준으로 주장과 근거를 연결하기
- `writing-task` 기준으로 초안을 만들기

### 5-2. Gemini CLI

`.gemini`를 그대로 사용하고 아래 command를 실행합니다.

```text
/taskflow:start "AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기"
```

필요하면 아래를 다시 읽습니다.

```text
/memory reload
/skills reload
/commands reload
```

### 5-3. Codex / Claude Code가 필요할 때만

공통 원칙:
- 같은 workflow와 outputs를 유지합니다.
- `GEMINI.md` 규칙을 현재 환경 runtime 파일로 옮깁니다.
- native command가 없으면 같은 뜻의 plain prompt를 사용합니다.

`Codex`
- `GEMINI.md` -> `AGENTS.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Codex 구조로 옮깁니다.

```text
$skill-creator
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 lesson-1 research-writing skill과 command 구조를 만들어줘.
산출물 의미는 research -> outline -> analysis -> draft -> revision 순서를 유지해줘.
```

`Claude Code`
- `GEMINI.md` -> `CLAUDE.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Claude Code 구조로 옮깁니다.

```text
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 Lesson 1 skill과 custom command 구조로 옮겨줘.
산출물 의미는 research -> outline -> analysis -> draft -> revision 순서를 유지해줘.
```

### 5-4. 추천 산출물

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/research.md`
- `outputs/outline.md`
- `outputs/analysis.md`
- `outputs/draft.md`

### 5-5. 초안 다듬기

초안을 만든 뒤에는 세 환경 모두 아래 뜻으로 다듬으면 됩니다.

```text
이 lesson-1 revise workflow를 사용해서
"문장을 더 짧고 명확하게. 근거 없는 부분은 확인 필요로 표시. 발표용으로 읽기 쉽게."
작업을 진행해줘.
```

`Gemini CLI`에서는 아래 command를 그대로 실행할 수 있습니다.

```text
/taskflow:revise "문장을 더 짧고 명확하게. 근거 없는 부분은 확인 필요로 표시. 발표용으로 읽기 쉽게."
```

수정 결과는 보통 아래 파일로 정리하면 됩니다.
- `outputs/revision.md`

## 6. Lesson 1을 처음 실행할 때 가장 안전한 순서

1. 이번 주 실제 과제 1개 고르기
2. 현재 환경에서 lesson 자산을 한 번 불러오기
3. `start` 단계에 해당하는 시작 요청을 1회 실행하기
4. `outputs/research.md`부터 `outputs/draft.md`까지 가능한 만큼 저장하기
5. `revise` 단계까지 1회 돌려보기
6. 결과를 보고 `GEMINI.md` 또는 해당 Skill 1개를 작은 수정으로 고치기

## 7. 추천 실습 시나리오

### 시나리오 0. 기본 연습 과제

```text
이 lesson-1 research-writing workflow를 사용해서
"AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기"
작업을 시작해줘.
```

### 시나리오 A. 사회심리학 과제 초안

```text
이 lesson-1 research-writing workflow를 사용해서
"사회심리학 과제 초안을 쓰기 위해 관련 논문 3편 비교표와 5문단 초안을 만들기"
작업을 시작해줘.
```

### 시나리오 B. 팀플 발표 스크립트

```text
이 lesson-1 research-writing workflow를 사용해서
"팀플 발표용 5분 스크립트 초안을 만들기"
작업을 시작해줘.
```

## 8. 막힐 때 쓰는 문장

### 리서치가 막힐 때

```text
주제를 더 작은 작업 단위로 바꿔줘.
이번 주 안에 끝낼 수 있는 질문 3개로 줄여줘.
```

### 정리가 막힐 때

```text
요약과 구조화를 분리해서 해줘.
먼저 핵심 5줄 요약, 그 다음 분류 체계를 제안해줘.
```

### 분석이 막힐 때

```text
주장, 근거, 반론, 한계를 분리해서 보여줘.
느낌이 아니라 근거 연결로 다시 써줘.
```

### 초안이 막힐 때

```text
완벽한 글 말고 끝까지 갈 수 있는 초안으로 먼저 써줘.
근거가 약한 문장은 표시해줘.
```

### 수정이 막힐 때

```text
강점 3개, 리스크 3개, 문장 수정 예시 10개로 나눠서 보여줘.
```

<!-- END lessons/lesson-1-research-writing/README.md -->

---

<!-- BEGIN lessons/lesson-2-remix-skill-and-command/README.md -->

# Lesson 2. Skill을 에이전트처럼 이해하고 내 과제에 맞게 remix하기

이 문서는 `LLM101.tools.Learn-is-doing/lessons/lesson-2-remix-skill-and-command/` 폴더의 정본 lesson guide 입니다.  
시리즈 이름은 `LLM101.Learn-is-Doing`이지만, 현재 lesson 자산의 실제 경로는 위 tools workspace 기준입니다.  
course 공통 안내는 상위 폴더의 `../../README.md`를 보고, 현재 lesson 실행은 이 파일을 기준으로 진행합니다.

## 1. 이 lesson의 목표

이번 lesson의 목적은 두 가지를 한 번에 잡는 것입니다.
- `skill`을 `재사용 가능한 마이크로 에이전트 역량`으로 이해한다
- 그 관점으로 `Lesson 1`의 예제 Skill과 command를 자기 과제에 맞게 다시 설계한다

이번 lesson에서 학생이 가져가야 할 핵심 결론:
- skill은 단순한 문장 묶음이 아니라 `역할 + 트리거 + 절차 + 자원 + 출력 계약`을 가진 작은 agent capability 입니다.
- `Gemini`, `Codex`, `Agent Skills` 표준은 skill을 거의 같은 방향으로 설명합니다.
- `Claude Code`도 skill을 지원하지만, 공식 문서에서는 `skill`과 `subagent`를 분리합니다.
- 프롬프트는 실전에서 `선언적 지식`, `절차적 지식`, `상황 정보`가 같이 있어야 안정적으로 작동합니다.
- 선언적 지식은 보통 앞에서는 문제 정의로, 뒤에서는 `출력 계약`으로 다시 닫힙니다.

이번 lesson의 실습 단위:
- 기존 예제 Skill 1개를 `에이전트 구조`로 다시 읽고
- 자기 과제에 맞는 Skill 1개와 command 1개 초안을 만든다

## 2. Glossary

- `skill`
  - 특정 작업을 안정적으로 수행하게 만드는 재사용 가능한 역량 단위
- `subagent`
  - 별도 컨텍스트와 권한으로 독립 실행되는 delegated agent
- `선언적 지식`
  - 무엇을 해야 하는지, 어떤 상태를 목표로 하는지, 어떤 제약과 용어를 지키는지에 대한 지식
- `절차적 지식`
  - 어떤 순서와 판단 규칙으로 작업을 수행하는지에 대한 지식
- `상황 정보`
  - 지금 어떤 과제를 다루는지, 어떤 파일/산출물/환경에서 작업하는지, 현재 어디서 막혔는지처럼 현재 상태를 고정하는 정보
- `출력 계약`
  - 최종 산출물 형식, 평가 기준, 예시, 금지사항처럼 결과를 닫아 주는 규칙

## 3. 기준 학습 문서와 기본 연습 과제

기준 학습 문서:
- [학생 실습용: Gemini CLI 작업 워크플로](../../../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md)

공유 공식 가이드:
- [skill-as-agent shared guide](../../knol/agent-skills/skill-as-agent-shared-guide.md)
- [official source map](../../knol/agent-skills/official-source-map.md)

이 lesson이 옮긴 기준 단계:
- `9) 결과 수정 루프`
- `10) 다음에 다시 쓸 때 기본 실행 패턴`
- `12) 체크리스트`

기본 연습 과제:
- `Lesson 1으로 만든 workflow에서 안 맞았던 지점 1개를 찾아, 그 차이를 설명할 수 있는 Skill 1개와 command 1개만 다시 설계하기`

원칙:
- 사용자가 별도 과제를 지정하지 않으면 위 기본 연습 과제로 시작합니다.
- lesson의 기준은 `기존 workflow를 버리지 않고 agent 구조를 더 잘 드러내는 최소 수정` 입니다.
- `Codex`와 `Claude Code` 안내가 필요하더라도, 같은 workflow와 outputs를 유지한 채 필요한 차이만 따로 적습니다.

## 4. 왜 skill을 agent처럼 가르치는가

공식 문서를 기준으로 보면 공통점이 분명합니다.

빠른 역추적:
- vendor별 1차 출처 URL은 `../../knol/agent-skills/official-source-map.md`에 모아 둡니다.
- lesson에서 직접 인용할 공용 문장은 `../../knol/agent-skills/skill-as-agent-shared-guide.md`를 기준으로 씁니다.

- `Codex`
  - skill을 `task-specific capabilities`와 `reusable workflows`의 저작 형식으로 설명합니다.
  - skill은 `instructions, resources, optional scripts`를 묶는 디렉터리입니다.
- `Gemini CLI`
  - skill을 `specialized expertise`, `procedural workflows`, `task-specific resources`를 담는 self-contained directory 로 설명합니다.
- `Agent Skills`
  - skill을 AI agent capability를 확장하는 `lightweight, open format`으로 설명합니다.
  - 핵심 구조도 `SKILL.md + scripts/references/assets` 입니다.
- `Claude Code`
  - skill은 분명 존재하지만, 공식 문서에서 별도로 `subagent`를 `specialized AI assistants`로 정의합니다.
  - 그래서 Claude에서는 `skill = agent`라고 딱 잘라 말하기보다, `skill은 agent를 움직이게 하는 playbook이고, subagent는 더 분리된 실행 단위`라고 이해하는 편이 정확합니다.

이번 lesson에서는 학생 이해를 위해 아래처럼 정리합니다.

- 실전 학습 관점:
  - `skill은 agent처럼 생각해도 된다`
- 공식 구분 관점:
  - `Gemini / Codex / Agent Skills`에서는 이 비유가 거의 곧바로 맞는다
  - `Claude`에서는 `skill`과 `subagent`를 구분해야 한다

이렇게 가르치면 학생은 두 가지를 동시에 얻습니다.
- 왜 skill이 단순 프롬프트 조각이 아닌지 이해할 수 있다
- runtime마다 어디까지가 skill이고 어디부터가 별도 agent인지 구분할 수 있다

## 5. skill이 가져야 할 기본 구조

이번 lesson에서 skill은 아래 8개 블록으로 읽고 설계합니다.

1. `Identity`
   - 이름, 역할, 이 skill이 맡는 일 1문장
2. `Trigger`
   - 언제 켜지고 언제 켜지지 말아야 하는가
3. `Input Contract`
   - 어떤 입력이 있으면 충분한가
4. `Output Contract`
   - 어떤 형식과 수준으로 결과를 내야 하는가
5. `Procedure`
   - 어떤 순서와 판단 규칙으로 움직이는가
6. `Resources`
   - scripts, references, templates, example outputs
7. `Guardrails / Gotchas`
   - 자주 틀리는 지점, 금지사항, 환경 제약
8. `Verification`
   - 테스트 프롬프트, 체크리스트, 산출물 평가 기준

짧게 요약하면:
- `좋은 skill = 역할 설명 + 자동 호출 설명 + 실행 절차 + 출력 계약 + 실패 방지 장치`

이번 lesson에서 학생에게 특히 강조할 것:
- `description`은 단순 소개문이 아니라 `트리거 계약`이다
- workflow가 길어질수록 `절차`는 stepwise 하게 적어야 한다
- output 예시는 장식이 아니라 `검증 장치`다
- references와 scripts는 본문을 짧게 유지하게 해 주는 `progressive disclosure` 장치다

## 6. Claude / Codex / Gemini / Agent Skills 비교 포인트

### 6-1. 공통점

- 셋 다 `SKILL.md` 중심 구조를 쓴다
- 셋 다 `name + description`을 핵심 메타데이터로 본다
- 셋 다 skill을 필요할 때만 불러오는 `on-demand capability`로 다룬다
- 셋 다 scripts / references / assets 같은 보조 파일을 둘 수 있다

### 6-2. 차이점

`Gemini CLI`
- `.gemini/skills/` 또는 `.agents/skills/` 를 쓴다
- skill activation 전에 description 기반 매칭과 사용자 승인 흐름이 있다
- procedural guidance를 우선 적용하도록 설계돼 있다

`Codex`
- `.agents/skills/` 를 중심으로 skill을 읽는다
- skill은 reusable workflow 이고, `subagent`는 명시적으로 spawn 하는 별도 실행 단위다
- `description` 경계가 명확해야 implicit invocation 품질이 올라간다

`Claude Code`
- `.claude/skills/` 를 쓴다
- skill도 자동/수동 호출이 가능하다
- 다만 공식 문서상 `specialized AI assistant`라는 표현은 subagent에 더 강하게 붙는다

`Agent Skills`
- 특정 제품이 아니라 open format 이다
- skill을 `lightweight, open format`과 `specialized knowledge and workflows`의 묶음으로 설명한다
- 그래서 여러 agent 런타임 사이의 공통 구조를 설명할 때 기준점으로 쓰기 좋다

### 6-3. 학생에게 전달할 한 문장

- `skill은 agent가 특정 일을 하게 만드는 재사용 가능한 설계도이고, 어떤 환경에서는 그 자체가 agent처럼 작동하며, 어떤 환경에서는 subagent를 움직이는 playbook 역할까지 겸한다`

## 7. 프롬프트는 왜 `선언적 지식 + 절차적 지식 + 상황 정보`가 필요한가

이번 lesson에서는 프롬프트의 필수 재료를 아래 3가지로 가르칩니다.
실제 문장 배치는 보통 `상황 정보 -> 앞 선언적 지식 -> 절차적 지식 -> 뒤 선언적 지식(출력 계약)`으로 정리합니다.

### 7-1. 상황 정보

먼저 `지금 이 작업이 어떤 맥락에서 실행되는지`를 고정합니다.

예시:
- 현재 과제
- 기존 산출물 상태
- 작업 중인 폴더 / 파일 / runtime
- Lesson 1에서 실제로 안 맞았던 지점
- 현재 막힌 부분
- 제출 형식이나 마감 조건

이 부분이 약하면 agent는 일반론을 말하거나, 지금 다루는 mismatch를 놓치기 쉽습니다.

### 7-2. 선언적 지식

먼저 `무엇을 왜 해야 하는지`를 고정합니다.

예시:
- 역할
- 작업 목적
- 핵심 용어
- 입력 자료
- 제약조건
- 하지 말아야 할 것

이 부분이 약하면 agent는 과제의 중심을 자주 놓칩니다.

선언적 지식은 보통 두 군데에 들어갑니다.
- 앞 선언적 지식
  - 목표, 역할, 제약, 용어 정의
- 뒤 선언적 지식
  - 출력 계약, 루브릭, 예시, 금지 형식

즉, `출력 계약`도 선언적 지식의 일부입니다.

### 7-3. 절차적 지식

다음으로 `어떻게 움직일지`를 적습니다.

예시:
- 단계 순서
- 우선순위
- 판단 분기
- 도구 사용 순서
- 실패 시 대응
- 중간 산출물

이 부분이 약하면 agent는 같은 목표를 알아도 매번 다른 방식으로 헤매기 쉽습니다.

짧게 정리하면:
- 상황 정보 = `현재 작업 프레임`
- 선언적 지식 = `문제 정의 + 결과 계약`
- 절차적 지식 = `행동 규칙`

이번 lesson에서는 학생이 이 3요소를 항상 분리해서 보게 하고, 선언적 지식은 앞/뒤 두 위치로 배치할 수 있다고 설명합니다.

## 8. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
  - 현재 lesson 실행 가이드
- `GEMINI.md`
  - lesson runtime 규칙 정본
- `.gemini/skills/remix-task/SKILL.md`
  - skill을 agent처럼 읽고 자기 과제에 맞게 재설계하는 예시 Skill
- `.gemini/commands/remix/start.toml`
  - skill 구조와 prompt 구조를 잡는 예시 command
- `.gemini/commands/remix/review.toml`
  - draft를 점검하고 테스트 프롬프트를 만드는 예시 command
- `outputs/`
  - lesson 산출물 저장 폴더
- `notes/`
  - lesson 메모 폴더

## 9. 먼저 고를 것: 내 작업에서 어디가 안 맞았는가

좋은 시작 과제 예시:
- 발표문 작업인데 Lesson 1 산출물이 너무 글쓰기 중심이라 안 맞았다
- 보고서 구조는 잡혔지만, 필요한 출력 형식이 내 과제와 달랐다
- 리서치보다 인터뷰 정리나 사례 비교가 더 중요한 과제였다
- command는 좋았지만, 내 수업 제출 형식과 파일 이름이 안 맞았다

처음에는 피하는 것이 좋은 과제:
- lesson 전체를 한 번에 갈아엎으려는 작업
- skill 5개와 command 5개를 동시에 바꾸려는 작업
- 아직 실제 과제가 정해지지 않은 상태에서 구조만 크게 설계하는 작업

계속 기억할 문장:
- Lesson 2의 핵심은 `무작정 새로 만들기`보다 `기존 skill을 agent 구조로 다시 읽기`입니다.
- 큰 설계를 새로 만드는 것보다, 안 맞는 지점 3개를 agent 구조로 다시 해석하는 편이 더 빠릅니다.
- 좋은 customization은 구조를 늘리는 것이 아니라 `트리거, 절차, 출력 계약`을 선명하게 만드는 것입니다.
- 이번 lesson에서는 Skill 1개, command 1개, 산출물 이름 1세트만 바꿔도 충분합니다.

## 10. Lesson 2 실행하기

세 환경 공통 원칙:
- Lesson 1에서 실제로 안 맞았던 지점 1개를 먼저 고릅니다.
- 사용자가 별도 과제를 주지 않았다면 기본 연습 과제를 그대로 씁니다.
- 기존 workflow를 버리지 않고 mismatch를 줄이는 방향으로 수정합니다.
- 수정 전에는 반드시 `이 skill이 어떤 agent 역할을 못 하고 있는가`를 먼저 말로 적습니다.

### 10-1. 시작 전 local sync

현재 lesson 자산이 git repo 안에 있다면, 시작 전에 local sync를 먼저 점검해 봅니다.

권장 순서:
1. 현재 상태 확인

```bash
git status -sb
git branch --show-current
```

2. 원격 최신 이력 가져오기

```bash
git fetch origin
```

3. working tree가 깨끗하면 fast-forward pull 시도

```bash
git pull --ff-only
```

메모:
- 로컬 변경이 있으면 pull 전에 현재 변경을 먼저 정리합니다.
- lesson 2는 기존 예제를 최소 수정하는 단계이므로, 시작 전에 local 기준선을 맞춰 두는 편이 비교와 remix가 쉬워집니다.

### 10-2. 공통 시작 요청

환경과 상관없이 아래 뜻으로 시작하면 됩니다.

```text
먼저 지금 작업 폴더가 git repo라면 local sync가 필요한지 확인해줘.
이 lesson-2 remix workflow를 사용해서
"예시: Lesson 1의 산출물이 보고서 중심이라, 인터뷰 정리 과제에 맞게 Skill 1개와 command 1개만 고치고 싶다.
그리고 이 skill을 하나의 agent capability로 보면 어떤 구조를 가져야 하는지도 같이 정리해줘."
작업을 시작해줘.
가능하면 outputs/01_skill_as_agent_note.md부터 제안해줘.
```

이 요청은 보통 아래 흐름으로 이어집니다.
- 현재 작업 1문장 정리
- Lesson 1과 안 맞는 지점 3개 식별
- 그대로 유지할 요소 3개 식별
- 현재 skill을 agent처럼 보면 무엇이 비어 있는지 정리
- 새 Skill 초안 제안
- 새 command 초안 제안
- 프롬프트의 `상황 정보 + 선언적 지식 + 절차적 지식` 분해 제안

### 10-3. Gemini CLI

`.gemini`를 그대로 사용하고 아래 command를 실행합니다.

```text
/remix:start "먼저 현재 작업 폴더가 git repo라면 local sync 필요 여부를 확인해줘. Lesson 1의 산출물이 보고서 중심이라, 인터뷰 정리 과제에 맞게 Skill 1개와 command 1개만 고치고 싶다. 이 skill을 agent capability처럼 다시 설계하고 싶다."
```

필요하면 아래를 다시 읽습니다.

```text
/memory reload
/skills reload
/commands reload
```

### 10-4. Codex / Claude Code가 필요할 때만

공통 원칙:
- 같은 remix workflow를 유지합니다.
- `GEMINI.md` 규칙을 현재 환경 runtime 파일로 옮깁니다.
- native command가 없으면 같은 뜻의 plain prompt를 사용합니다.

`Codex`
- `GEMINI.md` -> `AGENTS.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Codex 구조로 옮깁니다.
- skill은 reusable workflow 로, subagent는 별도 delegated execution 으로 구분해 설명합니다.

`Claude Code`
- `GEMINI.md` -> `CLAUDE.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Claude Code 구조로 옮깁니다.
- skill과 subagent가 공식적으로 분리된다는 점을 함께 설명합니다.

### 10-5. 추천 산출물

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/01_skill_as_agent_note.md`
- `outputs/02_runtime_comparison.md`
- `outputs/03_skill_draft.md`
- `outputs/04_prompt_decomposition.md`
- `outputs/05_command_draft.md`

### 10-6. draft 검토

초안을 만든 뒤에는 세 환경 모두 아래 뜻으로 다듬으면 됩니다.

```text
이 lesson-2 remix review workflow를 사용해서
"지금 만든 skill / command draft를 검토해서
agent 구조가 빠진 부분은 보완하고,
과한 부분은 줄이고,
바로 실행 가능한 테스트 프롬프트 3개를 만들어줘."
작업을 진행해줘.
```

`Gemini CLI`에서는 아래 command를 그대로 실행할 수 있습니다.

```text
/remix:review "지금 만든 skill/command draft를 검토해서 agent 구조가 빠진 부분은 보완하고, 과한 부분은 줄이고, 바로 실행 가능한 테스트 프롬프트 3개를 만들어줘."
```

수정 결과는 보통 아래 파일로 정리하면 됩니다.
- `outputs/06_test_prompt.md`
- `outputs/07_revision_notes.md`

## 11. Lesson 2를 처음 실행할 때 가장 안전한 순서

1. lesson 자산이 들어 있는 현재 폴더가 git repo인지 확인하기
2. git repo라면 `git fetch origin`과 `git pull --ff-only`로 local sync 가능 여부 먼저 점검하기
3. Lesson 1에서 실제로 안 맞았던 지점 1개 고르기
4. 그 차이를 `이 skill이 무슨 agent 역할을 못 하고 있는가`로 다시 말해 보기
5. 바꿀 대상은 Skill 1개와 command 1개로 제한하기
6. 현재 환경에서 lesson 자산을 한 번 불러오기
7. `remix:start` 단계에 해당하는 시작 요청을 1회 실행하기
8. `outputs/01~05`까지 저장하기
9. `remix:review` 단계까지 1회 돌려보기
10. 그 다음 자기 과제에 맞게 실제 파일 수정 범위를 결정하기

## 12. 추천 실습 시나리오

### 시나리오 0. 기본 연습 과제

```text
이 lesson-2 remix workflow를 사용해서
"Lesson 1으로 만든 workflow에서 안 맞았던 지점 1개를 찾아
Skill 1개와 command 1개만 고치기.
그리고 그 skill을 agent capability로 보면 어떤 구조가 필요한지 함께 설명하기."
작업을 시작해줘.
```

### 시나리오 A. 인터뷰 정리형 과제

```text
이 lesson-2 remix workflow를 사용해서
"Lesson 1 흐름을 인터뷰 정리와 인사이트 정리 중심으로 바꾸고 싶다.
skill을 에이전트처럼 보면 어떤 입력/절차/출력 계약이 필요한지 같이 정리해줘."
작업을 시작해줘.
```

### 시나리오 B. 제출 형식 맞추기

```text
이 lesson-2 remix workflow를 사용해서
"Lesson 1 command를 보고서 제출 형식에 맞게 바꾸고 싶다.
프롬프트에 필요한 상황 정보, 선언적 지식, 절차적 지식을 다시 분해해줘."
작업을 시작해줘.
```

### 시나리오 C. 구조 비교형 과제

```text
Claude, Codex, Gemini 관점에서
"좋은 skill은 어떤 agent 구조를 가져야 하는가"
를 비교하고,
그 비교를 바탕으로 내 과제용 skill 초안을 만들어줘.
```

## 13. 막힐 때 쓰는 문장

### 시작이 막힐 때

```text
새 구조를 만들지 말고 Lesson 1에서 안 맞는 지점 3개만 먼저 찾아줘.
그리고 그 차이를 skill이 못 맡고 있는 agent 역할 3개로 바꿔서 말해줘.
```

### 구조가 막힐 때

```text
이 skill을
역할 / 트리거 / 입력 / 출력 / 절차 / 가드레일
6개 블록으로만 다시 정리해줘.
```

### 수정이 막힐 때

```text
지금 draft에서 과한 부분을 줄여줘.
프롬프트를 상황 정보 / 선언적 지식 / 절차적 지식으로 다시 나눠주고,
선언적 지식은 결과 계약까지 닫히게 정리해줘.
바로 테스트 가능한 프롬프트 3개만 남겨줘.
```

## 14. 이 lesson의 최소 완료선

이번 lesson은 아래 세 가지가 나오면 닫을 수 있습니다.

- `skill을 agent처럼 볼 수 있는 이유`를 3~5문장으로 설명할 수 있다
- `Claude / Codex / Gemini / Agent Skills`의 공통점과 차이점을 1장 표나 bullet로 정리할 수 있다
- 자기 과제용 Skill 1개와 command 1개를 `상황 정보 + 선언적 지식 + 절차적 지식` 관점으로 다시 쓸 수 있다

<!-- END lessons/lesson-2-remix-skill-and-command/README.md -->
