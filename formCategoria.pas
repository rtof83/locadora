unit formCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, DB, ComCtrls;

type
  TfrmCategoria = class(TForm)
    Panel2: TPanel;
    dbtIDCategoria: TDBText;
    dbtInscricao: TDBText;
    dbtCategoria: TDBText;
    btnFechar: TButton;
    TabControl1: TTabControl;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeCategoria: TDBEdit;
    dbeValor: TDBEdit;
    dbeEntrega: TDBEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoria: TfrmCategoria;

implementation

uses formDados, formPrincipal;

{$R *.dfm}

procedure TfrmCategoria.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qrycategoria.state = dsinsert) or (dtmdados.qrycategoria.state = dsedit) then
 begin
   application.messagebox('Inclus?o ou edi??o em andamento.', 'Aten??o', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 action       := cafree;
 frmcategoria := nil;

 dtmdados.qrycategoria.close;
end;

procedure TfrmCategoria.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and ((dtmdados.qryCategoria.State = dsbrowse) or (dtmdados.qryCategoria.State = dsinactive)) then frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmCategoria.FormShow(Sender: TObject);
begin
 left := 0;
 top  := 0;

 with frmprincipal do
 begin
   dsform    := frmcategoria;
   dstable   := dtmdados.qrycategoria;
   Campo1    := 'Idcategoria';
   Campo2    := 'categoria';
   Tabela    := 'Categoria';
   instrucao := 'select * from categoria';
 end;

 panel1.enabled := false;
end;

procedure TfrmCategoria.dbeValorExit(Sender: TObject);
begin
 if dtmdados.qryCategoriaPreco.asinteger = 0 then
  application.MessageBox('Informe um Valor maior que zero!', 'Aten??o', mb_ok + mb_iconwarning);
end;

end.
 