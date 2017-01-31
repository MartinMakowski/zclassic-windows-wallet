[Setup]
; App info
AppVersion=42815

AppName=ZClassic Blockchain
AppId=zclassic-blockchain
AppMutex=zclassic-blockchain
SetupMutex=zclassic-blockchain,Global\zclassic-blockchain
AppPublisher=Community
AppPublisherURL=http://www.zclassic.org

; Build
ArchitecturesAllowed=x64
Compression=lzma2/ultra
SolidCompression=yes

; Output file
OutputDir=installer
OutputBaseFilename=zclassic-blockchain_v{#SetupSetting("AppVersion")}
SetupIconFile=images\zcl-logo.ico

; Installation setup
DefaultDirName={pf64}\zclassic-windows-wallet
DefaultGroupName=ZClassic Blockchain
DisableProgramGroupPage=yes
DisableStartupPrompt=yes
DisableWelcomePage=yes
UninstallDisplayIcon=images\zcl-logo.ico
UninstallFilesDir={app}\uninst_blockchain
PrivilegesRequired=none
DirExistsWarning=no

[Dirs]
Name: "{app}"; Permissions: everyone-full

[Files]
Source: "packages/zclassic-blocks/*"; DestDir: "{app}/.zclassic"; Flags: recursesubdirs createallsubdirs; Permissions: everyone-full

[Languages]
Name: english; MessagesFile: compiler:Default.isl
