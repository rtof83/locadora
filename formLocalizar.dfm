object frmLocalizar: TfrmLocalizar
  Left = 218
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar...'
  ClientHeight = 327
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 503
    Height = 327
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 495
      Height = 317
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object lblCount: TLabel
        Left = 428
        Top = 291
        Width = 53
        Height = 16
        Alignment = taRightJustify
        Caption = 'lblCount'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gridLocalizar: TDBGrid
        Left = 8
        Top = 77
        Width = 473
        Height = 213
        DataSource = dsLocalizar
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = gridLocalizarDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end>
      end
      object edtLocalizar: TEdit
        Left = 8
        Top = 45
        Width = 473
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtLocalizarChange
        OnKeyPress = edtLocalizarKeyPress
      end
      object rgLocalizar: TRadioGroup
        Left = 8
        Top = 8
        Width = 473
        Height = 33
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'C'#243'digo'
          'Descri'#231#227'o')
        ParentFont = False
        TabOrder = 2
        OnClick = rgLocalizarClick
      end
    end
  end
  object dsLocalizar: TDataSource
    DataSet = qryLocalizar
    OnDataChange = dsLocalizarDataChange
    Left = 288
    Top = 40
  end
  object qryLocalizar: TADOQuery
    Connection = dtmDados.dbLocadora
    Parameters = <>
    Left = 288
    Top = 8
  end
end
