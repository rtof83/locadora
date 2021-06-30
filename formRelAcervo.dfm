object frmRelAcervo: TfrmRelAcervo
  Left = 227
  Top = 112
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Acervos'
  ClientHeight = 148
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 253
    Height = 148
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 245
      Height = 138
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 8
        Top = 4
        Width = 225
        Height = 89
        TabOrder = 0
        object rdbGeral: TRadioButton
          Left = 8
          Top = 16
          Width = 113
          Height = 17
          Caption = 'Geral'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rdbGeralClick
        end
        object rdbEstoque: TRadioButton
          Left = 122
          Top = 16
          Width = 95
          Height = 17
          Caption = 'em Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rdbEstoqueClick
        end
        object rdbGenero: TRadioButton
          Left = 8
          Top = 40
          Width = 113
          Height = 17
          Caption = 'G'#234'nero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = rdbGeneroClick
        end
        object dbcGenero: TComboBox
          Left = 8
          Top = 59
          Width = 145
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          Enabled = False
          ItemHeight = 13
          TabOrder = 3
        end
      end
      object btnFechar: TButton
        Left = 143
        Top = 100
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
      object btnImprimir: TButton
        Left = 23
        Top = 100
        Width = 75
        Height = 25
        Caption = 'Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnImprimirClick
      end
    end
  end
end
