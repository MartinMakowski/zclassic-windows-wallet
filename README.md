# zclassic-windows-wallet

ZClassic Windows native GUI client. Alfa version, may be unstable.

![alt tag](https://raw.githubusercontent.com/wiki/fxminer/zclassic-windows-wallet/images/zclassic-windows-wallet_v0.0.5.png) 


Quick port zclassic-docker-gui-wallet which includes zclassic windows native client.
Release includes all you need to run ZClassic (params, blockchain, JRE 8, Git bash ecosystem).

**Warning: Wallet is not encrypted. Many viruses are looking for your unencrypted wallet.dat file. Use [VeraCrypt](https://veracrypt.codeplex.com/) to create encrypted drive and extract ZClassic to encrypted drive.**

Wallet is tested in:
- Windows 7
- Windows 8.1
- Windows Server 2012

EnJoY and star github project!

## Requirements

- Minimum 4GB RAM / Recommended 8GB RAM 
- Minimum 3GB disk storage 

## Install 
[Download zclassic-windows-wallet package](https://github.com/fxminer/zclassic-windows-wallet/releases) and extract to any directory.

## Run

- start_zclassic_server.exe - to start server

- start_zclassic_wallet.exe - to start java client

- zcash-cli.exe - to run command line interface
```
./zcash-cli z_gettotalbalance
```

## Sources

- Java Code: https://github.com/fxminer/zcash-swing-wallet-ui

- ZClassic: https://github.com/z-classic/zclassic

## Backup wallet

### To text file

- Start zcash-cli.exe
```
./zcash-cli z_exportwallet FILE_NAME
```

- Copy file to safe location.

### wallet.dat

Copy .zclassic/wallet.dat

## Restore wallet

### Import from text file

- Start zcash-cli.exe
```
./zcash-cli z_importwallet FILE_NAME
```

### wallet.dat
Overwrite .zclassic/wallet.dat

# FAQ

- Zaddr transaction status
```
./zcash-cli z_listoperationids
./zcash-cli z_getoperationresult

```

# Security Warnings
[See important security warnings](https://github.com/z-classic/zclassic/blob/master/doc/security-warnings.md)

zclassic-windows-wallet, Zclassic and Zcash are unfinished and highly experimental. Use at your own risk.
