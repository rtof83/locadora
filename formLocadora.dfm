object frmLocadora: TfrmLocadora
  Left = 222
  Top = 113
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Locadora'
  ClientHeight = 314
  ClientWidth = 501
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
    Width = 501
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
    object dbtIDLocadora: TDBText
      Left = 12
      Top = 4
      Width = 104
      Height = 16
      AutoSize = True
      DataField = 'IdLocadora'
      DataSource = dtmDados.dsLocadora
    end
    object dbtInscricao: TDBText
      Left = 403
      Top = 4
      Width = 86
      Height = 16
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'DataCadastro'
      DataSource = dtmDados.dsLocadora
    end
    object dbeLocadora: TDBText
      Left = 40
      Top = 4
      Width = 345
      Height = 16
      DataField = 'Razao'
      DataSource = dtmDados.dsLocadora
    end
  end
  object btnFechar: TButton
    Left = 422
    Top = 285
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
    Width = 501
    Height = 257
    Align = alTop
    TabOrder = 2
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 493
      Height = 247
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 336
        Top = 8
        Width = 32
        Height = 13
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 48
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
      object Label4: TLabel
        Left = 272
        Top = 48
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
      object Bevel1: TBevel
        Left = 0
        Top = 94
        Width = 490
        Height = 2
        Shape = bsBottomLine
      end
      object Label5: TLabel
        Left = 8
        Top = 104
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
        Left = 344
        Top = 104
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
      object Label12: TLabel
        Left = 400
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
      object Label11: TLabel
        Left = 348
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
      object Bevel2: TBevel
        Left = 0
        Top = 190
        Width = 490
        Height = 2
        Shape = bsBottomLine
      end
      object Label6: TLabel
        Left = 8
        Top = 200
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
      object dbeRazao: TDBEdit
        Tag = 1
        Left = 8
        Top = 22
        Width = 321
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        DataField = 'Razao'
        DataSource = dtmDados.dsLocadora
        TabOrder = 0
      end
      object dbeCNPJ: TDBEdit
        Left = 336
        Top = 22
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CNPJ'
        DataSource = dtmDados.dsLocadora
        TabOrder = 1
      end
      object dbeFantasia: TDBEdit
        Left = 8
        Top = 62
        Width = 257
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Fantasia'
        DataSource = dtmDados.dsLocadora
        TabOrder = 2
      end
      object dbeEmail: TDBEdit
        Left = 272
        Top = 62
        Width = 209
        Height = 21
        CharCase = ecLowerCase
        DataField = 'Email'
        DataSource = dtmDados.dsLocadora
        TabOrder = 3
      end
      object dbcUF: TDBComboBox
        Left = 348
        Top = 157
        Width = 45
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UF'
        DataSource = dtmDados.dsLocadora
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
        TabOrder = 9
      end
      object dbcTipoEnd: TDBComboBox
        Left = 8
        Top = 118
        Width = 97
        Height = 21
        Style = csDropDownList
        DataField = 'TipoEnd'
        DataSource = dtmDados.dsLocadora
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
        TabOrder = 4
      end
      object dbeEndereco: TDBEdit
        Left = 112
        Top = 118
        Width = 225
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Endereco'
        DataSource = dtmDados.dsLocadora
        TabOrder = 5
      end
      object dbeComplemento: TDBEdit
        Left = 344
        Top = 118
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Complemento'
        DataSource = dtmDados.dsLocadora
        TabOrder = 6
      end
      object dbeBairro: TDBEdit
        Left = 8
        Top = 157
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Bairro'
        DataSource = dtmDados.dsLocadora
        TabOrder = 7
      end
      object dbeCidade: TDBEdit
        Left = 168
        Top = 157
        Width = 177
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Cidade'
        DataSource = dtmDados.dsLocadora
        TabOrder = 8
      end
      object dbeCEP: TDBEdit
        Left = 400
        Top = 157
        Width = 81
        Height = 21
        DataField = 'CEP'
        DataSource = dtmDados.dsLocadora
        TabOrder = 10
      end
      object dbeTelefone: TDBEdit
        Left = 8
        Top = 214
        Width = 113
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Telefone'
        DataSource = dtmDados.dsLocadora
        TabOrder = 11
      end
    end
  end
end
