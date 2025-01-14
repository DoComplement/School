@echo off

SET list=
FOR %%A in (*.wav, *.mp3) DO (call :concat "%%A")

echo %list% | Clip.exe
GOTO :eof

:concat
 set "list=%list",%1"
 GOTO :eof
