object frmProduto: TfrmProduto
  Left = 223
  Top = 112
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio de Produtos'
  ClientHeight = 271
  ClientWidth = 423
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
  object btnFechar: TButton
    Left = 340
    Top = 238
    Width = 75
    Height = 25
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 24
    Width = 423
    Height = 207
    Align = alTop
    TabOrder = 1
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 415
      Height = 197
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 6
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 328
        Top = 6
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
      object Label9: TLabel
        Left = 8
        Top = 44
        Width = 98
        Height = 13
        Caption = 'C'#243'digo de Barras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 272
        Top = 6
        Width = 32
        Height = 13
        Caption = 'Qtde.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeProduto: TDBEdit
        Tag = 1
        Left = 8
        Top = 20
        Width = 257
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        DataField = 'Produto'
        DataSource = dtmDados.dsProduto
        TabOrder = 0
      end
      object dbeValor: TDBEdit
        Tag = 1
        Left = 328
        Top = 20
        Width = 73
        Height = 21
        Color = clCream
        DataField = 'Preco'
        DataSource = dtmDados.dsProduto
        TabOrder = 2
        OnExit = dbeValorExit
      end
      object Panel3: TPanel
        Left = 248
        Top = 51
        Width = 153
        Height = 132
        BorderStyle = bsSingle
        Color = clWindow
        TabOrder = 3
        object imgProduto: TImage
          Left = 1
          Top = 1
          Width = 147
          Height = 126
          Align = alClient
          Center = True
          ParentShowHint = False
          ShowHint = True
          Stretch = True
          OnClick = imgProdutoClick
        end
      end
      object dbeQuantidade: TDBEdit
        Tag = 1
        Left = 272
        Top = 20
        Width = 49
        Height = 21
        Color = clCream
        DataField = 'Quantidade'
        DataSource = dtmDados.dsProduto
        TabOrder = 1
        OnExit = dbeQuantidadeExit
      end
      object dbeBarCode: TDBEdit
        Left = 8
        Top = 58
        Width = 217
        Height = 21
        DataField = 'BarCode'
        DataSource = dtmDados.dsProduto
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 24
    Align = alTop
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object dbtIDLocadora: TDBText
      Left = 8
      Top = 4
      Width = 104
      Height = 16
      AutoSize = True
      DataField = 'IdProduto'
      DataSource = dtmDados.dsProduto
    end
    object dbtInscricao: TDBText
      Left = 328
      Top = 4
      Width = 86
      Height = 16
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'DataCadastro'
      DataSource = dtmDados.dsProduto
    end
    object dbeLocadora: TDBText
      Left = 64
      Top = 4
      Width = 260
      Height = 16
      DataField = 'Produto'
      DataSource = dtmDados.dsProduto
    end
  end
  object opcProduto: TOpenPictureDialog
    Left = 188
    Top = 150
  end
  object popProduto: TPopupMenu
    Left = 156
    Top = 150
    object mnuInserir: TMenuItem
      Caption = '&Inserir'
      OnClick = mnuInserirClick
    end
    object mnuExcluir: TMenuItem
      Caption = '&Excluir'
      OnClick = mnuExcluirClick
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnHint = ApplicationEvents1Hint
    Left = 124
    Top = 150
  end
end
