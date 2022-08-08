@ECHO OFF 
ECHO  --------------- Starting Disconnect --------------- 
ECHO  [BATCH PROCESS INFO] Cargando configuracion
START /B /WAIT docker build -t configurador-imagen .
START /B /WAIT docker run --rm -d --name configurador -v "%cd%:/src" configurador-imagen
ECHO  [BATCH PROCESS INFO] Copiando el archivo de configuración al apigateway
START /B xcopy disconnecter.config apigateway\src\main\resources /Y

ECHO  [BATCH PROCESS INFO] Contenedores buildeados
ECHO  [BATCH PROCESS INFO] Desplegando contenedores
START /B /WAIT docker-compose up --build -d apigateway
ECHO  [BATCH PROCESS INFO] Proceso finalizado (Checkea los contenedores levantados)
@pause


