@echo off

for /f %%i in ('where cygwin') do set CYGWIN_LAUNCHER_PATH=%%i

echo CYGWIN_LAUNCHER_PATH: %CYGWIN_LAUNCHER_PATH%

for %%F in ("%CYGWIN_LAUNCHER_PATH%") do set CYGWIN_PATH=%%~dpF

echo CYGWIN_PATH: %CYGWIN_PATH%

for /f %%i in ('%CYGWIN_PATH%bin\bash.exe --login -c "cygpath -w $(which python2.7)"') do set CYGWIN_PYTHON=%%i

echo CYGWIN_PYTHON: %CYGWIN_PYTHON%


"%CYGWIN_PYTHON%" %*