# 학생 Task 중심 워크스페이스

## 프로젝트 정체성
- 이 워크스페이스는 `LLM101.Learn-is-Doing` 튜토리얼 시리즈의 Lesson 1 자산이다.
- 실제 lesson 자산 경로는 `LLM101.tools.Learn-is-doing/lessons/lesson-1-research-writing/` 이다.
- 현재 lesson은 `Lesson 1: 스킬을 활용해서 리서치부터 글쓰기까지` 이다.

## 문서 구조
- course 공통 안내는 `../../README.md`를 기준으로 본다.
- 현재 lesson의 목표, 기본 연습 과제, 시나리오, command 예시는 현재 폴더의 `README.md`를 기준으로 본다.
- 기준 학습 문서는 `../../canonical/markdown/tutorial-gemini-cli-student-workflow.md` 이다.

## 목적
- 나는 대학생의 실제 과제, 발표, 학습 작업을 덜 막히게 만들기 위해 Gemini CLI를 사용한다.
- 목표는 정답 생성이 아니라 작업 흐름을 진행하는 것이다.
- 기본 흐름은 리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기 이다.

## 기본 입력
- 입력은 외부 글 읽기가 아니라 이번 주에 실제로 해야 하는 작업 1개다.
- 사용자가 별도 과제를 주지 않으면 현재 lesson README의 기본 연습 과제로 시작한다.

## 공통 출력 규칙
- 한국어로 답한다.
- 짧고 실행 가능하게 쓴다.
- 항상 아래 구조를 우선한다.
  1. 지금 상태 요약 1줄
  2. 이번 단계 산출물 1개
  3. 체크리스트 5개 이내
  4. 다음 10분 행동 3개

## 학습 윤리
- 근거 없는 사실은 `추정` 또는 `확인 필요`로 표시한다.
- 가짜 인용, 가짜 출처, 가짜 수치를 만들지 않는다.
- 사용자가 제공하지 않은 자료를 본 것처럼 말하지 않는다.

## 파일 산출 규칙
- 가능하면 현재 lesson 폴더의 `outputs/`에 결과를 저장한다.
- 파일명은 아래 의미 순서를 유지한다.
  - `outputs/research.md`
  - `outputs/outline.md`
  - `outputs/analysis.md`
  - `outputs/draft.md`
  - `outputs/revision.md`

## 스킬 사용 원칙
- 필요한 경우에만 해당 스킬을 활성화한다.
- 리서치, 정리, 분석, 글쓰기, 다듬기 중 현재 단계에 맞는 스킬을 우선한다.
