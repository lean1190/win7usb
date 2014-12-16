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
REM  Appicon: D:\Mis Documentos\Proyetos\Programaciones\BATCH\WIN7USB\icon.ico
REM  QBFC Project Options End

@echo off& MODE CON: COLS=58 LINES=13
color 0f
title WIN7USB == by leian1306
set /a entorno=1
echo.
echo       ษอออออออออออออออออออออออออออออออออออออออออออออป
echo       บ    BIENVENIDO AL ASISTENTE DE WIN7USB!      บ
echo       ฬอออออออออออออออออออออออออออออออออออออออออออออน
echo       บ                                             บ
echo       บ Antes que nada asegurate de tener tu        บ
echo       บ memoria USB conectada y tu imagen de        บ
echo       บ WINDOWS montada/emulada, o el disco puesto  บ
echo       บ                                             บ
echo       ศอออออออออออออออออออออออออออออออออออออออออออออผ
echo.
echo 	    Presiona una tecla para comenzar! 
pause>nul
:menu
title WIN7USB == by leian1306
cls
MODE CON: COLS=58 LINES=15
echo.
echo       ษอออออออออออออออออออออออออออออออออออออออออออออป
echo       บ Selecciona una opcion:                      บ
echo       ฬอออออออออออออออออออออออออออออออออออออออออออออน
echo       บ                                             บ
echo       บ 1. Completo (Preparacion USB + Copia)       บ
echo       บ                                             บ
echo       บ 2. Parcial (solo Copia de archivos)         บ
echo       บ                                             บ
echo       บ 3. Salir                                    บ
echo       บ                                             บ
echo       ศอออออออออออออออออออออออออออออออออออออออออออออผ
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
echo       ษอออออออออออออออออออออออออออออออออออออออออออออป
echo       บ                                             บ
echo       บ En la siguiente pantalla veras una lista    บ
echo       บ con los discos actualmente conectados...    บ
echo       บ observa la lista y fijate que numero de     บ
echo       บ disco es tu memoria USB.                    บ
echo       บ                                             บ
echo       บ Por ejemplo:                                บ
echo       บ                                             บ
echo       บ Num Disco   Estado   Tamano   Disp  Din Gpt บ
echo       บ ---------   ------   ------   ----  --- --- บ
echo       บ Disco 0   En linea   232GB    1024kb        บ
echo       บ Disco 1   En linea   1910MB   0B            บ
echo       บ                                             บ
echo       บ Si tu memoria es de 2GB seguramente es el   บ
echo       บ Disco 1, y el Disco 0 es el HD principal    บ
echo       บ                                             บ
echo       บ Entonces eliges 1                           บ
echo       บ                                             บ
echo       ศอออออออออออออออออออออออออออออออออออออออออออออผ
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
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ  === ASEGURATE DE ELEGIR EL NUMERO DE DISCO CORRECTO!!! ===  บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ Elija que tipo de formateo desea realizar:                   บ
echo   ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
echo   บ                                                              บ
echo   บ 1. Formato rapido (solo se borraran los archivos) [+rapido]  บ
echo   บ                                                              บ
echo   บ 2. Formato normal (tambien se verificara el disco) [+lento]  บ
echo   บ                                                              บ
echo   บ 3. Salir                                                     บ
echo   บ                                                              บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ                                                              บ
echo   บ   ===== EL DISCO SELECCIONADO SERA FORMATEADO!!!!!! =====    บ
echo   บ                                                              บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo.
echo         ASEGURATE DE HABER SELECCIONADO EL DISCO CORRECTO
echo    GUARDA TODOS LOS ARCHIVOS IMPORTANTES QUE NO QUIERAS PERDER...
echo.
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ Selecciona una opcion:                                       บ
echo   ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
echo   บ                                                              บ
echo   บ 1. COMENZAR A PREPARAR EL USB!!!                             บ
echo   บ                                                              บ
echo   บ 2. Volver a seleccion de disco                               บ
echo   บ                                                              บ
echo   บ 3. Salir                                                     บ
echo   บ                                                              บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ                                                              บ
echo   บ           ===== ETAPA DE COPIA DE ARCHIVOS =====             บ
echo   บ                                                              บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo.
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ                === SELECCION DE LETRAS ===                   บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
echo       ษอออออออออออออออออออออออออออออออออออออออออออออป
echo       บ                                             บ
echo       บ  ERROR : debe ingresar una opcion valida!!  บ
echo       บ                                             บ
echo       ศอออออออออออออออออออออออออออออออออออออออออออออผ
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
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ                                                              บ
echo   บ   ===== TAREA COMPLETADA! GRACIAS POR USAR WIN7USB! =====    บ
echo   บ                                                              บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
echo   ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo   บ                                                              บ
echo   บ             ===== GRACIAS POR USAR WIN7USB! =====            บ
echo   บ                                                              บ
echo   ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo.
ping -n 4 localhost>nul
exit
