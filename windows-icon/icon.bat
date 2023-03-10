@echo off

:: show usage if an argument is missing
if "%~1" == "" set missing_args=false
if "%~2" == "" set missing_args=false

if "%missing_args%" == "false" (
    echo:
    echo Usage: ".\icon.bat [path_to_new_folder] [path_to_icon]"
    echo:
    exit
)

:: Get the path to the directory and the icon
set dir_path=%~1
set icon=%~2

:: get icon name from path to the icon
for %%a in ("%icon%\.") do set "icon_name=%%~nxa"

:: path to Desktop.ini
set ini_file=%dir_path%\Desktop.ini

:: create the directory if it doesn't already exist
if not exist "%dir_path%" (
     md "%dir_path%"
) else (
    echo:
    echo "%dir_path%" already exists, skipping creation
)

:: move the icon to the directory
move "%icon%" "%dir_path%"

:: The Desktop.ini file is now to be populated with configuration settings.
:: The settings you can use to customize your folder are:
::  [.ShellClassInfo]: This allows you to customize the folder’s view with
::      the following entries.
::  ConfirmFileOp: If this is set to “0”, you will not receive the warning
::      when deleting or moving the folder.
::  NoSharing: Setting this to “1” means that this folder cannot be shared.
::  IconFile: Used to specify a custom folder icon or thumbnail image. To
::      use this entry, you need to specify the path for the icon. The .ico
::      format is preferred, but it will accept .bmp and .dll files too.
::  IconResource: Similar to IconFile, this is used to specify the path for
::      the icon. It appears instead of IconFile when manually selecting the
::      icon from the folder’s properties.
::  IconIndex: To specify a custom icon, this entry also needs to be present.
::      If the folder containing your icon only has one icon, you can set it
::      to 0.
::  InfoTip: This entry adds an informational text string to the folder so
::      that when hovering your cursor over it, a text box will appear.
::
:: create the Desktop.ini file and write the data to it
echo ^[.ShellClassInfo^] > "%ini_file%"
echo ConfirmFileOp=0 >> "%ini_file%"
echo IconIndex=0 >> "%ini_file%"
echo IconResource=.\%icon_name%,0 >> "%ini_file%"
echo ^[ViewState^] >> "%ini_file%"
echo Mode= >> "%ini_file%"
echo Vid= >> "%ini_file%"
echo FolderType=Generic >> "%ini_file%"

:: If a folder has the Readonly or System flag set, then Explorer
:: will look for a desktop.ini file which describes the folder
:: customizations. For performance reasons, Explorer does this only
:: if the directory has the +R or +S flag (This is enormously
:: important on slow networks).
::
:: set read-only flag for the dir
attrib +r "%dir_path%"

:: set hidden and read-only flag for the ini file
attrib +r "%ini_file%"
attrib +h "%ini_file%"
