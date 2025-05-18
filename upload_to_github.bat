@echo off
setlocal enabledelayedexpansion


:: GitHub �ֿ��ַ������ʾ�ã�
=======
:: GitHub �ֿ��ַ

set REPO_URL=https://github.com/a764519892/WeChat-AutoBot.git

:: ��ǰĿ¼
set PROJECT_DIR=%cd%
cd /d %PROJECT_DIR%

:: ��������ļ�
git add .

:: ��ȡ��ǰ����ʱ��
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set mydate=%%a-%%b-%%c
)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set mytime=%%a-%%b
)

:: �ύ������
git commit -m "Auto commit on !mydate! !mytime!"
git branch -M main
git push -u origin main
git submodule update --checkout --recursive

echo ? ���ϴ��� %REPO_URL%
=======
:: ��ȡʱ���
for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "timestamp=%%i"

echo ---------------------------------------
echo ?? ���ڴ�����ģ��ݹ��ύ���ϴ�...
echo ---------------------------------------

:: ����������ģ��Ŀ¼���ύ�ϴ�
for /f "delims=" %%s in ('git config --file .gitmodules --get-regexp path ^| awk "{ print $2 }"') do (
    echo ?? ������ģ�飺%%s
    cd %%s
    git add .
    git commit -m "Submodule auto commit on !timestamp!" >nul 2>&1
    if errorlevel 1 (
        echo ?? ��ģ�� %%s û�б���������ύ��
    ) else (
        git push
        echo ? ��ģ�� %%s ���ϴ���
    )
    cd %PROJECT_DIR%
)

echo ---------------------------------------
echo ?? �����ύ����Ŀ...
echo ---------------------------------------

:: ����Ŀ������б䶯��������ģ�����ø��£�
git add .

:: �ύ
git commit -m "Auto commit on !timestamp!" >nul 2>&1
if errorlevel 1 (
    echo ?? ����Ŀû�б�������� push��
    goto end
)

:: ��������Ŀ
git branch -M main
git push -u origin main

:end
echo ---------------------------------------
echo ? ���б�����ϴ��� %REPO_URL%

pause
