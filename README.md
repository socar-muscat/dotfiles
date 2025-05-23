# dotfiles

make 명령어의 탭 자동 완성을 지원하기 위한 레포.

터미널에서 make 이후 탭 입력하여 사용.
```
make <TAB><TAB>
```
---

이하는 터미널에서 입력하는 명령어입니다.

### 사용자의 $HOME (~ 디렉토리) 에 dotfiles 레포를 클론.
```
git clone https://github.com/socar-muscat/dotfiles.git ~/.dotfiles
```
### 해당 레포로 이동
```
cd ~/.dotfiles
```
### install 스크립트에 권한 부여
```
chmod +x install.sh
```
### install 스크립트 실행
```
./install.sh
```

### 적용 
```
source ~/.zshrc
```

### 터미널 재시작 또는 exec zsh
```
exec zsh
```

---

## 복구 및 취소 시
### zshrc 파일 오픈
```
vi ~/.zshrc
```
아래 소스 삭제 또는 주석처리
```
source $HOME/.dotfiles/.zshrc.dotfiles
```
