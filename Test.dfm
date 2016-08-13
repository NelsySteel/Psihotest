object FormTest: TFormTest
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Bottom = 10
  ActiveControl = CheckListBox
  Anchors = [akLeft, akTop, akRight, akBottom]
  ClientHeight = 420
  ClientWidth = 906
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 820
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clNavy
  Font.Height = -16
  Font.Name = 'Century Gothic'
  Font.Style = []
  GlassFrame.Enabled = True
  Padding.Bottom = 10
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    906
    420)
  PixelsPerInch = 96
  TextHeight = 21
  object CheckListBox: TCheckListBox
    AlignWithMargins = True
    Left = 3
    Top = 11
    Width = 900
    Height = 298
    TabStop = False
    OnClickCheck = CheckListBoxClickCheck
    Anchors = [akLeft, akTop, akRight, akBottom]
    Constraints.MinWidth = 800
    DoubleBuffered = False
    IntegralHeight = True
    ItemHeight = 21
    ParentColor = True
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object ButtonNext: TBitBtn
    Left = 272
    Top = 375
    Width = 249
    Height = 25
    Margins.Bottom = 10
    Anchors = [akLeft, akBottom]
    Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1074#1086#1087#1088#1086#1089
    Default = True
    DoubleBuffered = False
    Layout = blGlyphBottom
    Margin = 1
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = ButtonNextClick
  end
  object ProgressBar1: TProgressBar
    Left = 256
    Top = 336
    Width = 281
    Height = 17
    Max = 250
    BarColor = clHotLight
    TabOrder = 2
  end
  object TempQ: TADOQuery
    Connection = FormDBUtils.ADOConnection
    Parameters = <>
    Left = 88
    Top = 328
  end
end
