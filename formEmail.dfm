object frmEmail: TfrmEmail
  Left = 222
  Top = 113
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Enviar E-Mail'
  ClientHeight = 332
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 298
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Para'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Assunto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 133
      Width = 61
      Height = 13
      Caption = 'Mensagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPara: TEdit
      Left = 8
      Top = 22
      Width = 369
      Height = 21
      TabOrder = 0
    end
    object edtAssunto: TEdit
      Left = 8
      Top = 62
      Width = 369
      Height = 21
      TabOrder = 1
    end
    object lbxAnexos: TListBox
      Left = 8
      Top = 104
      Width = 294
      Height = 21
      Style = lbOwnerDrawFixed
      Color = clBtnFace
      ExtendedSelect = False
      ItemHeight = 13
      TabOrder = 2
    end
    object mmMensagem: TMemo
      Left = 8
      Top = 147
      Width = 369
      Height = 110
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object btAnexar: TBitBtn
      Left = 302
      Top = 104
      Width = 75
      Height = 21
      Caption = 'Anexar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btAnexarClick
    end
    object btEnviar: TBitBtn
      Left = 302
      Top = 260
      Width = 75
      Height = 25
      Caption = 'Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btEnviarClick
    end
  end
  object btFechar: TBitBtn
    Left = 311
    Top = 302
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
    OnClick = btFecharClick
  end
  object odAnexos: TOpenDialog
    Left = 248
    Top = 168
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    From.Address = 'br.rep@terra.com.br'
    From.Name = 'Alex'
    From.Text = 'Alex <br.rep@terra.com.br>'
    Recipients = <>
    ReplyTo = <>
    Left = 280
    Top = 168
  end
  object IdSMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 15000
    Port = 25
    AuthenticationType = atLogin
    Left = 312
    Top = 168
  end
end
