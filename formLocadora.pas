unit formLocadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, DB, ComCtrls;

type
  TfrmLocadora = class(TForm)
    Panel2: TPanel;
    dbtIDLocadora: TDBText;
    dbtInscricao: TDBText;
    dbeLocadora: TDBText;
    btnFechar: TButton;
    TabControl1: TTabControl;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    dbeRazao: TDBEdit;
    dbeCNPJ: TDBEdit;
    dbeFantasia: TDBEdit;
    dbeEmail: TDBEdit;
    dbcUF: TDBComboBox;
    dbcTipoEnd: TDBComboBox;
    dbeEndereco: TDBEdit;
    dbeComplemento: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCidade: TDBEdit;
    dbeCEP: TDBEdit;
    dbeTelefone: TDBEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocadora: TfrmLocadora;

implementation

uses formDados, formPrincipal;

{$R *.dfm}

procedure TfrmLocadora.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmLocadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qrylocadora.state = dsinsert) or (dtmdados.qrylocadora.state = dsedit) then
 begin
   application.messagebox('Inclus?o ou edi??o em andamento.', 'Aten??o', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);

 action      := cafree;
 frmlocadora := nil;
end;

procedure TfrmLocadora.FormShow(Sender: TObject);
begin
 top  := 0;
 left := 0;

 with frmprincipal do
 begin
   dsform    := frmlocadora;
   dstable   := dtmdados.qrylocadora;
   Campo1    := 'idlocadora';
   Campo2    := 'razao';
   Tabela    := 'Locadora';
   instrucao := 'select * from locadora';
 end;

 panel1.enabled := false;
end;

procedure TfrmLocadora.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and (dtmdados.qryLocadora.State = dsbrowse) then frmprincipal.toolbtnlocalizar.click;
end;

end.
