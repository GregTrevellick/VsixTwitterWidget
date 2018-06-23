rem todo convert to gulp ?
echo "SolutionDir" %1
echo "ProjectDir" %2

FOR %%G IN (devhumor,vsts) DO (

REM Copy the static files to each of the projects. The manifest json file only allows paths that are children of its own directory, hence can't specify the common files themselves in the manifest json files. Also, shortcut file links won't do the trick either. Do not put the copied files into .gitignore as they are part of final vsix file and hence worthy of source control. /r Overwrites read-only files. /y Overwrites existing files without prompting you.
rem todo create the file if it doesn't exist 
xcopy /R /Y %2artefacts\Licence.md %1@%%G\artefacts\Licence.md

REM copy javascript files
xcopy %2app\Scripts\SDK\* %1@%%G\app\Scripts\SDK\ /E /I /Y /S 
xcopy %2app\Scripts\app.js %1@%%G\app\Scripts\app.js /R /Y
xcopy %2app\Scripts\styling.js %1@%%G\app\Scripts\styling.js /R /Y 

REM Make the new files read-only
attrib +R %1@%%G\artefacts\Licence.md
attrib +R %1@%%G\app\Scripts\*

REM launch widgets in browsers
start  %1@%%G\app\dashboard-widget.html

REM re-gen vsix's (having manually updated the version no. in json files)
rem todo auto updated the version no. in json files
cd %1@%%G\
tfx extension create --manifest-globs vss-extension.json

)
