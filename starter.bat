@ECHO OFF 
ECHO  --------------- Starting Disconnect --------------- 
ECHO  [BATCH PROCESS INFO] Cargando configuracion
START /B python disconnecter.py
ECHO  [BATCH PROCESS INFO] Contenedores buildeados
START /B /WAIT docker-compose build
ECHO  [BATCH PROCESS INFO] Desplegando contenedores
START /B /WAIT docker-compose up -d ApiGateWay
ECHO  [BATCH PROCESS INFO] Proceso finalizado (Checkea los contenedores levantados)


