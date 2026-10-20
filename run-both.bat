@echo off
rem Runs the loader for both companies one after the other.
rem Shared settings (server, username, password, ...) come from config.json;
rem only schema and company are overridden per run.

:pnl
echo === Padmawati Enterprises 2024-27 -^> tallypnl ===
node ./dist/index.mjs --database-schema tallypnl --tally-company "Padmawati Enterprises 2024-27"
if %errorlevel% neq 0 (
    echo Process stopped unexpectedly. Restarting in 10 seconds...
    timeout /t 10 /nobreak
    goto pnl
)

:db
echo === PADMAWATI  ENTERPRISES -^> tallydb ===
node ./dist/index.mjs --database-schema tallydb --tally-company "PADMAWATI  ENTERPRISES"
if %errorlevel% neq 0 (
    echo Process stopped unexpectedly. Restarting in 10 seconds...
    timeout /t 10 /nobreak
    goto db
)

echo Both imports finished.
