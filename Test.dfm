object FormTest: TFormTest
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Bottom = 10
  ActiveControl = CheckListBox
  Anchors = [akLeft, akTop, akRight, akBottom]
  AutoSize = True
  ClientHeight = 384
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clNavy
  Font.Height = -16
  Font.Name = 'Century Gothic'
  Font.Style = []
  FormStyle = fsStayOnTop
  GlassFrame.Enabled = True
  Padding.Bottom = 10
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 21
  object CheckListBox: TCheckListBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 900
    Height = 340
    OnClickCheck = CheckListBoxClickCheck
    IntegralHeight = True
    ItemHeight = 20
    ParentColor = True
    Style = lbOwnerDrawVariable
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 384
    Top = 349
    Width = 75
    Height = 25
    Margins.Bottom = 10
    Caption = 'BitBtn1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    Style = bsNew
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
