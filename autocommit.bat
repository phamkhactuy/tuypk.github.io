cd "C:\Users\pktuy\Downloads\PKTUY\B\tuypk.github.io"

set GIT_PATH="C:\Program Files\Git\bin\git.exe"
set BRANCH = "origin"

%GIT_PATH% add -A
%GIT_PATH% commit -am "Auto-committed on %date%"
%GIT_PATH% pull %BRANCH%
%GIT_PATH% push %BRANCH%