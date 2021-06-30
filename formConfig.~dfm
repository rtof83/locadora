object frmConfig: TfrmConfig
  Left = 223
  Top = 112
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio de Usu'#225'rios'
  ClientHeight = 101
  ClientWidth = 277
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
    Left = 198
    Top = 71
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
    Top = 0
    Width = 277
    Height = 65
    Align = alTop
    TabOrder = 1
    object Panel1: TPanel
      Left = 4
      Top = 6
      Width = 269
      Height = 55
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 168
        Top = 8
        Width = 37
        Height = 13
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeUsuario: TDBEdit
        Tag = 1
        Left = 8
        Top = 22
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        DataField = 'Usuario'
        DataSource = dtmDados.dsConfig
        TabOrder = 0
      end
      object dbeSenha: TDBEdit
        Tag = 1
        Left = 168
        Top = 22
        Width = 89
        Height = 21
        Color = clCream
        DataField = 'Senha'
        DataSource = dtmDados.dsConfig
        PasswordChar = '#'
        TabOrder = 1
      end
    end
  end
end
