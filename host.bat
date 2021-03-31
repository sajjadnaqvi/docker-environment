REM --> add the following to the top of your bat file--

@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
echo Checking administrative privileges ...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges ...
    goto UACPrompt
) else (
    echo Got administrative privileges ...
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    SET NEWLINE=^& echo.

    ECHO %NEWLINE%^# Added by Project Larabeans>>%WINDIR%\System32\drivers\etc\hosts

    FIND /C /I "larabeans.ts" %WINDIR%\system32\drivers\etc\hosts
    IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 larabeans.ts>>%WINDIR%\System32\drivers\etc\hosts

    FIND /C /I "mysql.larabeans.ts" %WINDIR%\system32\drivers\etc\hosts
    IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 mysql.larabeans.ts>>%WINDIR%\System32\drivers\etc\hosts

    FIND /C /I "api.larabeans.ts" %WINDIR%\system32\drivers\etc\hosts
    IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 api.larabeans.ts>>%WINDIR%\System32\drivers\etc\hosts

    FIND /C /I "admin.api.larabeans.ts" %WINDIR%\system32\drivers\etc\hosts
    IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 admin.larabeans.ts>>%WINDIR%\System32\drivers\etc\hosts

    ECHO %NEWLINE%^# End of section>>%WINDIR%\System32\drivers\etc\hosts

:--------------------------------------
