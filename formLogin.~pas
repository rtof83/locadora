unit formLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, jpeg;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    btnOk: TSpeedButton;
    btnFechar: TSpeedButton;
    Image2: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick1(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses formPrincipal, formDados;

{$R *.dfm}

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
 application.Terminate;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
 if frmprincipal <> nil then
  btnfechar.visible := false;

 edtusuario.setfocus;
end;

procedure TfrmLogin.btnOkClick1(Sender: TObject);
begin
 if dtmdados.qryconfig.locate('usuario', edtusuario.text, []) then
 begin
   if edtusuario.Focused then
   begin
     edtsenha.setfocus;
     exit;
   end;

   if dtmdados.qryconfigSenha.asstring = edtsenha.text then
    close
   else
   begin
     application.messagebox('Senha inválida!', 'Atenção', mb_ok + mb_iconerror);
     edtsenha.setfocus;
   end;
 end
 else
 begin
   application.messagebox('Usuário não cadastrado!', 'Atenção', mb_ok + mb_iconerror);
   edtusuario.setfocus;
 end;
end;

procedure TfrmLogin.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then btnok.click;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
 if dtmdados.qryconfig.locate('usuario', edtusuario.text, []) then
 begin
   if edtusuario.Focused then
   begin
     edtsenha.setfocus;
     exit;
   end;

   if dtmdados.qryconfigSenha.asstring = edtsenha.text then
    close
   else
   begin
     application.messagebox('Senha inválida!', 'Atenção', mb_ok + mb_iconerror);
     edtsenha.setfocus;
   end;
 end
 else
 begin
   application.messagebox('Usuário não cadastrado!', 'Atenção', mb_ok + mb_iconerror);
   edtusuario.setfocus;
 end;
end;

end.
