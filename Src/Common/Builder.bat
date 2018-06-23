rem todo convert to gulp ?
REM %1 === $(ProjectDir)

FOR %%G IN (devhumor,vsts) DO (

REM Copy the static files to each of the projects. The manifest json file only allows paths that are children of its own directory, hence can't specify the common files themselves in the manifest json files. Also, shortcut file links won't do the trick either. Do not put the copied files into .gitignore as they are part of final vsix file and hence worthy of source control. /r Overwrites read-only files. /y Overwrites existing files without prompting you.
rem todo create the file if it doesn't exist 
xcopy /R /Y %1artefacts\Licence.md C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\artefacts\Licence.md

REM copy javascript files
xcopy %1app\Scripts\SDK\* C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\SDK\ /E /I /Y /S 
xcopy %1app\Scripts\app.js C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\app.js /R /Y
xcopy %1app\Scripts\styling.js C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\styling.js /R /Y 

rem start xcopy /E /Y /R "$(ProjectDir)Scripts" "$(SolutionDir)MainWebAppScripts"
rem start xcopy /E /Y /R "$(ProjectDir)Scripts*.js" "$(SolutionDir)MainWebAppScripts"
rem start xcopy /E /Y /R "$(ProjectDir)Scripts*.ts" "$(SolutionDir)MainWebAppScripts"





REM Make the new files read-only
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\artefacts\Licence.md
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\*

REM launch widgets in browsers
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\dashboard-widget.html

REM re-gen vsix's (having manually updated the version no. in json files)
rem todo auto updated the version no. in json files
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\
tfx extension create --manifest-globs vss-extension.json

)
