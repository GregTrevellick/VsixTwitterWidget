rem todo stop using hardcoded paths
rem todo convert to gulp ?

FOR %%G IN (devhumor,vsts) DO (

REM Copy the static files to each of the projects. The manifest json file only allows paths that are children of its own directory, hence can't specify the common files themselves in the manifest json files. Also, shortcut file links won't do the trick either. Do not put the copied files into .gitignore as they are part of final vsix file and hence worthy of source control. /r Overwrites read-only files. /y Overwrites existing files without prompting you.
rem todo create the file if it doesn't exist 
xcopy /r /y "C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\artefacts\Licence.md" "C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\artefacts\Licence.md" 

REM copy javascript files
xcopy C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\app\Scripts\SDK\* C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\SDK\ /e /i /y /s 
xcopy C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\app\Scripts\app.js C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\app.js /r /y 
xcopy C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\app\Scripts\styling.js C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\styling.js /r /y 

REM Make the new files read-only
rem todo do this recursively for directory ?
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\artefacts\Licence.md
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\app.js
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\styling.js
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\Scripts\SDK\*

REM launch widgets in browsers
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\app\dashboard-widget.html

REM re-gen vsix's (having manually updated the version no. in json files)
rem todo auto updated the version no. in json files
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@%%G\
tfx extension create --manifest-globs vss-extension.json

)