@echo off
if exist vcxsrv*.installer.exe del vcxsrv*.installer.exe

for /f "tokens=2*" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\DevDiv\vcpp\Servicing\14.0\crt.redist.clickonce" /v Version') do set "VC_VERSION=%%~b"

if "%1"=="nox86" goto skipx86

copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\x86\Microsoft.VC141.CRT\msvcp140.dll"
copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\x86\Microsoft.VC141.CRT\vcruntime140.dll"
copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\debug_nonredist\x86\Microsoft.VC141.DebugCRT\msvcp140d.dll"
copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\debug_nonredist\x86\Microsoft.VC141.DebugCRT\vcruntime140d.dll"

if exist "C:\Program Files (x86)\NSIS\makensis.exe" (
  "C:\Program Files (x86)\NSIS\makensis.exe" vcxsrv.nsi
  "C:\Program Files (x86)\NSIS\makensis.exe" vcxsrv-debug.nsi
) else (
  "C:\Program Files\NSIS\makensis.exe" vcxsrv.nsi
  "C:\Program Files\NSIS\makensis.exe" vcxsrv-debug.nsi
)

:skipx86
if "%1"=="nox64" goto skipx64

copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\x64\Microsoft.VC141.CRT\msvcp140.dll"
copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\x64\Microsoft.VC141.CRT\vcruntime140.dll"
copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\debug_nonredist\x64\Microsoft.VC141.DebugCRT\msvcp140d.dll"
copy "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\%VC_VERSION%\debug_nonredist\x64\Microsoft.VC141.DebugCRT\vcruntime140d.dll"

if exist "C:\Program Files (x86)\NSIS\makensis.exe" (
  "C:\Program Files (x86)\NSIS\makensis.exe" vcxsrv-64.nsi
  "C:\Program Files (x86)\NSIS\makensis.exe" vcxsrv-64-debug.nsi
) else (
  "C:\Program Files\NSIS\makensis.exe" vcxsrv-64.nsi
  "C:\Program Files\NSIS\makensis.exe" vcxsrv-64-debug.nsi
)

:skipx64

del "vcruntime140.dll"
del "vcruntime140d.dll"
del "msvcp140.dll"
del "msvcp140d.dll"
