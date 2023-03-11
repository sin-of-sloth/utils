# windows-icon

![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Windows Terminal](https://img.shields.io/static/v1?logo=windowsterminal&style=for-the-badge&message=CMD&label=&color=4D4D4D)
![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white)

A batch file to create a Windows folder with a custom icon.

## Usage

Open cmd or powershell and run:

```cmd
> [path_to_script]\icon.bat [path_to_new_folder] [path_to_icon]
```

_Notes:_

- _For file/directory names with spaces, enclose them in double quotes `""`_
- _Icon files typically have the extension `.ico` for use in Windows_

For example, if you ran

```cmd
> Desktop\icon.bat Desktop\test\Nobody Downloads\hamham.ico
> Desktop\icon.bat Desktop\test\Expects Downloads\blurred-shocked-cat.ico
> Desktop\icon.bat "Desktop\test\the Spanish Inquisiton" Downloads\spanish.ico
```

You'd get folders like so:

![custom folders](./assets/img.png)
