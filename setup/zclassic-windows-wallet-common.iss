#define ZCLASSIC_SERVER_NAME "ZClassic Server"
#define ZCLASSIC_SERVER_EXE "start-zclassic-server.exe"
#define ZCLASSIC_WALLET_NAME "ZClassic Windows Wallet"
#define ZCLASSIC_WALLET_EXE "start-zclassic-wallet.exe"
#define ZCLASSIC_CLI_NAME "ZClassic CLI"
#define ZCLASSIC_CLI_EXE "start-zclassic-cli.exe"

[Setup]
; App info
AppVersion=0.0.7

AppName=ZClassic Windows Wallet
AppId=zclassic-windows-wallet
AppMutex=zclassic-windows-wallet
SetupMutex=zclassic-windows-wallet-setup,Global\zclassic-windows-wallet-setup
AppPublisher=Community
AppPublisherURL=http://www.zclassic.org

; Build
ArchitecturesAllowed=x64
Compression=lzma2/ultra
SolidCompression=yes

; Output file
OutputDir=installer
SetupIconFile=images\zcl-logo.ico

; Installation setup
CloseApplications=force
CloseApplicationsFilter=*zclassic*.*,zcashd.exe
DefaultDirName={pf64}\zclassic-windows-wallet
DefaultGroupName=ZClassic Windows Wallet
DisableProgramGroupPage=yes
DisableStartupPrompt=yes
DisableWelcomePage=yes
UninstallDisplayIcon={app}\{#ZCLASSIC_WALLET_EXE}
UninstallFilesDir={app}\uninst
PrivilegesRequired=none
; +1GB required for blockchain
ExtraDiskSpaceRequired=1048576000
DirExistsWarning=yes

[Dirs]
Name: "{app}"; Flags: uninsalwaysuninstall; Permissions: everyone-full
Name: "{app}/.zclassic"; Flags: uninsneveruninstall; Permissions: everyone-full

[Files]
Source: "..\dist\zclassic\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs; Permissions: everyone-full

[Icons]
Name: "{group}\ZClassic Windows Wallet"; Filename: "{app}\start_zclassic_wallet.exe"

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Run]
Filename: "{app}\scripts\post_install.bat"; WorkingDir: "{app}"

[Icons]
Name: "{userdesktop}\{#ZCLASSIC_WALLET_NAME}"; Filename: "{app}\{#ZCLASSIC_WALLET_EXE}"; Tasks: desktopicon
Name: "{userdesktop}\{#ZCLASSIC_SERVER_NAME}"; Filename: "{app}\{#ZCLASSIC_SERVER_EXE}"; Tasks: desktopicon
Name: "{userdesktop}\{#ZCLASSIC_CLI_NAME}"; Filename: "{app}\{#ZCLASSIC_CLI_EXE}"; Tasks: desktopicon