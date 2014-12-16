REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: by leian1306
REM  Productname: 
REM  Filedescription: WIN7USB BOOT TOOL
REM  Copyrights: 
REM  Trademarks: 
REM  Originalname: 
REM  Comments: 
REM  Productversion:  0. 0. 0. 0
REM  Fileversion:  0. 0. 0. 0
REM  Internalname: 
REM  Appicon: icon.ico
REM  QBFC Project Options End

@echo off& MODE CON: COLS=58 LINES=13
color 0f
title WIN7USB == by leito9008
set /a entorno=1
echo.
echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo       º    BIENVENIDO AL ASISTENTE DE WIN7USB!      º
echo       ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo       º                                             º
echo       º Antes que nada asegurate de tener tu        º
echo       º memoria USB conectada y tu imagen de        º
echo       º WINDOWS montada/emulada, o el disco puesto  º
echo       º                                             º
echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo 	    Presiona una tecla para comenzar! 
pause>nul
:menu
title WIN7USB == by leian1306
cls
MODE CON: COLS=58 LINES=15
echo.
echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo       º Selecciona una opcion:                      º
echo       ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo       º                                             º
echo       º 1. Completo (Preparacion USB + Copia)       º
echo       º                                             º
echo       º 2. Parcial (solo Copia de archivos)         º
echo       º                                             º
echo       º 3. Salir                                    º
echo       º                                             º
echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p opc=OPCION ELEGIDA: 
if '%opc%'=='' goto menu
if %opc%==2 goto copia
if %opc%==3 goto close
if %opc% LSS 1 goto error
if %opc% GTR 3 goto error

MODE CON: COLS=58 LINES=24
title Seleccion de disco == WIN7USB
cls
echo.
echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo       º                                             º
echo       º En la siguiente pantalla veras una lista    º
echo       º con los discos actualmente conectados...    º
echo       º observa la lista y fijate que numero de     º
echo       º disco es tu memoria USB.                    º
echo       º                                             º
echo       º Por ejemplo:                                º
echo       º                                             º
echo       º Num Disco   Estado   Tamano   Disp  Din Gpt º
echo       º ---------   ------   ------   ----  --- --- º
echo       º Disco 0   En linea   232GB    1024kb        º
echo       º Disco 1   En linea   1910MB   0B            º
echo       º                                             º
echo       º Si tu memoria es de 2GB seguramente es el   º
echo       º Disco 1, y el Disco 0 es el HD principal    º
echo       º                                             º
echo       º Entonces eliges 1                           º
echo       º                                             º
echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo            Presiona una tecla para continuar...
pause>nul

set /a entorno=2

:disco
cls
MODE CON: COLS=70 LINES=16
echo>tmpcommands.txt list disk
diskpart -s tmpcommands.txt
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º  === ASEGURATE DE ELEGIR EL NUMERO DE DISCO CORRECTO!!! ===  º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p USB=NUMERO DE DISCO DEL USB: 
echo.
if '%USB%'=='' goto disco

:formateo
cls
MODE CON: COLS=70 LINES=15
set /a entorno=5
title Tipo de formateo == WIN7USB
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º Elija que tipo de formateo desea realizar:                   º
echo   ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo   º                                                              º
echo   º 1. Formato rapido (solo se borraran los archivos) [+rapido]  º
echo   º                                                              º
echo   º 2. Formato normal (tambien se verificara el disco) [+lento]  º
echo   º                                                              º
echo   º 3. Salir                                                     º
echo   º                                                              º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p opci=OPCION ELEGIDA: 
echo.
if '%opci%'=='' goto formateo
if %opci%==3 goto close
if %opci% LSS 1 goto error
if %opci% GTR 3 goto error

echo>tmpcommands.txt select disk %USB%
echo>>tmpcommands.txt clean
echo>>tmpcommands.txt create partition primary
echo>>tmpcommands.txt select partition 1
echo>>tmpcommands.txt active
if %opci%==1 echo>>tmpcommands.txt format fs=fat32 LABEL="DBUSB" QUICK
if %opci%==2 echo>>tmpcommands.txt format fs=fat32 LABEL="DBUSB"
echo>>tmpcommands.txt assign
echo>>tmpcommands.txt exit

:prep
MODE CON: COLS=70 LINES=25
cls
echo.
echo         -------- NUMERO DE DISCO SELECCIONADO : %USB% --------
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º                                                              º
echo   º   ===== EL DISCO SELECCIONADO SERA FORMATEADO!!!!!! =====    º
echo   º                                                              º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo         ASEGURATE DE HABER SELECCIONADO EL DISCO CORRECTO
echo    GUARDA TODOS LOS ARCHIVOS IMPORTANTES QUE NO QUIERAS PERDER...
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º Selecciona una opcion:                                       º
echo   ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo   º                                                              º
echo   º 1. COMENZAR A PREPARAR EL USB!!!                             º
echo   º                                                              º
echo   º 2. Volver a seleccion de disco                               º
echo   º                                                              º
echo   º 3. Salir                                                     º
echo   º                                                              º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p opci=OPCION ELEGIDA: 
if '%opci%'=='' goto prep
if %opci%==2 goto disco
if %opci%==3 goto close
if %opci% LSS 1 goto error
if %opci% GTR 3 goto error

title Preparando USB == WIN7USB
cls
diskpart -s tmpcommands.txt
cls
MODE CON: COLS=70 LINES=4
echo.
echo                  === PREPARACION COMPLETADA!!! ===
echo.
ping -n 3 localhost>nul

