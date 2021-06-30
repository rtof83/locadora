object frmBackup: TfrmBackup
  Left = 224
  Top = 113
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Backup'
  ClientHeight = 350
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 215
    Height = 320
    Align = alTop
    TabOrder = 0
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 207
      Height = 310
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object lblBackup: TLabel
        Left = 8
        Top = 8
        Width = 53
        Height = 16
        Caption = 'Backup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnDblClick = lblBackupDblClick
      end
      object lstBackup: TListBox
        Left = 8
        Top = 25
        Width = 185
        Height = 272
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object btnFechar: TButton
    Left = 137
    Top = 322
    Width = 75
    Height = 25
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnFecharClick
  end
end
