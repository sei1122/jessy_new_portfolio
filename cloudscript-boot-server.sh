#! /bin/bash
set -x

cd jessy_new_portfolio
go build

# run the server in the background
nohup sudo PORT=80 PROJECT_ID=817745931695 ./jessy_new_portfolio &>/dev/null < /dev/null &

ps -aux | grep jessy_new_portfolio

set +x
exit