; Arnium Modern Dark Installer Script
; Inno Setup 7.x

#define MyAppName "Arnium"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Arnium Project"
#define MyAppURL "https://github.com/your-username/arnium"
#define MyAppExeName "chrome.exe"
#define SourceDir "D:\chromium\installer_dist"

[Setup]
AppId={{D8C934E2-5F2A-4B6A-8A91-49F1D6A7E823}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={localappdata}\Arnium\Application
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=D:\chromium\out_installer
OutputBaseFilename=ArniumSetup
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
WizardSizePercent=110
DisableWelcomePage=no
DisableReadyPage=yes
DisableFinishedPage=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Parameters: "--user-data-dir=""{localappdata}\Arnium\User Data"" --no-first-run --disable-features=AccountConsistency,BoundSessionCredentials --allow-browser-signin=false"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Parameters: "--user-data-dir=""{localappdata}\Arnium\User Data"" --no-first-run --disable-features=AccountConsistency,BoundSessionCredentials --allow-browser-signin=false"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters: "--user-data-dir=""{localappdata}\Arnium\User Data"" --no-first-run --disable-features=AccountConsistency,BoundSessionCredentials --allow-browser-signin=false"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
const
  COLOR_BG = $0026201B;
  COLOR_TEXT = $00FFFFFF;
  COLOR_SUBTEXT = $00C0B8B0;

procedure ApplyDarkTheme;
begin
  WizardForm.Color := COLOR_BG;
  WizardForm.Font.Name := 'Segoe UI';
  WizardForm.InnerPage.Color := COLOR_BG;
  WizardForm.MainPanel.Color := COLOR_BG;
  WizardForm.Bevel.Visible := False;
  WizardForm.Bevel1.Visible := False;

  WizardForm.PageNameLabel.Font.Color := COLOR_TEXT;
  WizardForm.PageNameLabel.Font.Style := [fsBold];
  WizardForm.PageNameLabel.Font.Size := 11;
  
  WizardForm.PageDescriptionLabel.Font.Color := COLOR_SUBTEXT;
  WizardForm.WelcomeLabel1.Font.Color := COLOR_TEXT;
  WizardForm.WelcomeLabel1.Font.Size := 14;
  WizardForm.WelcomeLabel1.Font.Style := [fsBold];
  WizardForm.WelcomeLabel2.Font.Color := COLOR_SUBTEXT;
  
  WizardForm.StatusLabel.Font.Color := COLOR_SUBTEXT;
  WizardForm.FilenameLabel.Font.Color := COLOR_SUBTEXT;
  
  WizardForm.BackButton.Cursor := crHand;
  WizardForm.NextButton.Cursor := crHand;
  WizardForm.CancelButton.Cursor := crHand;
end;

procedure InitializeWizard();
begin
  ApplyDarkTheme();
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  ApplyDarkTheme();
  if CurPageID = wpInstalling then
  begin
    WizardForm.StatusLabel.Caption := 'Installing Arnium browser files...';
  end;
end;