@ECHO OFF
IF DEFINED CQF-TOOLING-HOME (
	ECHO Looking in %CQF-TOOLONG-HOME% for jar file

) else (

ECHO Please set CQF-TOOLING-HOME environment variable
GOTO done
)
SET "dlurl=https://oss.sonatype.org/service/local/artifact/maven/redirect?r=snapshots^&g=org.opencds.cqf^&a=tooling^&v=1.4.1-SNAPSHOT^&c=jar-with-dependencies"
SET tooling_jar=tooling-1.4.1-SNAPSHOT-jar-with-dependencies.jar
REM SET input_cache_path=%~dp0input-cache\
SET input_cache_path=%CQF-TOOLING-HOME%\
SET skipPrompts=false
IF "%~1"=="/f" SET skipPrompts=true

FOR %%x IN ("%CD%") DO SET upper_path=%%~dpx

IF NOT EXIST "%CQF-TOOLING-HOME%\%tooling_jar%" (
REM Download the jar
) ELSE (
   ECHO %tooling_jar% FOUND in %CQF-TOOLING-HOME%

   GOTO:done
)

:download
ECHO Downloading from %dlurl%
ECHO Downloading %tooling_jar% to %CQF-TOOLING-HOME% - it's large, so this may take a bit ...
REM -L means to folow redirects
curl %dlurl% -L --output-dir %CQF-TOOLING-HOME% -o %tooling_jar%

:done
IF "%skipPrompts%"=="false" (
    PAUSE
)
@ECHO ON