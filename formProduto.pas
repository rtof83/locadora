unit formProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DB, DBCtrls, Buttons, ComCtrls,
  ExtDlgs, jpeg, Menus, AppEvnts;

type
  TfrmProduto = class(TForm)
    btnFechar: TButton;
    TabControl1: TTabControl;
    Panel2: TPanel;
    dbtIDLocadora: TDBText;
    dbtInscricao: TDBText;
    dbeLocadora: TDBText;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    dbeProduto: TDBEdit;
    dbeValor: TDBEdit;
    Panel3: TPanel;
    imgProduto: TImage;
    dbeQuantidade: TDBEdit;
    dbeBarCode: TDBEdit;
    opcProduto: TOpenPictureDialog;
    popProduto: TPopupMenu;
    mnuInserir: TMenuItem;
    mnuExcluir: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbeQuantidadeExit(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure imgProdutoClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure mnuInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

uses formDados, formPrincipal, formLocalizar;

{$R *.dfm}

procedure TfrmProduto.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qryproduto.state = dsinsert) or (dtmdados.qryproduto.state = dsedit) then
 begin
   application.messagebox('Inclusão ou edição em andamento.', 'Atenção', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 frmprincipal.mnurelproduto.enabled := true;

 action     := cafree;
 frmproduto := nil;

 dtmdados.qryproduto.close;
end;

procedure TfrmProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and ((dtmdados.qryProduto.State = dsbrowse) or (dtmdados.qryProduto.State = dsinactive)) then frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
 left := 0;
 top  := 0;

 with frmprincipal do
 begin
   dsform    := frmproduto;
   dstable   := dtmdados.qryproduto;
   Campo1    := 'barcode';
   Campo2    := 'produto';
   Tabela    := 'Produto';
   instrucao := 'select * from produto';
 end;

 panel1.enabled := false;
end;

procedure TfrmProduto.dbeQuantidadeExit(Sender: TObject);
begin
 if dtmdados.qryProdutoQuantidade.AsInteger = 0 then
  application.MessageBox('Informe um valor maior que zero para Quantidade!', 'Atenção', mb_ok + mb_iconwarning);
end;

procedure TfrmProduto.dbeValorExit(Sender: TObject);
begin
 if dtmdados.qryProdutoPreco.AsInteger = 0 then
  application.MessageBox('Informe um Valor maior que zero!', 'Atenção', mb_ok + mb_iconwarning);
end;

procedure TfrmProduto.imgProdutoClick(Sender: TObject);
begin
 popproduto.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TfrmProduto.mnuExcluirClick(Sender: TObject);
begin
 imgproduto.Picture := nil;
 dtmdados.qryProdutoImagem.AsString := '';
end;

procedure TfrmProduto.ApplicationEvents1Hint(Sender: TObject);
begin
 if dtmdados.qryproduto.state <> dsinactive then
  imgproduto.Hint := dtmdados.qryProdutoImagem.AsString;
end;

procedure TfrmProduto.mnuInserirClick(Sender: TObject);
begin
 opcProduto.Execute;
 imgproduto.Picture.LoadFromFile(opcProduto.FileName);
 dtmdados.qryProdutoImagem.AsString := opcProduto.FileName;
end;

end.
