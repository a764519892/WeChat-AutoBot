@echo off
setlocal enabledelayedexpansion

:: ��һ�����г�ʼ�� Git �ֿ�
git config --global user.name "a764519892"
git config --global user.email "a764519892@qq.com"

:: GitHub �ֿ��ַ
set REPO_URL=https://github.com/a764519892/WeChat-AutoBot.git

:: ��ǰĿ¼��Ϊ��ĿĿ¼
set PROJECT_DIR=%cd%
cd /d %PROJECT_DIR%

:: ��ʼ���ֿⲢ��Զ��
echo ?? ���ڳ�ʼ�� Git �ֿ�...
git init
git remote add origin %REPO_URL%

:: ��ȡԶ�ֿ̲⣨��ֹ push ���ܾ���
echo ?? ������ȡԶ�̷�֧...
git pull origin main --allow-unrelated-histories

echo ? ��ʼ����ɣ���ʹ�� upload_git.bat �ϴ�����
pause
