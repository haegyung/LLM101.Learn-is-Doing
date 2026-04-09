# Gemini CLI 학생용 프로젝트 템플릿

이 템플릿은 대학생이 실제 작업을 기준으로 Gemini CLI를 사용하는 실습용 구조이다.

## 포함 파일
- GEMINI.md
- .gemini/skills/*/SKILL.md
- .gemini/commands/taskflow/start.toml
- .gemini/commands/taskflow/revise.toml

## 권장 흐름
1. 프로젝트 폴더에서 `gemini` 실행
2. `/memory show` 로 GEMINI.md 반영 확인
3. `/skills reload` 후 `/skills list` 확인
4. `/commands reload` 후 `/taskflow:start "내 작업"` 실행
5. 초안이 생기면 `/taskflow:revise "수정 요청"` 실행

## 예시 작업
- 발표 주제 자료 조사
- 레포트 초안 작성
- 논문 비교 정리
- 자기소개서 문장 다듬기
