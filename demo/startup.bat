@rem ----------------------------------------------------------------------------
@rem ����App�Ľű�
@rem
@rem ��Ҫ�������»���������
@rem
@rem    JAVA_HOME           - JDK�İ�װ·��
@rem
@rem ----------------------------------------------------------------------------
@echo off
if "%OS%"=="Windows_NT" setlocal

:CHECK_JAVA_HOME
if not "%JAVA_HOME%"=="" goto SET_APP_HOME

echo.
echo ����: �������û���������JAVA_HOME����ָ��JDK�İ�װ·��
echo.
goto END

:SET_APP_HOME
@rem set APP_HOME=%~dp0..
set APP_HOME=%cd%
if not "%APP_HOME%"=="" goto START_APP

echo.
echo ����: �������û���������APP_HOME����ָ��App�İ�װ·��
echo.
goto END

:START_APP


set DEFAULT_OPTS=-server -Xms256m -Xmx1024m -Xss20m
set DEFAULT_OPTS=%DEFAULT_OPTS% -XX:+HeapDumpOnOutOfMemoryError -XX:+AggressiveOpts -XX:+UseParallelGC -XX:+UseBiasedLocking -XX:NewSize=64m
set DEFAULT_OPTS=%DEFAULT_OPTS% "-Dapp.home=%APP_HOME%"
set DEFAULT_OPTS=%DEFAULT_OPTS% "-Dapp.name=AppDemo"
set DEFAULT_OPTS=%DEFAULT_OPTS% "-Djlauncher.conf=%APP_HOME%\jlauncher.xml"

set JAVA_EXE="%JAVA_HOME%\bin\java.exe"
set CLASSPATH="%APP_HOME%\common\jlauncher-1.3.0-SNAPSHOT.jar"
set MAIN_CLASS="com.pilicat.jlauncher.core.Launcher"

%JAVA_EXE% %DEFAULT_OPTS% -classpath %CLASSPATH% %MAIN_CLASS% %*

:END
if "%OS%"=="Windows_NT" endlocal
pause