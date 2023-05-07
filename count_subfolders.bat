@echo off

if "%1"=="" (
  echo Usage: count_subfolders.bat [folder_path1] [folder_path2] ...
  echo.
  echo This script counts the number of subfolders in a given folder.
  echo.
  echo Arguments:
  echo   [folder_path1]  The path to the first folder to be processed.
  echo   [folder_path2]  The path to the second folder to be processed.
  echo   ...             The path to the Nth folder to be processed.
  echo.
  exit /b 1
)

for %%a in (%*) do (
  if not exist "%%~a" (
    echo Directory "%%~a" was not found.
	exit /b 0
  ) else (
    for /f %%i in ('dir /a:d /s /b "%%~a" ^| find /c ":"') do echo Number of subfolders in "%%~a" - %%i
  )
)