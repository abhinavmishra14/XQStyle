@ECHO OFF
 
ECHO ###################### Welcome %USERNAME% to XQStyle Tool ########################
ECHO.
 
:Validate
SET /P xqyFile=Please enter xquery file/directory:
ECHO.
 
IF "%xqyFile%"=="" ECHO You did not provided file/directory! & GOTO Error
ECHO.
 
SET /P xqRules=Please provide rules xml file:
ECHO.
 
set classpath=%classpath%;./xqstyle.jar;./commons-lang3-3.1.jar;
 
IF NOT "%2"=="" GOTO CallReview
ECHO.
 
IF "%xqRules%"=="" GOTO CallReviewWithoutRules
ECHO.
 
:CallReview
ECHO Processing request for %xqyFile% with rule set %xqRules% ...
SET /P outptPath=Please enter output directory:
ECHO.
java com.xqstyle.report.renderers.XQStyleHtmlRenderer %xqyFile% %xqRules% %outptPath%
GOTO ValidateAgain
 
:CallReviewWithoutRules
ECHO Processing request for %xqyFile% with default rule set ...
SET /P outptPath=Please enter output directory:
ECHO.
java com.xqstyle.report.renderers.XQStyleHtmlRenderer %xqyFile% %outptPath%
GOTO ValidateAgain
 
::Declaring a 'ValidateAgain' function
:ValidateAgain
ECHO.
SET /P flag=Do you want to review another xqy file/directory (Y/N)? or type 'exit' to exit from here:
IF "%flag%"=="exit" ECHO. & GOTO End
IF "%flag%"=="EXIT" ECHO. & GOTO End  
IF "%flag%"=="" ECHO Entered option is invalid! & GOTO End 
IF "%flag%"=="Y" ECHO. & GOTO Validate 
IF "%flag%"=="y" ECHO. & GOTO Validate 
IF "%flag%"=="N" ECHO. & GOTO End 
IF "%flag%"=="n" ECHO. & GOTO End 
IF NOT "%flag%"=="Y" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error
IF NOT "%flag%"=="y" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error  
IF NOT "%flag%"=="N" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error 
IF NOT "%flag%"=="n" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error
 
 
::Declaring a 'Error' function
:Error
ECHO.
SET /P flag=Invalid input provided, Do you want to review the xqy file/directory (Y/N)? or type 'exit' to exit from here:
IF "%flag%"=="exit" ECHO. & GOTO End
IF "%flag%"=="EXIT" ECHO. & GOTO End  
IF "%flag%"=="" ECHO Entered option is invalid! & GOTO End 
IF "%flag%"=="Y" ECHO. & GOTO Validate 
IF "%flag%"=="y" ECHO. & GOTO Validate 
IF "%flag%"=="N" ECHO. & GOTO End 
IF "%flag%"=="n" ECHO. & GOTO End 
IF NOT "%flag%"=="Y" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error
IF NOT "%flag%"=="y" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error  
IF NOT "%flag%"=="N" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error 
IF NOT "%flag%"=="n" ECHO Entered option is invalid, Please select (Y/N)! & GOTO Error
 
 
::Declaring a 'End' function
:End
ECHO.
ECHO Bye Bye!!