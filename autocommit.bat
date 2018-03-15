@echo off 
cd "C:\Users\pktuy\Downloads\PKTUY\GITHUB\tuypk.github.io"

set GIT_PATH="C:\Program Files\Git\bin\git.exe"
set BRANCH = "origin"
set Timestamp = %date:~6,4%-%date:~3,2%-%date:~0,2%-%time:~0,2%-%time:~3,2%-%time:~6,2%

%GIT_PATH% add -A
%GIT_PATH% commit -am "Auto-committed on %Timestamp%"
%GIT_PATH% pull %BRANCH%
%GIT_PATH% push %BRANCH%