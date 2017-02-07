# zclassic-windows-wallet

ZClassic Windows native GUI client.
Features:
- Annonymous and public account transfers support (zaddr, taddr)
- Anonymous messanger (zmsg)
- Native Windows ZClassic 1.0.5 (Full node)
- Can be used as cold storage address generator

![alt tag](https://raw.githubusercontent.com/wiki/fxminer/zclassic-windows-wallet/images/zclassic-windows-wallet_v0.0.7.png) 


Port of [zclassic-docker-gui-wallet](https://github.com/fxminer/zclassic-docker-gui-wallet) + ZClassic Windows native client.

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
[Download zclassic-windows-wallet package](https://github.com/fxminer/zclassic-windows-wallet/releases) and install to any directory.

## Run

- ZClassic Server (start_zclassic_server.exe)

- ZClassic Windows Wallet (start_zclassic_wallet.exe)

- ZClassic CLI (start-zclassic-cli.exe) - Command line interface
```
./zcash-cli z_gettotalbalance
```
## [ZMSG](https://github.com/whyrusleeping/zmsg)

Open ZClassic command line interface from desktop (ZClassic CLI). Only zaddr addresses are supported.

### Check messages
```
zmsg check
```
### Send message
zmsg sendmsg --from FROM_Z_ADDR --to TO_Z_ADDR "Message"
```
zmsg sendmsg --from zcK8L8zBNSkZhY8BSmVagA875pvAjeMpKCAPDkzQ9y9VKivHxZFhMaJEbp1QjBP2PubRk7oHnk5UFkqYVQq4mW3N3j9yG1K --to zcKCNcDkmSMbeidh1eYyj6E1oCaivt2mWkgU2yj61kc2ugHV6HBmVu5Umq9F1bb71AyF4pBC3ZT4XrNhjCWZRLati5aCHQq "My first blockchain MSG"
```

## Sources

- Java Code: https://github.com/fxminer/zcash-swing-wallet-ui

- ZClassic: https://github.com/z-classic/zclassic Build: https://zcash.dl.mercerweiss.com/zclassic-v1.0.5.zip

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
# License
[GNU GPLv3](http://www.gnu.org/licenses/gpl.html)

Project includes the following:
- Java GUI is based on [zcash-swing-wallet-ui](https://github.com/fxminer/zcash-swing-wallet-ui)
- [ZClassic windows native build](https://github.com/z-classic/zclassic)
- [zmsg](https://github.com/whyrusleeping/zmsg)

# Security Warnings
[See important security warnings](https://github.com/z-classic/zclassic/blob/master/doc/security-warnings.md)

zclassic-windows-wallet, Zclassic and Zcash are unfinished and highly experimental. Use at your own risk.
