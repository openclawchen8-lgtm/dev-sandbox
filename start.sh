#!/bin/bash

# 避免重複詢問key的方法，用GEMINI_API_KEY宣告會有問題(以google account獲取的api token)。
# mkdir $HOME/dev-sandbox/
# docker cp gemini-box:/root/.gemini $HOME/dev-sandbox/

# gamini sandbox
gemini-box() {
  #export GEMINI_API_KEY="xxxx"
  docker run -it --name gemini-box --rm \
    -e GEMINI_API_KEY="$GEMINI_API_KEY" \
    -e GEMINI_CLI_TRUST_WORKSPACE=true \
    -e TERM=xterm-256color \
    -e COLORTERM=truecolor \
    -e FORCE_COLOR=1 \
    -v "$HOME/dev-sandbox/.gemini:/root/.gemini" \
    -v "$HOME/Projects:/Users/claw/Projects" \
    -v "$HOME/Tasks:/Users/claw/Tasks" \
    -v "$HOME/.qclaw/workspace/skills:/Users/claw/skills" \
    -w /Users/claw \
    gemini-fullstack-env gemini --yolo
}

alias gemini-box-debug="docker exec -it gemini-box bash"

