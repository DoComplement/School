@echo off

SET list=
FOR %%A in (%*) DO (call :concat "%%A")

echo %list% | Clip.exe
GOTO :eof

:concat
 set "list=%list",%1"
 GOTO :eof
