unit formConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, DB, ComCtrls;

type
  TfrmConfig = class(TForm)
    btnFechar: TButton;
    TabControl1: TTabControl;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbeUsuario: TDBEdit;
    dbeSenha: TDBEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses formDados, formPrincipal;

{$R *.dfm}

procedure TfrmConfig.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qryconfig.state = dsinsert) or (dtmdados.qryconfig.state = dsedit) then
 begin
   application.messagebox('Inclusão ou edição em andamento.', 'Atenção', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 frmprincipal.toolbtnImprimir.Visible := true;

 action    := cafree;
 frmconfig := nil;

 dtmdados.qryconfig.close;
end;

procedure TfrmConfig.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and ((dtmdados.qryConfig.State = dsbrowse) or (dtmdados.qryConfig.State = dsinactive)) then frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
 top  := 0;
 left := 0;

 with frmprincipal do
 begin
   dsform    := frmconfig;
   dstable   := dtmdados.qryconfig;
   Campo1    := 'usuario';
   Campo2    := '';
   Tabela    := 'Config';
   instrucao := 'select * from config';
 end;

 frmprincipal.toolbtnImprimir.Visible := false;
 panel1.enabled := false;
end;

end.
