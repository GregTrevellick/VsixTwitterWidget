REM launch widgets in browsers
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\app\dashboard-widget.html
start  C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\app\dashboard-widget.html



REM re-gen vsix's
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@DevHumor\
tfx extension create --manifest-globs vss-extension.json
cd C:\Users\gtrev\Source\Repos\VsixTwitterWidget\Src\@Vsts\
tfx extension create --manifest-globs vss-extension.json

