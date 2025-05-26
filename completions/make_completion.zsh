# zsh 자동완성 등록
compdef _make_custom make

# make 자동완성 동작 정의
_make_custom() {
    # Makefile 경로 설정
    local makefile="$PWD/Makefile"

    # 현재 디렉토리에 Makefile이 없으면 자동완성 중단
    # [[ ! -f "$makefile" ]] : 해당 경로에 파일이 존재하지 않으면 참(true)
    [[ ! -f "$makefile" ]] && return 1

    # Makefile 내에서 타겟 이름을 추출
    # awk 사용: 콜론(:) 기준으로 나누고, 주석/빈칸으로 시작하지 않는 줄의 첫 번째 필드를 추출
    # ex: build: -> build
    local targets=(${(f)"$(awk -F':' '/^[^.# \t][^ \t]*:/ { print $1 }' "$makefile")"})

    # `_describe` 명령어를 이용해 추출된 타겟 리스트를 zsh 자동완성 시스템에 등록
    _describe 'make target' targets
}
