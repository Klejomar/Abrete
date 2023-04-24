@ECHO OFF

goto TEXT
:TEXT

CLS

:: start chrome https://zhcp2dci.whirlpool.com/sap/bc/bsp/sap/crm_ui_start/default.htm
:: start chrome https://meutecbook.com.br/home/login
:: start chrome https://udpwfmniceap02/pt_BR/group/webstation/stats-viewer
:: start chrome https://algarmail
:: start chrome http://udpweb/whirlpoolportalpolitica
:: start chrome https://www.brastemp.com.br/
:: start chrome https://loja.consul.com.br/
start saplogon.exe

CLS

echo ***********************************************************
echo *                   Abretesesamo V3.0                     *
echo ***********************************************************
echo ___________________________________________________________
echo Todos os essenciais foram abertos.
Echo Agora, adicionalmente, pode escolher o que mais quer abrir.
echo ___________________________________________________________
echo Os comandos consistem em:
echo top \ pasta \ ambos \ cronometro \ fecha
echo ___________________________________________________________

goto START
:START

SET /P ESCO="  Deseja abrir mais alguma coisa? "

2>NUL CALL :CASE_%ESCO% # jump to :CASE_top, :CASE_ambos, :CASE_pasta, etc.
IF ERRORLEVEL 1 CALL :DEFAULT_CASE # If label doesn't exist

ECHO Feito.
EXIT /B

:CASE_top
  echo Certo, Portal Top foi aberto
  start chrome http://portaltop/PortalTop/Login/Login.aspx
  GOTO START

:CASE_pasta
  echo Certo, a Pasta foi aberta
  start \\acsfs\profiles$\%username% 
  GOTO START

:CASE_ambos
  echo Certo, tanto o Portal quanto a Pasta foram abertos
  start chrome http://portaltop/PortalTop/Login/Login.aspx
  start \\acsfs\profiles$\%username%
  GOTO START

:CASE_Cronometro
  echo Certo, o cronometro foi aberto
  start chrome https://relogioonline.com.br/cronometro/
  GOTO START

:CASE_reset
  GOTO TEXT

:CASE_fecha
  GOTO END

:DEFAULT_CASE
  ECHO Nao reconheco este "%ESCO%"
  GOTO START

:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL

:END