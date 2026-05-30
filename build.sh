#!/bin/bash

cp /Users/claw/Projects/tw-quant-selector/requirements.txt .
docker build -t gemini-fullstack-env .
docker images gemini-fullstack-env

