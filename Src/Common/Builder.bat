REM TODO stop using hardcoded paths
REM TODO stop duplicate the lines below & start looping thru a list of projects
REM TODO convert to gulp ?

REM copy the static files to each of the projects. The manifest json file only allows paths that are children of its own directory, hence can't specify the common files themselves in the manifest json files. Also, shortcut file links won't do the trick either. Make the target files read only (/r) for obvious reasons & overwrite each time (/y). Omit the copied files from .gitignore as they are part of final vsix file.
xcopy /r /y C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\artefacts\Licence.md C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\artefacts\Licence.md
xcopy /r /y C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\Common\artefacts\Licence.md C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\artefacts\Licence.md

REM launch widgets in browsers
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\app\dashboard-widget.html
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\app\dashboard-widget.html

REM re-gen vsix's (having manually updated the version no. in json files)
REM TODO auto updated the version no. in json files
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\
tfx extension create --manifest-globs vss-extension.json
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\
tfx extension create --manifest-globs vss-extension.json
