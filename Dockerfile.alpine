FROM node:20-alpine

# 直接把色彩與工作目錄寫死在映像檔內
ENV TERM=xterm-256color
ENV COLORTERM=truecolor
ENV FORCE_COLOR=1

# 安裝 Bash、Git、Python 3、pip 與 C/C++ 編譯工具（許多 Python/Node 套件編譯需要）
# 補齊 DuckDB 與財務分析套件（Pandas, Numpy）所需的 C++ 編譯器與底層庫
RUN apk update && \
    apk add --no-cache \
    bash \
    git \
    curl \
    python3 \
    py3-pip \
    build-base \
    cmake \
    g++ \
    gcc \
    libffi-dev \
    openssl-dev \
    ca-certificates \
    tzdata

# 安裝測試用的套件
RUN apk add --no-cache \
    github-cli

RUN rm -rf /var/cache/apk/*

# 安裝 google/gemini-cli
RUN npm install -g @google/gemini-cli

# 設定台灣時區（確保 Data Sources 排程擷取與 TWSE/TPEX 時間同步）
ENV TZ=Asia/Taipei

# 設定工作目錄
RUN mkdir -p /Users/claw
WORKDIR /Users/claw

