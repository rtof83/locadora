object frmCategoria: TfrmCategoria
  Left = 216
  Top = 113
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de Categorias'
  ClientHeight = 126
  ClientWidth = 413
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
    Width = 413
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
    object dbtIDCategoria: TDBText
      Left = 8
      Top = 4
      Width = 106
      Height = 16
      AutoSize = True
      DataField = 'IdCategoria'
      DataSource = dtmDados.dsCategoria
    end
    object dbtInscricao: TDBText
      Left = 320
      Top = 4
      Width = 86
      Height = 16
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'DataCadastro'
      DataSource = dtmDados.dsCategoria
    end
    object dbtCategoria: TDBText
      Left = 56
      Top = 4
      Width = 249
      Height = 16
      DataField = 'Categoria'
      DataSource = dtmDados.dsCategoria
    end
  end
  object btnFechar: TButton
    Left = 333
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
    Width = 413
    Height = 66
    Align = alTop
    TabOrder = 2
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 405
      Height = 56
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 55
        Height = 13
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 256
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 328
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeCategoria: TDBEdit
        Tag = 1
        Left = 8
        Top = 22
        Width = 241
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        DataField = 'Categoria'
        DataSource = dtmDados.dsCategoria
        TabOrder = 0
      end
      object dbeValor: TDBEdit
        Tag = 1
        Left = 256
        Top = 22
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        DataField = 'Preco'
        DataSource = dtmDados.dsCategoria
        TabOrder = 1
        OnExit = dbeValorExit
      end
      object dbeEntrega: TDBEdit
        Left = 328
        Top = 22
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Entrega'
        DataSource = dtmDados.dsCategoria
        TabOrder = 2
      end
    end
  end
end
