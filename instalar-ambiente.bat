@echo off
setlocal EnableExtensions
title Setup - Camara Termica (MiKTeX + Git + VS Code)
cd /d "%~dp0"
set "LOG=%~dp0setup-log.txt"
echo Setup iniciado %DATE% %TIME% > "%LOG%"

echo ============================================================
echo  Instala: MiKTeX (LaTeX) + Git + VS Code + LaTeX Workshop
echo  e baixa (clona) o repositorio do grupo.
echo  FECHE o VS Code antes de continuar.
echo ============================================================
pause

where winget >nul 2>&1
if errorlevel 1 (
  echo ERRO: winget nao encontrado. Atualize o "Instalador de Aplicativo" na Microsoft Store.
  echo ERRO_SEM_WINGET >> "%LOG%"
  goto :fim
)

rem ---------- 1. MiKTeX ----------
echo.
echo [1/5] MiKTeX...
call :achamiktex
if defined MIKBIN (echo   ja instalado.) else (
  echo   instalando - pode levar alguns minutos...
  winget install --id MiKTeX.MiKTeX -e --scope user --silent --accept-source-agreements --accept-package-agreements >> "%LOG%" 2>&1
  call :achamiktex
)
if not defined MIKBIN (
  echo   ERRO: MiKTeX nao instalou. Veja setup-log.txt
  goto :fim
)
"%MIKBIN%\initexmf.exe" --set-config-value=[MPM]AutoInstall=1 >> "%LOG%" 2>&1
"%MIKBIN%\miktex.exe" packages update-package-database >> "%LOG%" 2>&1
echo   OK - pacotes faltando serao baixados sozinhos.

rem ---------- 2. Git ----------
echo.
echo [2/5] Git...
where git >nul 2>&1
if errorlevel 1 (
  winget install --id Git.Git -e --silent --accept-source-agreements --accept-package-agreements >> "%LOG%" 2>&1
  set "PATH=%PATH%;%ProgramFiles%\Git\cmd"
)
where git >nul 2>&1
if errorlevel 1 (echo   ERRO: Git nao instalou. & goto :fim) else (echo   OK)

rem ---------- 3. VS Code ----------
echo.
echo [3/5] VS Code...
set "CODECMD=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
if not exist "%CODECMD%" if exist "%ProgramFiles%\Microsoft VS Code\bin\code.cmd" set "CODECMD=%ProgramFiles%\Microsoft VS Code\bin\code.cmd"
if not exist "%CODECMD%" (
  winget install --id Microsoft.VisualStudioCode -e --scope user --silent --accept-source-agreements --accept-package-agreements >> "%LOG%" 2>&1
)
if not exist "%CODECMD%" set "CODECMD=code"
echo   OK

rem ---------- 4. Extensao LaTeX Workshop ----------
echo.
echo [4/5] Extensao LaTeX Workshop...
call "%CODECMD%" --install-extension James-Yu.latex-workshop --force >> "%LOG%" 2>&1
echo   OK

rem ---------- 5. Nome no Git + clonar o repositorio ----------
echo.
echo [5/5] Configurando o Git...
for /f "delims=" %%i in ('git config --global user.name') do set "GITNAME=%%i"
if not defined GITNAME (
  set /p GITNAME="  Seu nome (aparece nos commits): "
  call git config --global user.name "%%GITNAME%%"
)
for /f "delims=" %%i in ('git config --global user.email') do set "GITMAIL=%%i"
if not defined GITMAIL (
  set /p GITMAIL="  Seu e-mail do GitHub: "
  call git config --global user.email "%%GITMAIL%%"
)
git config --global pull.rebase false

if exist "%~dp0.git" (
  echo   Esta pasta ja e o repositorio. Abrindo no VS Code...
  call "%CODECMD%" "%~dp0."
  goto :fim
)
echo.
set /p REPO="  Cole o link do repositorio (ex.: https://github.com/usuario/camara-termica-unip.git): "
if "%REPO%"=="" goto :fim
cd /d "%USERPROFILE%\Documents"
git clone "%REPO%" >> "%LOG%" 2>&1
for %%r in ("%REPO%") do set "PASTA=%%~nr"
if exist "%USERPROFILE%\Documents\%PASTA%" (
  echo   Clonado em Documentos\%PASTA%. Abrindo no VS Code...
  call "%CODECMD%" "%USERPROFILE%\Documents\%PASTA%"
) else (
  echo   Nao consegui clonar. Confira o link e se voce foi adicionado como colaborador.
)
goto :fim

:achamiktex
set "MIKBIN="
if exist "%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe" set "MIKBIN=%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64"
if not defined MIKBIN if exist "%ProgramFiles%\MiKTeX\miktex\bin\x64\pdflatex.exe" set "MIKBIN=%ProgramFiles%\MiKTeX\miktex\bin\x64"
exit /b

:fim
echo FIM %DATE% %TIME% >> "%LOG%"
echo.
echo Pronto. Pode fechar esta janela.
pause
