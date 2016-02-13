object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 356
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBCheckBox1: TDBCheckBox
    Left = 24
    Top = 32
    Width = 425
    Height = 273
    Caption = 'DBCheckBox1'
    DataSource = FormDBUtils.DataSource1
    TabOrder = 0
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
end
