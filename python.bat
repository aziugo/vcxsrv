@echo off

for /f %%i in ('where cygwin') do set CYGWIN_LAUNCHER_PATH=%%i
for %%F in ("%CYGWIN_LAUNCHER_PATH%") do set CYGWIN_PATH=%%~dpF
for /f %%i in ('%CYGWIN_PATH%bin\bash.exe --login -c "cygpath -w $(which python2.7)"') do set CYGWIN_PYTHON=%%i

"%CYGWIN_PYTHON%" %*