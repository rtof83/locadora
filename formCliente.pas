unit formCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, Grids, DBGrids, DB,
  Buttons;

type
  TfrmCliente = class(TForm)
    Panel2: TPanel;
    pcCliente: TPageControl;
    tbsDados: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeNome: TDBEdit;
    dbeNascimento: TDBEdit;
    dbeFantasia: TDBEdit;
    dbcStatus: TDBComboBox;
    dbeCPF: TDBEdit;
    Label6: TLabel;
    dbeRG: TDBEdit;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    dbeEndereco: TDBEdit;
    dbcTipoEnd: TDBComboBox;
    dbeComplemento: TDBEdit;
    Label9: TLabel;
    dbeBairro: TDBEdit;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    dbeCEP: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    dbcUF: TDBComboBox;
    Bevel2: TBevel;
    Label13: TLabel;
    dbeTelefone: TDBEdit;
    Label14: TLabel;
    dbeCelular: TDBEdit;
    Label15: TLabel;
    dbeEmail: TDBEdit;
    btnFechar: TButton;
    tbsOutrasInf: TTabSheet;
    Panel3: TPanel;
    dbtIDCliente: TDBText;
    dbtCliente: TDBText;
    dbtInscricao: TDBText;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    dbeDepend: TDBEdit;
    dbgDepend: TDBGrid;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    dbmObservacao: TDBMemo;
    btnCancela: TSpeedButton;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    dbnItemLoc: TDBNavigator;

    procedure Imprimir;

    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure dbgDependDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

uses formDados, formPrincipal;

{$R *.dfm}


//Procedures declaradas
procedure tfrmcliente.Imprimir;
begin
 dtmdados.qryPedido.Filter    := 'idcliente = ' + inttostr(dtmdados.qryClienteIdCliente.AsInteger);
 dtmdados.qryPedido.Filtered  := true;

 dtmdados.qryItemPed.Filter   := 'tipo = ''Acervo''';
 dtmdados.qryItemPed.Filtered := true;

 frmprincipal.rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relFilmeCli.rav';
 frmprincipal.rvplocadora.Execute;
 frmprincipal.rvplocadora.close;

 dtmdados.qrypedido.Filtered  := false;
 dtmdados.qryItemPed.Filtered := false;
end;
//Procedures declaradas

procedure TfrmCliente.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and ((dtmdados.qryCliente.State = dsbrowse) or (dtmdados.qryCliente.State = dsInactive)) then frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qrycliente.state = dsinsert) or (dtmdados.qrycliente.state = dsedit) then
 begin
   application.messagebox('Inclusão ou edição em andamento.', 'Atenção', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 frmprincipal.mnurelcliente.enabled := true;

 action     := cafree;
 frmcliente := nil;

 dtmdados.qrycliente.close;
end;

procedure TfrmCliente.FormShow(Sender: TObject);
begin
 top  := 0;
 left := 0;

 with frmprincipal do
 begin
   dsform    := frmcliente;
   dstable   := dtmdados.qrycliente;
   Campo1    := 'idcliente';
   Campo2    := 'nome';
   Tabela    := 'Cliente';
   instrucao := 'select * from cliente';
 end;

 panel1.Enabled := false;
 panel3.Enabled := false;
end;

procedure TfrmCliente.dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then abort;
end;

procedure TfrmCliente.btnAddClick(Sender: TObject);
begin
 if btnadd.caption = 'Inserir' then
 begin
   dtmdados.qrydepend.Append;

   if pccliente.ActivePageIndex = 1 then dbedepend.setfocus;

   btnadd.caption     := 'Confirmar';
   btncancela.enabled := true;
   btndel.enabled     := false;
   dbedepend.ReadOnly := false;
   frmprincipal.toolbtnCancelar.Enabled  := false;
   frmprincipal.toolbtnConfirmar.Enabled := false;
 end
 else if btnadd.caption = 'Confirmar' then
 begin
   if dbedepend.text = '' then
   begin
     application.messagebox('Informe o Nome do Dependente.', 'Atenção', mb_ok + mb_iconwarning);
     dbedepend.setfocus;
     exit;
   end;
   dtmdados.qryDepend.Post;

   btnadd.caption     := 'Inserir';
   btndel.Enabled     := true;
   btncancela.enabled := false;
   dbedepend.ReadOnly := true;
   frmprincipal.toolbtnCancelar.Enabled  := true;
   frmprincipal.toolbtnConfirmar.Enabled := true;
 end;
end;

procedure TfrmCliente.btnDelClick(Sender: TObject);
begin
 dtmdados.qrydepend.Delete;
 if dtmdados.qrydepend.RecordCount = 0 then btndel.Enabled := false;
end;

procedure TfrmCliente.btnCancelaClick(Sender: TObject);
begin
 dtmdados.qrydepend.Cancel;
 btnadd.Caption     := 'Inserir';
 btncancela.enabled := false;
 dbedepend.ReadOnly := true;
 frmprincipal.toolbtnCancelar.Enabled  := true;
 frmprincipal.toolbtnConfirmar.Enabled := true;

 if dtmdados.qrydepend.RecordCount > 0 then
  btndel.Enabled := true
 else
  btndel.Enabled := false;
end;

procedure TfrmCliente.dbgDependDblClick(Sender: TObject);
begin
 btnadd.Caption     := 'Confirmar';
 btndel.Enabled     := false;
 btncancela.Enabled := true;
 dtmdados.qrydepend.Edit;
end;

end.
