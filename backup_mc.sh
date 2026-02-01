#!/bin/bash

# 마인크래프트 프로젝트 루트로 이동
cd /home/ubuntu/game_servers/oci_minecraft_server

# 변경 사항 감지
if [[ -n $(git status -s) ]]; then
    # 로그 파일에 시간 기록
    echo "[$(date)] Changes detected. Starting backup..." >> backup.log

    # Git 명령 실행
    git add .
    git commit -m "MC Auto Backup: $(date '+%Y-%m-%d %H:%M:%S')"

    # 충돌 방지 및 푸시
    git pull --rebase origin main
    git push origin main

else
    echo "[$(date)] No changes detected." >> backup.log
fi
