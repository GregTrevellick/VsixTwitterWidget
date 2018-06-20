REM TODO stop using hardcoded paths
REM TODO stop duplicate the lines below & start looping thru a list of projects
REM TODO convert to gulp ?



REM Copy the static files to each of the projects. 
REM The manifest json file only allows paths that are children of its own directory, hence can't specify the common files themselves in the manifest json files. 
REM Also, shortcut file links won't do the trick either. 
REM /r Overwrites read-only files
REM /y Overwrites existing files without prompting you
REM Do not put the copied files into .gitignore as they are part of final vsix file and hence worthy of source control.
REM TODO create the file if it doesn't exist 
REM https://support.microsoft.com/en-gb/help/289483/switches-that-you-can-use-with-xcopy-and-xcopy32-commands
xcopy /r /y "C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\artefacts\Licence.md" "C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\artefacts\Licence.md" 
xcopy /r /y "C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\artefacts\Licence.md" "C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\artefacts\Licence.md"



REM copy the javascript files
rem todo xcopy C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\app\Scripts\* C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\app\Scripts\ /e /i /y /s 
rem todo xcopy C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\app\Scripts\* C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\app\Scripts\ /e /i /y /s 



REM Make the new files read-only
REM TODO do this recursively for directory ?
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\artefacts\Licence.md
attrib +R C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\artefacts\Licence.md



REM launch widgets in browsers
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\app\dashboard-widget.html
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\app\dashboard-widget.html



REM re-gen vsix's (having manually updated the version no. in json files)
REM TODO auto updated the version no. in json files
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\
tfx extension create --manifest-globs vss-extension.json
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\
tfx extension create --manifest-globs vss-extension.json