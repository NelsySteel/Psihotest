object FormMain: TFormMain
  Left = 0
  Top = 0
  ClientHeight = 171
  ClientWidth = 240
  Color = clBtnFace
  TransparentColor = True
  TransparentColorValue = clPurple
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TestBtn: TBitBtn
    Left = 40
    Top = 24
    Width = 161
    Height = 49
    Caption = #1055#1088#1086#1081#1090#1080' '#1090#1077#1089#1090
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = TestBtnClick
  end
  object Results: TBitBtn
    Left = 40
    Top = 79
    Width = 161
    Height = 49
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = ResultBtnClick
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 128
    object File1: TMenuItem
      Caption = 'File'
      object MenuTest: TMenuItem
        Caption = #1055#1088#1086#1081#1090#1080' '#1090#1077#1089#1090'...'
        OnClick = TestBtnClick
      end
      object MenuExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        GroupIndex = 1
        OnClick = MenuExitClick
      end
    end
    object Admin1: TMenuItem
      Caption = 'Admin'
      object N1: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
        object MenuResultsSimple: TMenuItem
          Caption = #1055#1088#1086#1089#1090#1086#1081'...'
        end
        object MenuResultsExt: TMenuItem
          Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081'...'
        end
      end
      object MenuEdit: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1094#1080#1103' '#1090#1077#1089#1090#1072'...'
      end
      object N2: TMenuItem
        Caption = #1056#1091#1095#1085#1086#1081' '#1074#1074#1086#1076'...'
      end
    end
    object N5: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object MenuTestHelp: TMenuItem
        Caption = #1054' '#1090#1077#1089#1090#1077'...'
      end
      object MenuProgHelp: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      end
    end
  end
end
