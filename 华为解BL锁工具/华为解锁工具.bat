@ECHO off
color 30
echo.       
echo                           华为解锁工具  ---线刷宝                              
ECHO. 
echo 手机进入fastboot模式，用数据线连接电脑
echo 进入fastboot模式的方法：（以下是华为不同机型的进模式方法，可逐一尝试）
echo.
echo 1.关机状态，按音量下+电源键同时插线进入
echo 2.关机状态，按住音量下键插线进入（例如：P7,P8系列）
echo 3.关机状态，音量下键加电源键齐按进入（例如：荣耀畅玩系列）
echo.                   
pause
CLS
echo.
ECHO. ---------------------------确认模式---------------------------------		
echo.1.成功进入fastboot模式标识：若手机显示绿色机器人
echo.  或停留在开机第一屏，或显示"FASTBOOT&RESCUE MODE"字样
echo.
echo.2.如果是以上任一模式情况，请按任意键继续，如果不是请重新尝试
echo.
pause
CLS
echo.
ECHO. --------------------------本机解锁状态------------------------------
fastboot oem get-bootinfo
echo.
ECHO. ---------------------------状态说明---------------------------------
echo.
echo.   根据以上解锁信息显示 "loked"或 "unloked"？
echo.
echo.  "loked"，  表示您的手机已加锁，按任意键进行下一步解锁操作
echo.
echo.  "unloked"，表示您的手机没上锁，可直接刷机！
echo.
pause
CLS			
echo.
ECHO. ---------------------------开始解锁---------------------------------	
echo.
echo.1.即将开始解锁bootloader，请确认已经获取了解锁码。
echo.
echo 2.解锁码格式是16位数字。 
echo.
echo. 
set /p unlockcode=请输入16位解锁码，然后按回车: 
fastboot oem unlock %unlockcode%
CLS
echo.
ECHO. ---------------------------解锁结束---------------------------------	
echo.
echo 1. 如果看到手机显示 Unlock Fail ! 请检查解锁码是否输入错误，请检查一次。
echo.
echo.2. 如果确认解锁码没有输入错误，请联系华为客服
echo.
echo.
echo.按任意键即可关闭本窗口...
ECHO. 
pause >nul
goto EXIT
:EXIT
exit