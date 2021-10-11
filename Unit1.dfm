object Form1: TForm1
  Left = 226
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'DarkCrypt-GUI'
  ClientHeight = 286
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000870000000000000000000000000000087800000000000000
    0000000000000087800000000000000000000000000000880000000000000000
    07800000007700000000000000000000FF78000007007000000000000000000F
    F7F7800080000700000000000000000F7F7F7800800008070000000000000000
    F7F7F7800800800000000000000000000F7F7F78008800000000000000000000
    00F7F7F7800000000000000000000000000F7F7F780000000000000000000000
    0000F7F7F7800000000000000000000000000F7F7F7800000000000000000000
    000000F7F7F7800000000000000000000000000F7F7F78000000000000000000
    00000000F7F7FF000000000000000000000000000F7FF0000000000000000000
    0000000000FF0000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFEFFFFFFFC7FFFFFF83FFFFFF01FFFFFE00FFFFFC007FFFF8003FFFF00
    01FFFE0000FFFC00007FF800003FF000001FE000000FC0000007800300030007
    80010003000380000007C000000FE000001FF000003FF800007FFC0000FFFE00
    01FFFF000BFFFF8017FFFFC00FFFFFE01FFFFFF03FFFFFF87FFFFFFCFFFF}
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 10
    Top = 10
    Width = 434
    Height = 237
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 158
      Width = 395
      Height = 29
      Alignment = taCenter
      AutoSize = False
      Caption = 'waiting...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 30
      Top = 39
      Width = 349
      Height = 66
      Alignment = taCenter
      Caption = 'Drop files here to encrypt or decrypt'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      OnMouseEnter = Label2MouseEnter
      OnMouseLeave = Label2MouseLeave
    end
    object Label3: TLabel
      Left = 0
      Top = 207
      Width = 425
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 
        'DarkCryptTC - freeware Total Commander plugin for data encryptio' +
        'n'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object pb: TProgressBar
    Left = 10
    Top = 256
    Width = 434
    Height = 21
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 336
    Top = 8
    object Menu1: TMenuItem
      Caption = 'Menu'
      object Openfile1: TMenuItem
        Caption = 'Open file...'
        OnClick = Openfile1Click
      end
      object Settings1: TMenuItem
        Caption = 'Settings'
        OnClick = Settings1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object Seeinfo1: TMenuItem
        Caption = 'See info'
        OnClick = Seeinfo1Click
      end
    end
  end
end
