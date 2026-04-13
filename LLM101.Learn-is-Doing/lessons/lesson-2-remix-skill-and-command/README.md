# Lesson 2. 예제 스킬과 command를 내 과제에 맞게 고쳐 쓰기

이 문서는 `LLM101.Learn-is-Doing/lessons/lesson-2-remix-skill-and-command/` 폴더의 정본 lesson guide 입니다.  
course 공통 안내는 상위 폴더의 `../../README.md`를 보고, 현재 lesson 실행은 이 파일을 기준으로 진행합니다.

## 1. 이 lesson의 목표

이번 lesson의 목적은 하나입니다.
- `Lesson 1`에서 받은 예제 Skill과 command를 자기 과제에 맞게 한 번 직접 고쳐 보는 것

핵심은 세 가지입니다.
- 새 도구를 더 만드는 것이 아니라, 기존 예제를 자기 작업에 맞게 바꿉니다.
- Skill 1개와 command 1개만 바꿔도 작업 흐름은 크게 달라질 수 있음을 체감합니다.
- 완성형 프레임워크보다 먼저, 자기 과제에 맞는 최소 동작 버전을 남깁니다.

## 2. 학습 문서 정본과 기본 예제 교재

학습 문서 정본:
- [Gemini CLI로 리서치부터 글쓰기까지](https://gyung.me/68nHrk)

기본 예제 교재:
- `https://gyung.me/68nHrk`

원칙:
- 사용자가 별도 교재를 지정하지 않으면 위 문서를 기준 텍스트로 사용합니다.
- Lesson 2에서는 가능하면 Lesson 1에서 막혔던 실제 과제를 기준으로 수정합니다.

## 3. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
  - 현재 lesson 실행 가이드
- `GEMINI.md`
  - Gemini runtime 규칙
- `.gemini/skills/remix-task/SKILL.md`
  - 기존 흐름을 자기 과제에 맞게 재설계하는 예시 Skill
- `.gemini/commands/remix/start.toml`
  - Skill과 command 수정 방향을 잡는 예시 command
- `.gemini/commands/remix/review.toml`
  - draft를 점검하고 테스트 프롬프트를 만드는 예시 command
- `outputs/`
  - lesson 산출물 저장 폴더
- `notes/`
  - lesson 메모 폴더

## 4. 먼저 고를 것: 내 작업에서 어디가 안 맞았는가

좋은 시작 과제 예시:
- 발표문 작업인데 `Lesson 1`의 산출물이 너무 글쓰기 중심이라 안 맞았다
- 보고서 구조는 잡혔지만, 필요한 출력 형식이 내 과제와 달랐다
- 리서치보다 인터뷰 정리나 사례 비교가 더 중요한 과제였다
- command는 좋았지만, 내 수업 제출 형식과 파일 이름이 안 맞았다

처음에는 피하는 것이 좋은 과제:
- lesson 전체를 한 번에 갈아엎으려는 작업
- skill 5개와 command 5개를 동시에 바꾸려는 작업
- 아직 실제 과제가 정해지지 않은 상태에서 구조만 크게 설계하는 작업

계속 기억할 문장:
- Lesson 2의 핵심은 창조보다 수정입니다.
- 큰 설계를 새로 만드는 것보다, 안 맞는 지점 3개를 고치는 편이 더 빠릅니다.
- 좋은 customization은 구조를 늘리는 것이 아니라 마찰을 줄이는 것입니다.
- 이번 lesson에서는 Skill 1개, command 1개, 산출물 이름 1세트만 바꿔도 충분합니다.

## 5. Lesson 2를 Gemini에서 실행하기

### 5-1. 시작 command

이번에는 과제와 함께 `Lesson 1`에서 어디가 안 맞았는지를 같이 적습니다.

```text
/remix:start "예시: 인터뷰 기반 발표문 과제다. Lesson 1의 research-task와 taskflow:start를 인터뷰 정리 중심으로 바꾸고 싶다."
```

기본 예제 교재로 먼저 연습하려면 아래처럼 시작합니다.

```text
/remix:start "기본 예제 교재 https://gyung.me/68nHrk 를 기준으로 Lesson 1의 흐름을 10분 워크숍용 발표안 제작에 맞게 바꾸고 싶다."
```

이 command는 보통 아래 흐름으로 안내합니다.
- 현재 작업 1문장 정리
- Lesson 1과 안 맞는 지점 3개 식별
- 새 Skill 초안 제안
- 새 command 초안 제안
- 산출물 파일명과 테스트 순서 제안

### 5-2. 추천 산출물

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/01_workflow_gap.md`
- `outputs/02_skill_draft.md`
- `outputs/03_command_draft.md`

### 5-3. draft 검토

초안을 만든 뒤 아래를 실행합니다.

```text
/remix:review "예시: 지금 만든 skill/command draft를 검토해서 과한 부분은 줄이고, 바로 실행 가능한 테스트 프롬프트 3개를 만들어줘."
```

수정 결과는 보통 아래 파일로 정리하면 됩니다.
- `outputs/04_test_prompt.md`
- `outputs/05_revision_notes.md`

## 6. 다른 LLM 환경으로 옮길 때

공통 원칙:
- 공통 흐름은 현재 lesson 폴더의 `README.md`를 기준으로 봅니다.
- Gemini runtime 규칙은 현재 lesson 폴더의 `GEMINI.md`에서 가져갑니다.
- `.gemini` 자산은 각 환경의 기본 skill creator로 다시 만듭니다.

### 6-1. Codex 예시 요청

```text
$skill-creator
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 lesson-2 remix skill을 만들어줘.
산출물은 outputs/를 유지하고, 레슨 목표와 예시는 이 폴더의 README.md를 기준으로 맞춰줘.
```

실행 예시:

```text
이 프로젝트의 lesson-2 remix workflow를 사용해서
"Lesson 1의 research-task와 taskflow:start를 인터뷰 정리 과제에 맞게 바꾸기"
작업을 시작해줘.
먼저 outputs/01_workflow_gap.md 초안부터 제안해줘.
```

### 6-2. Claude Code 예시 요청

```text
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 Lesson 2 skill과 custom command 구조로 옮겨줘.
공통 규칙은 CLAUDE.md로, 레슨 목표와 예시는 현재 lesson 폴더 README.md를 기준으로 맞춰줘.
산출물은 outputs/에 저장하게 해줘.
```

실행 예시:

```text
이 프로젝트의 lesson-2 remix workflow를 사용해서
"Lesson 1의 command를 내 발표 과제 제출 형식에 맞게 바꾸기"
작업을 시작해줘.
먼저 불일치 지점 3개와 새 command 초안부터 제안해줘.
```

## 7. Lesson 2를 처음 실행할 때 가장 안전한 순서

1. Lesson 1에서 실제로 안 맞았던 지점 1개 고르기
2. 바꿀 대상은 Skill 1개와 command 1개로 제한하기
3. `Gemini CLI`에서 `remix:start`를 1회 실행하기
4. `outputs/01~03`까지 저장하기
5. `remix:review`로 초안을 줄이고 테스트 프롬프트 만들기
6. 그 다음 자기 과제에 맞게 실제 파일 수정 범위를 결정하기

## 8. 추천 실습 시나리오

### 시나리오 0. 기본 예제 교재를 발표안 제작용으로 바꾸기

```text
/remix:start "기본 예제 교재 https://gyung.me/68nHrk 를 10분 발표안 제작 과제에 맞게 바꾸고 싶다. Lesson 1 흐름에서 안 맞는 점을 찾아 새 skill과 command 초안을 제안해줘."
```

### 시나리오 A. 인터뷰 정리형 과제

```text
/remix:start "Lesson 1 흐름을 인터뷰 정리와 인사이트 정리 중심으로 바꾸고 싶다."
```

### 시나리오 B. 제출 형식 맞추기

```text
/remix:start "Lesson 1 command를 보고서 제출 형식에 맞게 바꾸고 싶다."
/remix:review "draft를 더 짧고 실행 가능하게 줄여줘."
```

## 9. 막힐 때 쓰는 문장

### 시작이 막힐 때

```text
새 구조를 만들지 말고 Lesson 1에서 안 맞는 지점 3개만 먼저 찾아줘.
Skill 1개와 command 1개만 바꾸는 최소 버전으로 줄여줘.
```

### 구조가 막힐 때

```text
출력 형식, 입력 자료, 파일 이름 세 가지로만 차이를 정리해줘.
바꿔야 할 것과 그대로 둬도 되는 것을 분리해줘.
```

### 수정이 막힐 때

```text
지금 draft에서 과한 부분을 줄여줘.
바로 테스트 가능한 프롬프트 3개만 남겨줘.
```
