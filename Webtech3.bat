@echo off
TITLE Webtech3
SET mongoDir= "C:\Program Files\MongoDB\Server\4.0\bin"
echo Welkom bij Webtech3!

CHOICE /C ny /N /M "MongoDB starten? (y/n)"
IF ERRORLEVEL 2 start cmd /k "TITLE MONGODB NIET SLUITEN & cd %mongoDir% & mongod"
echo.

:start
echo.
echo ###################################################
echo.

CHOICE /C ynq /N /M "Install in this folder(Y/N)? or Quit(Q)?"
IF ERRORLEVEL 3 goto end
IF ERRORLEVEL 2 echo Pad: & SET /p PAD=
IF ERRORLEVEL 1 SET PAD="%~dp0"
echo.

CHOICE /C EAQ /N /M "Install Express(E) / Angular(A) or Quit(Q)?"
IF ERRORLEVEL 3 goto end
IF ERRORLEVEL 2 goto angular
IF ERRORLEVEL 1 goto express


:angular
start cmd /k "TITLE Angular ng serve of npm run serve & cd "%angularDir%" & npm install & npm install mongodb --save & npm install -g @angular/cli & npm install body-parser --save & npm install cors --save"
goto start

:express
start cmd /k "TITLE EXPRESS node server & cd "%expressDir%" & npm install & npm install express --save & npm install body-parser --save & npm install mongodb --save & npm install ejs --save & npm install nodemon --save-dev"
goto start

:end
