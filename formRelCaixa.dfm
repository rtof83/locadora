object frmRelCaixa: TfrmRelCaixa
  Left = 229
  Top = 113
  Width = 354
  Height = 181
  Caption = 'Relat'#243'rio de Caixa'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 147
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 194
      Top = 32
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 43
      Top = 32
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MskDataIni: TMaskEdit
      Left = 98
      Top = 24
      Width = 89
      Height = 21
      EditMask = '99/99/9999'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = MskDataIniExit
    end
    object MskDataFin: TMaskEdit
      Left = 210
      Top = 24
      Width = 89
      Height = 21
      EditMask = '99/99/9999'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = MskDataFinExit
    end
    object btnImprimir: TButton
      Left = 72
      Top = 107
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
    object btnFechar: TButton
      Left = 208
      Top = 107
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnFecharClick
    end
    object rgpCaixa: TRadioGroup
      Left = 23
      Top = 56
      Width = 297
      Height = 41
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Geral'
        'Acervo'
        'Produto')
      ParentFont = False
      TabOrder = 4
    end
  end
end
