object frmGenero: TfrmGenero
  Left = 224
  Top = 113
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio de G'#234'nero'
  ClientHeight = 126
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 24
    Align = alTop
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object dbtIDGenero: TDBText
      Left = 8
      Top = 4
      Width = 89
      Height = 16
      AutoSize = True
      DataField = 'IdGenero'
      DataSource = dtmDados.dsGenero
    end
    object dbtInscricao: TDBText
      Left = 208
      Top = 4
      Width = 86
      Height = 16
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'DataCadastro'
      DataSource = dtmDados.dsGenero
    end
    object dbtGenero: TDBText
      Left = 40
      Top = 4
      Width = 169
      Height = 16
      DataField = 'Genero'
      DataSource = dtmDados.dsGenero
    end
  end
  object btnFechar: TButton
    Left = 221
    Top = 96
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
  object TabControl1: TTabControl
    Left = 0
    Top = 24
    Width = 302
    Height = 66
    Align = alTop
    TabOrder = 2
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 294
      Height = 56
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 42
        Height = 13
        Caption = 'G'#234'nero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeGenero: TDBEdit
        Tag = 1
        Left = 8
        Top = 22
        Width = 273
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        DataField = 'Genero'
        DataSource = dtmDados.dsGenero
        TabOrder = 0
      end
    end
  end
end
