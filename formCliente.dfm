object frmCliente: TfrmCliente
  Left = 216
  Top = 113
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio de Clientes'
  ClientHeight = 334
  ClientWidth = 509
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
    Width = 509
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
    object dbtIDCliente: TDBText
      Left = 8
      Top = 4
      Width = 86
      Height = 16
      AutoSize = True
      DataField = 'IdCliente'
      DataSource = dtmDados.dsCliente
    end
    object dbtCliente: TDBText
      Left = 56
      Top = 4
      Width = 357
      Height = 17
      DataField = 'Nome'
      DataSource = dtmDados.dsCliente
    end
    object dbtInscricao: TDBText
      Left = 410
      Top = 4
      Width = 86
      Height = 16
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'Inscricao'
      DataSource = dtmDados.dsCliente
    end
  end
  object pcCliente: TPageControl
    Left = 0
    Top = 24
    Width = 509
    Height = 276
    ActivePage = tbsDados
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object tbsDados: TTabSheet
      Caption = 'Dados Pessoais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 501
        Height = 248
        Align = alClient
        BorderStyle = bsSingle
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 7
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 320
          Top = 7
          Width = 67
          Height = 13
          Caption = 'Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 408
          Top = 7
          Width = 51
          Height = 13
          Caption = 'Situa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 47
          Width = 49
          Height = 13
          Caption = 'Fantasia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 256
          Top = 47
          Width = 24
          Height = 13
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 376
          Top = 47
          Width = 19
          Height = 13
          Caption = 'RG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 0
          Top = 94
          Width = 497
          Height = 2
          Shape = bsBottomLine
        end
        object Label7: TLabel
          Left = 8
          Top = 103
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 352
          Top = 103
          Width = 76
          Height = 13
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 143
          Width = 34
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 168
          Top = 143
          Width = 40
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 356
          Top = 143
          Width = 17
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 408
          Top = 143
          Width = 25
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 0
          Top = 189
          Width = 497
          Height = 2
          Shape = bsBottomLine
        end
        object Label13: TLabel
          Left = 133
          Top = 199
          Width = 40
          Height = 13
          Caption = 'Celular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 199
          Width = 51
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 256
          Top = 199
          Width = 36
          Height = 13
          Caption = 'E-Mail'
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
          Width = 305
          Height = 21
          CharCase = ecUpperCase
          Color = clCream
          DataField = 'Nome'
          DataSource = dtmDados.dsCliente
          TabOrder = 0
        end
        object dbeNascimento: TDBEdit
          Left = 320
          Top = 21
          Width = 81
          Height = 21
          DataField = 'Nascimento'
          DataSource = dtmDados.dsCliente
          MaxLength = 10
          TabOrder = 1
        end
        object dbeFantasia: TDBEdit
          Left = 8
          Top = 61
          Width = 241
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Fantasia'
          DataSource = dtmDados.dsCliente
          TabOrder = 3
        end
        object dbcStatus: TDBComboBox
          Left = 408
          Top = 21
          Width = 81
          Height = 21
          Style = csDropDownList
          DataField = 'Status'
          DataSource = dtmDados.dsCliente
          ItemHeight = 13
          Items.Strings = (
            'ATIVO'
            'INATIVO')
          TabOrder = 2
        end
        object dbeCPF: TDBEdit
          Left = 256
          Top = 61
          Width = 113
          Height = 21
          DataField = 'CPF'
          DataSource = dtmDados.dsCliente
          TabOrder = 4
        end
        object dbeRG: TDBEdit
          Left = 376
          Top = 61
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RG'
          DataSource = dtmDados.dsCliente
          TabOrder = 5
        end
        object dbeEndereco: TDBEdit
          Left = 108
          Top = 117
          Width = 237
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Endereco'
          DataSource = dtmDados.dsCliente
          TabOrder = 7
        end
        object dbcTipoEnd: TDBComboBox
          Left = 8
          Top = 117
          Width = 97
          Height = 21
          Style = csDropDownList
          DataField = 'TipoEnd'
          DataSource = dtmDados.dsCliente
          ItemHeight = 13
          Items.Strings = (
            'ALAMEDA'
            'AVENIDA'
            'CONDOMINIO'
            'CONJUNTO'
            'ESTRADA'
            'PRACA'
            'QUADRA'
            'RUA'
            'RESIDENCIAL'
            'RODOVIA'
            'VIA'
            'VILA')
          TabOrder = 6
        end
        object dbeComplemento: TDBEdit
          Left = 352
          Top = 117
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Complemento'
          DataSource = dtmDados.dsCliente
          TabOrder = 8
        end
        object dbeBairro: TDBEdit
          Left = 8
          Top = 157
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Bairro'
          DataSource = dtmDados.dsCliente
          TabOrder = 9
        end
        object DBEdit1: TDBEdit
          Left = 168
          Top = 157
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Cidade'
          DataSource = dtmDados.dsCliente
          TabOrder = 10
        end
        object dbeCEP: TDBEdit
          Left = 408
          Top = 157
          Width = 81
          Height = 21
          DataField = 'CEP'
          DataSource = dtmDados.dsCliente
          TabOrder = 12
        end
        object dbcUF: TDBComboBox
          Left = 356
          Top = 158
          Width = 45
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = dtmDados.dsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          ParentFont = False
          TabOrder = 11
        end
        object dbeTelefone: TDBEdit
          Left = 8
          Top = 213
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Telefone'
          DataSource = dtmDados.dsCliente
          TabOrder = 13
        end
        object dbeCelular: TDBEdit
          Left = 133
          Top = 213
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Celular'
          DataSource = dtmDados.dsCliente
          TabOrder = 14
        end
        object dbeEmail: TDBEdit
          Left = 256
          Top = 213
          Width = 233
          Height = 21
          CharCase = ecLowerCase
          DataField = 'Email'
          DataSource = dtmDados.dsCliente
          TabOrder = 15
        end
      end
    end
    object tbsOutrasInf: TTabSheet
      Caption = 'Outras Informa'#231#245'es'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 501
        Height = 248
        Align = alClient
        BorderStyle = bsSingle
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 8
          Top = 4
          Width = 481
          Height = 139
          TabOrder = 0
          object Label17: TLabel
            Left = 8
            Top = 10
            Width = 84
            Height = 13
            Caption = 'Dependente(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnCancela: TSpeedButton
            Left = 404
            Top = 108
            Width = 69
            Height = 21
            Hint = 'Cancela Opera'#231#227'o Atual'
            Caption = 'Cancelar'
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnCancelaClick
          end
          object btnDel: TSpeedButton
            Left = 335
            Top = 108
            Width = 69
            Height = 21
            Hint = 'Remover Item da lista'
            Caption = 'Remover'
            Enabled = False
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnDelClick
          end
          object btnAdd: TSpeedButton
            Left = 266
            Top = 108
            Width = 69
            Height = 21
            Hint = 'Adicionar Item'
            Caption = 'Inserir'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAddClick
          end
          object dbeDepend: TDBEdit
            Left = 8
            Top = 24
            Width = 464
            Height = 21
            CharCase = ecUpperCase
            DataField = 'Dependente'
            DataSource = dtmDados.dsDepend
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbgDepend: TDBGrid
            Left = 8
            Top = 51
            Width = 463
            Height = 57
            DataSource = dtmDados.dsDepend
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = dbgDependDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Dependente'
                Visible = True
              end>
          end
          object dbnItemLoc: TDBNavigator
            Left = 8
            Top = 108
            Width = 84
            Height = 21
            DataSource = dtmDados.dsDepend
            VisibleButtons = [nbPrior, nbNext]
            Flat = True
            Hints.Strings = (
              'First record'
              'Registro Anterior'
              'Pr'#243'ximo Registro'
              'Last record'
              'Insert record'
              'Delete record'
              'Edit record'
              'Post edit'
              'Cancel edit'
              'Refresh data')
            TabOrder = 2
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 145
          Width = 481
          Height = 92
          TabOrder = 1
          object Label16: TLabel
            Left = 8
            Top = 11
            Width = 69
            Height = 13
            Caption = 'Observa'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbmObservacao: TDBMemo
            Left = 8
            Top = 25
            Width = 465
            Height = 58
            DataField = 'Observacao'
            DataSource = dtmDados.dsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            OnKeyPress = dbmObservacaoKeyPress
          end
        end
      end
    end
  end
  object btnFechar: TButton
    Left = 429
    Top = 304
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
end
