# dotfiles

이 저장소는 `make` 명령어 사용 시 탭(Tab) 키를 통해 사용 가능한 명령어를 자동으로 완성해주는 `dotfiles` 설정을 제공합니다.

이 문서를 통해 `dotfiles`를 설치하여 터미널에서 `make` 명령어의 생산성을 높이는 방법을 알아봅니다.

## 개요

`Makefile`을 사용하는 프로젝트에서 `make` 명령어를 실행할 때, 사용 가능한 타겟(Target)들을 확인하고 입력하는 과정을 간소화합니다. 이 설정을 적용하면 Zsh 셸 환경에서 `make` 입력 후 탭 키를 누르는 것만으로 사용 가능한 명령어 목록을 확인하고 쉽게 자동 완성할 수 있습니다.

**핵심 기능:**

* `make` 명령어에 대한 탭 자동 완성 지원
* Zsh 환경에 간편하게 통합

**이 문서에서 다루는 내용:**

* `dotfiles` 설치 및 적용 방법
* 설정 복구 및 취소 방법

## 설치 방법

다음 단계를 따라 `make` 탭 자동 완성을 설치하고 적용합니다. Zsh 셸 환경과 `git`이 설치되어 있어야 합니다.

### 1. 저장소 복제 (Clone)

사용자의 홈 디렉토리(`~`) 아래에 이 `dotfiles` 저장소를 `.dotfiles`라는 이름으로 복제합니다.
```bash
git clone https://github.com/socar-muscat/dotfiles.git ~/.dotfiles
```

### 2. 디렉토리 이동

복제된 `.dotfiles` 디렉토리로 이동합니다.
```bash
cd ~/.dotfiles
```

### 3. 설치 스크립트 실행 권한 부여

설치 스크립트 `install.sh`가 실행될 수 있도록 권한을 부여합니다.
```bash
chmod +x install.sh
```

### 4. 설치 스크립트 실행 

설치 스크립트를 실행하여 `~/.zshrc` 파일에 필요한 설정을 자동으로 추가합니다.
```bash
./install.sh
```
> 이 스크립트는 `~/.zshrc` 파일의 끝에 `source $HOME/.dotfiles/.zshrc.dotfiles` 라인을 추가합니다.

### 5. 설정 적용

변경된 `~/.zshrc` 설정을 현재 터미널에 적용합니다.
```bash
source ~/.zshrc
```

### 6. 확인 및 사용

터미널을 재시작하거나 다음 명령어를 실행하여 Zsh을 다시 시작합니다.
```bash
exec zsh
```

이제 터미널에서 `make`를 입력하고 `Tab` 키를 두 번 누르면 (`make <TAB><TAB>`), 현재 디렉토리와 루트까지 탐색하여 발견한 `Makefile`에 정의된 타겟 목록이 나타나며 자동 완성이 동작하는 것을 확인할 수 있습니다.


## 복구 및 취소


### 1. 텍스트 편집기를 사용하여 `~/.zshrc` 파일을 엽니다.
```bash
vi ~/.zshrc
```

### 2. 파일 내용 중에서 아래 줄을 찾아서 삭제하거나, 줄 맨 앞에 #을 추가하여 주석 처리합니다.
```bash
source $HOME/.dotfiles/.zshrc.dotfiles
```

### 3. 변경 사항을 적용하기 위해 터미널을 재시작하거나 다음 명령어를 실행합니다.
```bash
source ~/.zshrc
exec zsh
```
