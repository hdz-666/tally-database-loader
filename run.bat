@echo off
:start
node ./dist/index.mjs
if %errorlevel% neq 0 (
    echo Process stopped unexpectedly. Restarting in 10 seconds...
    timeout /t 10 /nobreak
    goto start
)
