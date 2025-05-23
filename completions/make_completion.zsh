# zsh 자동완성 등록
compdef _make_custom make

# make 자동완성 동작 정의
_make_custom() {
    # Makefile 경로 탐색
    local makefile
    makefile=$(find_up Makefile)
    
    # Makefile 없으면, 자동완성 실행 중단
    [[ -z "$makefile" ]] && return 1
    
    # Makefile 내에서 타겟 이름을 추출
    # awk 사용: 콜론(:) 기준으로 나누고, 주석/빈칸으로 시작하지 않는 줄의 첫 번째 필드를 추출
    # ex: build: -> build
    local targets=(${(f)"$(awk -F':' '/^[^.# \t][^ \t]*:/ { print $1 }' "$makefile")"})

    # `_describe` 명령어를 이용해 추출된 타겟 리스트를 zsh 자동완성 시스템에 등록
    _describe 'make target' targets
}

# 현재 디렉토리부터 루트까지 Makefile 탐색
find_up() {
    local dir="$PWD"    # 현재이며 탐색 시작 위치
    
    # 루트까지
    while [[ "$dir" != "/" ]]; do
        # 해당 디렉토리에 Makefile 있으면 경로 출력
        if [[ -f "$dir/$1" ]]; then
            echo "$dir/$1"
            return
        fi
        # 한 단계 상위 디렉토리로 이동
        dir=$(dirname "$dir")
    done
}
