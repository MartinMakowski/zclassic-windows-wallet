#include "zclassic-windows-wallet-common.iss"

[Setup]
OutputBaseFilename=zclassic-windows-wallet-setup_full_v{#SetupSetting("AppVersion")}

[Dirs]
Name: "{userappdata}/ZcashParams"; Flags: uninsneveruninstall; Permissions: everyone-full

[Files]
Source: "packages/.zcash-params/*"; DestDir: "{userappdata}/ZcashParams"; Flags: uninsneveruninstall onlyifdoesntexist; Permissions: everyone-full