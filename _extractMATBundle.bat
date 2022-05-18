@ECHO OFF
IF DEFINED CQF-TOOLING-HOME (
	ECHO Looking in %CQF-TOOLING-HOME% for jar file

) else (

ECHO Please set CQF-TOOLING-HOME environment variable
GOTO done
)
if "%1"==""  GOTO usage
SET mat_bundle=%1
if NOT EXIST "%mat_bundle%" (GOTO nobundle)

SET tooling_jar=tooling-1.4.1-SNAPSHOT-jar-with-dependencies.jar

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%CQF-TOOLING-HOME%\%tooling_jar%" (
	ECHO running: JAVA -jar "%CQF-TOOLING-HOME%\%tooling_jar%" -ExtractMatBundle %mat_bundle%
	JAVA -jar "%CQF-TOOLING-HOME%\%tooling_jar%" -ExtractMatBundle %mat_bundle%

) ELSE (
	ECHO Tooling JAR NOT FOUND in %CQF-TOOLING-HOME%.  Please run _updateCQFTooling.  Aborting...
)
GOTO done
:nobundle
echo %mat_bundle% does not exist. See below for posible json files
dir /b/s/a-d . | grep bundles.mat | grep \.json
:usage
ECHO Usage: _extractMATBundle jsonFile // e.g. jsonFile = bundles\mat\0512\CMS104-v1-0-FHIR-4-0-1.json 
:done
PAUSE
