[VSMarketplaceUrl]: https://marketplace.visualstudio.com/search?term=trevellick&target=VSTS&category=All%20categories&sortBy=Relevance

# Change log

These are the incremental changes to each version that has been released on the official [Visual Studio Marketplace][VSMarketplaceUrl].

Individual releases are tagged as such in GitHub.

## 1.0.19
**2018-05-15**
- [x] Initial release containing @vsts tweets

## 1.1.169
**2018-06-27**
- [x] Added handful of twitter handles

## 1.1.176
**2018-06-28**
- [x] Added Russia 2018 world cup

## 1.1.185
**2018-09-11**
- [x] Added @AzureDevOps

## 1.1.193
**2018-09-22**
- [x] Added Live Soccer tweets

<!--
https://developer.twitter.com/en/docs/twitter-for-websites/embedded-tweets/overview.html
https://github.com/areve/IframeDashboardWidget
https://stackoverflow.com/questions/583753/using-css-to-affect-div-style-inside-iframe?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
https://stackoverflow.com/questions/217776/how-to-apply-css-to-iframe
https://stackoverflow.com/questions/25617202/how-to-customize-the-style-of-a-twitter-iframe-scroll-bar?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
https://stackoverflow.com/questions/15533967/styling-the-new-twitter-widget-embedded-timeline/18846544#18846544
https://stackoverflow.com/questions/5525071/how-to-wait-until-an-element-exists

BUILD EVENT VARIABLES
https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/42x5kfw4(v=vs.110)

BAT FILES ENCODING
VS > Tools > Options > Click Text Editor > File Extension.
In the Extension box, enter bat. In the Editor drop down, select Source Code (Text) Editor With Encoding and click Add. Click OK to save and exit.
Now, when you open a .bat file from within Visual Studio, you will initially get prompted with:
You will want to drill down through the options until you come to the DOS option of your language:
https://superuser.com/questions/601282/%CC%81-is-not-recognized-as-an-internal-or-external-command

XCOPY arguments
https://support.microsoft.com/en-gb/help/289483/switches-that-you-can-use-with-xcopy-and-xcopy32-commands
http://www.siddharthpandey.net/how-to-copy-any-files-using-visual-studios-build-events/

publish & install vsts extension
================================
Cmd
cd  C:\Users\gtrev\Source\Repos\VSTS_Tweets_Widget\Src
[one-off] npm i -g tfx-cli
tfx extension create --manifest-globs vss-extension.json   (n.b. auto-increments version nbr in vss-extension.json)
https://marketplace.visualstudio.com/manage/publishers/gregtrevellick
+New > VSTS
Share > GregTrevellick > Enter
VSTS home > Cog > Extensions > Click the extension > Launches MP site > Get it free > Install
Project dashboard > Bottom RHS > Click plus > Scroll down and select extension
-->