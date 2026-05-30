# 記錄一下，如何使用gemini cli + sandbox docker mode的方式。

### 一些小重點

- 避免重複詢問key的方法，用GEMINI_API_KEY宣告會有問題(以google account獲取的api token)。

```
# mkdir $HOME/dev-sandbox/
# mkdir $HOME/dev-sandbox/.config  # 持久記憶使用，不需要可刪除。docker-compose.yml亦有掛載。
# docker cp gemini-box:/root/.gemini $HOME/dev-sandbox/
```
- 測試使用的環境變數: /Users/claw/dev-sandbox/.bashrc

### Dockerfile兩種都可以正常使用，請自行視開發環境擇一。
- Dockerfile.alpine
- Dockerfile.debian

### 小趣事

當我和gemini說，你在sandbox裡面，它就把自己殺掉了！！！

### bash 方式

#### vim ~/.bash_profile

```bash
#!/bin/bash

# gamini sandbox
gemini-box() {
  #export GEMINI_API_KEY="xxxx"
  docker run -it --name gemini-box --rm \
    -e GEMINI_API_KEY="$GEMINI_API_KEY" \
    -e GEMINI_CLI_TRUST_WORKSPACE=true \
    -e TERM=xterm-256color \
    -e COLORTERM=truecolor \
    -e FORCE_COLOR=1 \
    -v "$HOME/dev-sandbox/.bashrc:/root/.bashrc" \
    -v "$HOME/dev-sandbox/.gemini:/root/.gemini" \
    -v "$HOME/dev-sandbox/.config:/root/.config" \
    -v "$HOME/Projects:/Users/claw/Projects" \
    -v "$HOME/Tasks:/Users/claw/Tasks" \
    -v "$HOME/.qclaw/workspace/skills:/Users/claw/skills" \
    -w /Users/claw \
    gemini-fullstack-env gemini --yolo --resume
}

alias gemini-box-debug="docker exec -it gemini-box bash"
```

### docker-compose方式一(單次使用，退出就刪除container instance。)

```bash
# docker compose run --rm gemini-box
```

### docker-compose方式一(多次使用，退出不刪除container instance。需手動刪除。)

```bash
# docker-compose up -d
# docker-compose ps -a
# docker-compose attach gemini-box
# docker-compose down
```

