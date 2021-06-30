object frmAcervo: TfrmAcervo
  Left = 220
  Top = 114
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio de Acervos'
  ClientHeight = 309
  ClientWidth = 500
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
    Width = 500
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
    object dbtIDAcervo: TDBText
      Left = 8
      Top = 4
      Width = 87
      Height = 16
      AutoSize = True
      DataField = 'IdAcervo'
      DataSource = dtmDados.dsAcervo
    end
    object dbtAcervo: TDBText
      Left = 64
      Top = 4
      Width = 345
      Height = 17
      DataField = 'Nome'
      DataSource = dtmDados.dsAcervo
    end
    object dbtInscricao: TDBText
      Left = 410
      Top = 4
      Width = 86
      Height = 16
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'DataCadastro'
      DataSource = dtmDados.dsAcervo
    end
  end
  object pcAcervo: TPageControl
    Left = 0
    Top = 24
    Width = 500
    Height = 250
    ActivePage = tbsFilme
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object tbsFilme: TTabSheet
      Caption = 'Dados do Filme'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 222
        Align = alClient
        BorderStyle = bsSingle
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 7
          Width = 35
          Height = 13
          Caption = 'T'#237'tulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 168
          Top = 67
          Width = 76
          Height = 13
          Caption = 'Classifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 288
          Top = 7
          Width = 70
          Height = 13
          Caption = 'Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 368
          Top = 7
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
        object Label5: TLabel
          Left = 367
          Top = 109
          Width = 49
          Height = 13
          Caption = 'Dura'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 367
          Top = 67
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
        object Label8: TLabel
          Left = 8
          Top = 175
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
        object Label6: TLabel
          Left = 168
          Top = 110
          Width = 56
          Height = 13
          Caption = 'Produtora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 159
          Top = 175
          Width = 84
          Height = 13
          Caption = 'C'#243'digo Interno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 0
          Top = 52
          Width = 487
          Height = 2
          Shape = bsBottomLine
        end
        object Bevel2: TBevel
          Left = 1
          Top = 164
          Width = 487
          Height = 2
          Shape = bsBottomLine
        end
        object Bevel3: TBevel
          Left = 155
          Top = 53
          Width = 2
          Height = 111
          Shape = bsRightLine
        end
        object Label14: TLabel
          Left = 56
          Top = 175
          Width = 43
          Height = 13
          Caption = 'Locado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 264
          Top = 175
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
        object dbeNome: TDBEdit
          Tag = 1
          Left = 8
          Top = 21
          Width = 273
          Height = 21
          CharCase = ecUpperCase
          Color = clCream
          DataField = 'Nome'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbeClassificacao: TDBEdit
          Left = 168
          Top = 81
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Classificacao'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbeLancamento: TDBEdit
          Left = 288
          Top = 21
          Width = 75
          Height = 21
          CharCase = ecUpperCase
          DataField = 'AnoLanc'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object grbVideo: TGroupBox
          Left = 8
          Top = 64
          Width = 137
          Height = 43
          TabOrder = 3
          object dbcVideo: TDBComboBox
            Left = 7
            Top = 15
            Width = 122
            Height = 21
            Style = csDropDownList
            CharCase = ecUpperCase
            DataField = 'Tipo'
            DataSource = dtmDados.dsAcervo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              ''
              'DVD'
              'VHS')
            ParentFont = False
            TabOrder = 0
          end
        end
        object rdbVideo: TRadioButton
          Left = 16
          Top = 61
          Width = 53
          Height = 17
          Caption = 'Video'
          Checked = True
          TabOrder = 13
          TabStop = True
          OnClick = rdbVideoClick
        end
        object grbGame: TGroupBox
          Left = 8
          Top = 112
          Width = 137
          Height = 43
          TabOrder = 4
          object dbcGame: TDBComboBox
            Left = 7
            Top = 16
            Width = 122
            Height = 21
            Style = csDropDownList
            CharCase = ecUpperCase
            DataField = 'Tipo'
            DataSource = dtmDados.dsAcervo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              ''
              'PLAY STATION 2'
              'XBOX'
              'GAME CUBE'
              'NINTENDO 64'
              'DREAM CAST'
              'SUPER NINTENDO'
              'PLAY STATION')
            ParentFont = False
            TabOrder = 0
          end
        end
        object rdbGame: TRadioButton
          Left = 14
          Top = 109
          Width = 54
          Height = 17
          Caption = 'Game'
          TabOrder = 14
          OnClick = rdbGameClick
        end
        object dbeDuracao: TDBEdit
          Left = 367
          Top = 123
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Duracao'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 8
        end
        object dbeProdutora: TDBEdit
          Left = 168
          Top = 124
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Produtora'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object dbeQuantidade: TDBEdit
          Tag = 1
          Left = 8
          Top = 189
          Width = 41
          Height = 21
          CharCase = ecUpperCase
          Color = clCream
          DataField = 'Quantidade'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 9
          OnExit = dbeQuantidadeExit
        end
        object dbeBarCode: TDBEdit
          Left = 264
          Top = 189
          Width = 217
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BarCode'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object dbeLocado: TDBEdit
          Left = 56
          Top = 189
          Width = 49
          Height = 21
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'Locado'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbcCategoria: TDBLookupComboBox
          Tag = 1
          Left = 368
          Top = 81
          Width = 113
          Height = 21
          Color = clCream
          DataField = 'IdCategoria'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'IdCategoria'
          ListField = 'Categoria'
          ListSource = dtmDados.dsCategoria
          NullValueKey = 46
          ParentFont = False
          TabOrder = 6
        end
        object dbeCodInterno: TDBEdit
          Left = 159
          Top = 189
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Codigo'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object dbcGenero: TDBLookupComboBox
          Left = 367
          Top = 21
          Width = 113
          Height = 21
          DataField = 'IdGenero'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'IdGenero'
          ListField = 'Genero'
          ListSource = dtmDados.dsGenero
          NullValueKey = 46
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Outras Informa'#231#245'es'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 222
        Align = alClient
        BorderStyle = bsSingle
        TabOrder = 0
        object Label11: TLabel
          Left = 8
          Top = 7
          Width = 37
          Height = 13
          Caption = 'Atores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 8
          Top = 79
          Width = 39
          Height = 13
          Caption = 'Diretor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 119
          Width = 64
          Height = 13
          Caption = 'Coment'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbmAtores: TDBMemo
          Left = 8
          Top = 21
          Width = 273
          Height = 52
          DataField = 'Atores'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbeDiretor: TDBEdit
          Left = 8
          Top = 93
          Width = 273
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Diretor'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbmComentario: TDBMemo
          Left = 8
          Top = 133
          Width = 273
          Height = 76
          DataField = 'Comentario'
          DataSource = dtmDados.dsAcervo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object Panel4: TPanel
          Left = 288
          Top = 21
          Width = 191
          Height = 188
          BorderStyle = bsSingle
          Color = clWindow
          TabOrder = 3
          object imgAcervo: TImage
            Left = 1
            Top = 1
            Width = 185
            Height = 182
            Align = alClient
            Center = True
            ParentShowHint = False
            ShowHint = True
            Stretch = True
            OnClick = imgAcervoClick
            OnDblClick = imgAcervoDblClick
          end
        end
      end
    end
  end
  object btnFechar: TButton
    Left = 420
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnFecharClick
  end
  object opcAcervo: TOpenPictureDialog
    Left = 452
    Top = 32
  end
  object popAcervo: TPopupMenu
    Left = 420
    Top = 30
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
    Left = 388
    Top = 30
  end
end
