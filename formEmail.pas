unit formEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdBaseComponent, IdMessage, ExtCtrls;

type
  TfrmEmail = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPara: TEdit;
    edtAssunto: TEdit;
    lbxAnexos: TListBox;
    mmMensagem: TMemo;
    btAnexar: TBitBtn;
    btEnviar: TBitBtn;
    odAnexos: TOpenDialog;
    IdMessage: TIdMessage;
    IdSMTP: TIdSMTP;
    btFechar: TBitBtn;
    procedure btAnexarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmail: TfrmEmail;

implementation

uses formdados, formPrincipal;

{$R *.dfm}

procedure TfrmEmail.btAnexarClick(Sender: TObject);
begin
  if odAnexos.Execute then
   lbxAnexos.Items.Add(odAnexos.FileName);
end;

procedure TfrmEmail.btFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmEmail.btEnviarClick(Sender: TObject);
var Anexo : Integer;
begin
  if edtpara.text = '' then
  begin
    application.messagebox('Indique o Destinatário.', 'Atenção', mb_ok + mb_iconwarning);
    edtpara.setfocus;
    exit;
  end;

  btenviar.caption  := 'Enviando...';
  btenviar.enabled  := false;
  btfechar.enabled  := false;
  IdMessage.Recipients.EMailAddresses := edtPara.Text;
  IdMessage.Subject := edtAssunto.Text;
  IdMessage.Body    := mmMensagem.Lines;
  //Manipulando os Anexos
  for Anexo := 0 to lbxAnexos.Items.Count - 1 do
    TIdAttachment.Create(idmessage.MessageParts, TFileName(lbxAnexos.Items.Strings[Anexo]));

  IdSMTP.Connect;
  try
   IdSMTP.Send(IdMessage);
  finally
   //Application.MessageBox('Erro ao enviar o E-Mail!', 'Atenção', MB_ICONERROR + MB_OK);
   IdSMTP.Disconnect;
   btenviar.enabled := true;
   btenviar.caption := 'Enviar';
   btfechar.enabled := true;
  end;

  Application.MessageBox('E-Mail enviado com Sucesso!', 'Confirmação', MB_ICONINFORMATION + MB_OK);
  btenviar.enabled := true;
  btenviar.caption := 'Enviar';
  btfechar.enabled := true;
end;

procedure TfrmEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmprincipal.mnuemail.enabled := true;
 frmemail := nil;
 action   := cafree;
end;

procedure TfrmEmail.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  27: close;
 end;
 if (key = 13) and (mmMensagem.Focused = false) then SelectNext(ActiveControl,True,True);
end;

procedure TfrmEmail.FormShow(Sender: TObject);
begin
 left := 0;
 top  := 0;

 idsmtp.Host     := dtmdados.qryConfigSysHost.AsString;
 idsmtp.Password := dtmdados.qryConfigSysSenha.AsString;
 idsmtp.Username := dtmdados.qryConfigSysUsuario.AsString;
end;

end.