:copia
MODE CON: COLS=68 LINES=22
title Copia de archivos == WIN7USB
set /a entorno=3
set /a MEM=
set /a LEC=
cls
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º                                                              º
echo   º           ===== ETAPA DE COPIA DE ARCHIVOS =====             º
echo   º                                                              º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º                === SELECCION DE LETRAS ===                   º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.       
echo   1. Seleccion de letra de la memoria USB: [%MEM%]
echo.       
echo   2. Seleccion de letra de la unidad de disco: [%LEC%]
echo.
echo   3. COMENZAR LA COPIA DE ARCHIVOS!!
echo.
echo   4. Salir
echo.
echo.
set /p opcio=OPCION ELEGIDA: 
echo. 
if '%opcio%'=='' goto copia
if %opcio%==2 goto seldisco
if %opcio%==3 goto copiar
if %opcio%==4 goto close
if %opcio% LSS 1 goto error
if %opcio% GTR 4 goto error

:selusb
MODE CON: COLS=68 LINES=8
title Seleccion de letra de la memoria USB == WIN7USB
cls
echo.
echo   --- SELECCIONA LA LETRA DE TU MEMORIA USB
echo.
echo   Por ejemplo: te fijas en Mi PC y tu memoria es la letra F
echo   entonces ingresas F,sin los ":"
echo.
set /p MEM=LETRA DE LA MEMORIA: 
echo.
if '%MEM%'=='' (goto selusb) ELSE (goto copia)

:seldisco
MODE CON: COLS=68 LINES=8
title Seleccion de letra de la lectora == DAMN! BootUSB
cls
echo.
echo   --- SELECCIONA LA LETRA DE LA UNIDAD DONDE ESTA WINDOWS7
echo.
echo   Por ejemplo: te fijas en Mi PC y tu lectora es la letra E
echo   entonces ingresas E,sin los ":"
echo.
set /p LEC=LETRA DE LA LECTORA: 
echo.
if '%LEC%'=='' (goto seldisco) ELSE (goto copia)

:copiar
MODE CON: COLS=68 LINES=5
cls
set /a bool=1
echo.
if '%MEM%'=='' (
echo      === FALTA SELECCIONAR LA LETRA DE LA MEMORIA USB!!! === 
set /a bool=2
) 
echo.
if '%LEC%'=='' (
echo         === FALTA SELECCIONAR LA LETRA DE LA LECTORA!!! === 
set /a bool=2
)
if %bool%==2 (
ping -n 4 localhost>nul
goto copia
)

MODE CON: COLS=68 LINES=5
cls
echo.
echo    Presiona una tecla para comenzar la copia de archivos...
pause>nul
set /a entorno=4

:precopia
MODE CON: COLS=68 LINES=16
title Confirmacion para la copia de archivos == WIN7USB
cls
echo.
echo    Seguro que seleccionaste bien las unidades?
echo    Esta es tu ultima oportunidad...
echo.
echo    USB: [%MEM%] 
echo    LEC: [%LEC%]
echo.
echo    1. Seleccione todo bien,DALE!
echo.
echo    2. Mmmm no estoy seguro,vamos a revisar...
echo.
echo    3. Salir
echo.
echo.
set /p var=OPCION ELEGIDA: 
if '%var%'=='' goto precopia
if %var%==2 goto copia
if %var%==3 goto close
if %var% LSS 1 goto error
if %var% GTR 3 goto error

MODE CON: COLS=68 LINES=8
cls
echo.
echo           ******   ******     *     ******  **    **
echo           **  **   *         * *    **    *  **  **
echo           ******   *****    *****   **    *    **
echo           **  ***  *       **   **  **    *    **   
echo           **   *** ****** **     ** ******     **    *** *** ***
echo.
ping -n 3 localhost>nul
cls
echo.
echo                    ******* ****** ******
echo                    ***     *      ******
echo                    ******* *****    **
echo                        *** *        **
echo                    ******* ******   **    *** *** ***
echo.
ping -n 3 localhost>nul
cls
echo.
echo                      ********* *********  ****       
echo                      ***       ***   ***  ****
echo                      ********* ***   ***  ****
echo                      ***   *** ***   ***  
echo                      ********* *********  ****
echo.
ping -n 3 localhost>nul

MODE CON: COLS=68 LINES=18
title Copiando archivos == WIN7USB
cls
xcopy %LEC%:*.* /e/f/h/r/y %MEM%:

goto salir

:error
MODE CON: COLS=60 LINES=8
title ERROR! == WIN7USB
color 0C
echo.
echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo       º                                             º
echo       º  ERROR : debe ingresar una opcion valida!!  º
echo       º                                             º
echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
ping -n 4 localhost>nul
color 0f
if %entorno%==1 goto menu
if %entorno%==2 goto disco
if %entorno%==3 goto copia
if %entorno%==4 goto precopia
if %entorno%==5 goto formateo

:salir
del /f tmpcommands.txt
MODE CON: COLS=68 LINES=9
title Listo! == WIN7USB
cls
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º                                                              º
echo   º   ===== TAREA COMPLETADA! GRACIAS POR USAR WIN7USB! =====    º
echo   º                                                              º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
ping -n 2 localhost>nul
color 0d
ping -n 2 localhost>nul
color 09
ping -n 2 localhost>nul
color 0c
ping -n 2 localhost>nul
color 0a
ping -n 2 localhost>nul
color 0f
ping -n 2 localhost>nul
echo  Presiona una tecla para terminar...
pause>nul
exit

:close
del /f tmpcommands.txt
MODE CON: COLS=68 LINES=8
title Saliendo == WIN7USB
cls
echo.
echo   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º                                                              º
echo   º             ===== GRACIAS POR USAR WIN7USB! =====            º
echo   º                                                              º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
ping -n 4 localhost>nul
exit
