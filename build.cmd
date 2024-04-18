@echo off
chcp 65001

set PLATFORM_1C=%ProgramFiles%\1cv8\8.3.24.1467\bin

rmdir /Q /S "%CD%/build/ib"
rmdir /Q /S "%CD%/build/workspace"
rmdir /Q /S "%CD%/build/config"

mkdir build\ib
mkdir build\cf

call ring edt@2023.3.4 workspace export --workspace-location %CD%\build\workspace --configuration-files %CD%\build\config --project %CD%\CpuBenchmark

"%PLATFORM_1C%\ibcmd.exe" infobase create --data "%CD%/build/ib"
"%PLATFORM_1C%\ibcmd.exe" infobase config import --data "%CD%/build/ib" %CD%\build\config
"%PLATFORM_1C%\ibcmd.exe" infobase config apply --data "%CD%/build/ib" --force
"%PLATFORM_1C%\ibcmd.exe" infobase config save --data "%CD%/build/ib" "%CD%/build/cf/cpubenchmark_last.cf"
