rem  /S    Copy folders and subfolders
rem  /Y    Suppress prompt to confirm overwriting a file.
rem  /F    Display full source and destination file names while copying.
rem  /R    Overwrite read-only files.

echo "SolutionDir" %1
echo "ProjectDir" %2

rem          FOR %%G IN (newsycombinator,thelivesoccer_) DO (

FOR %%G IN (azure,ch9,code,codeproject,dailydotnettips,dev_humor,dotnet,dotnetcurry,dotnetfdn,dotnetkicks,mscloud,newsycombinator,nodejs,octopusdeploy,reddittech,thelivesoccer_,theregister,visualstudio,vsmdev,vsts,xamarinhq) DO (

	REM copy the static files to each of the projects. The manifest json file only allows paths that are children of its own directory, hence can't specify the common files themselves in the manifest json files. Also, shortcut file links won't do the trick either.
	xcopy %2app\Scripts\* %1@%%G\app\Scripts\ /F /R /Y /S
	xcopy %2artefacts\Licence.md %1@%%G\artefacts\Licence.md /F /R /Y

	REM make the new files read-only
	attrib +R %1@%%G\app\Scripts\*
	attrib +R %1@%%G\artefacts\Licence.md

	REM launch widgets in browsers
	rem            start %1@%%G\app\dashboard-widget.html

	REM re-gen vsix's 
	cd %1@%%G\
	tfx extension create --rev-version --manifest-globs vss-extension.json

	REM move vsix's to a single folder, to make easier to upload & purge
	start robocopy %1@%%G\ %2\Temp\ *.vsix /MOV	 
)