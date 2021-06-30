unit formAcervo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ExtCtrls, ExtDlgs, DB,
  AppEvnts, Menus;

type
  TfrmAcervo = class(TForm)
    Panel2: TPanel;
    dbtIDAcervo: TDBText;
    dbtAcervo: TDBText;
    dbtInscricao: TDBText;
    pcAcervo: TPageControl;
    tbsFilme: TTabSheet;
    Panel1: TPanel;
    btnFechar: TButton;
    Label1: TLabel;
    dbeNome: TDBEdit;
    dbeClassificacao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeLancamento: TDBEdit;
    grbVideo: TGroupBox;
    rdbVideo: TRadioButton;
    grbGame: TGroupBox;
    dbcGame: TDBComboBox;
    rdbGame: TRadioButton;
    dbcVideo: TDBComboBox;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    dbeDuracao: TDBEdit;
    dbeProdutora: TDBEdit;
    Label7: TLabel;
    dbeQuantidade: TDBEdit;
    Label8: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    dbeBarCode: TDBEdit;
    Panel3: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    dbmAtores: TDBMemo;
    Label12: TLabel;
    dbeDiretor: TDBEdit;
    Label13: TLabel;
    dbmComentario: TDBMemo;
    opcAcervo: TOpenPictureDialog;
    dbeLocado: TDBEdit;
    Label14: TLabel;
    dbcCategoria: TDBLookupComboBox;
    Panel4: TPanel;
    imgAcervo: TImage;
    Label9: TLabel;
    dbeCodInterno: TDBEdit;
    popAcervo: TPopupMenu;
    mnuInserir: TMenuItem;
    mnuExcluir: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    dbcGenero: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure rdbVideoClick(Sender: TObject);
    procedure rdbGameClick(Sender: TObject);
    procedure imgAcervoDblClick(Sender: TObject);
    procedure dbeQuantidadeExit(Sender: TObject);
    procedure mnuInserirClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure imgAcervoClick(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcervo: TfrmAcervo;

implementation

uses formDados, formPrincipal;

{$R *.dfm}

procedure TfrmAcervo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qryacervo.state = dsinsert) or (dtmdados.qryacervo.state = dsedit) then
 begin
   application.messagebox('Inclusão ou edição em andamento.', 'Atenção', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 frmprincipal.mnurelacervo.enabled := true;

 action    := cafree;
 frmacervo := nil;

 dtmdados.qryacervo.close;
end;

procedure TfrmAcervo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and ((dtmdados.qryAcervo.State = dsbrowse) or (dtmdados.qryAcervo.State = dsinactive)) then frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmAcervo.FormShow(Sender: TObject);
begin
 top  := 0;
 left := 0;

 with frmprincipal do
 begin
   dsform    := frmacervo;
   dstable   := dtmdados.qryacervo;
   Campo1    := 'barcode';
   Campo2    := 'nome';
   Tabela    := 'Acervo';
   instrucao := 'select * from acervo';
 end;
 
 panel1.Enabled := false;
 panel3.Enabled := false;
end;

procedure TfrmAcervo.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmAcervo.rdbVideoClick(Sender: TObject);
begin
 if dtmdados.qryacervo.state <> dsbrowse then
 begin
   dbcgame.ItemIndex := 0;
   grbvideo.enabled  := true;
   grbgame.enabled   := false;
   SendMessage(dbcVideo.Handle, CB_SHOWDROPDOWN, 1, 0);
 end;
end;

procedure TfrmAcervo.rdbGameClick(Sender: TObject);
begin
 if dtmdados.qryacervo.state <> dsbrowse then
 begin
   dbcvideo.ItemIndex := 0;
   grbvideo.enabled   := false;
   grbgame.enabled    := true;
   SendMessage(dbcGame.Handle, CB_SHOWDROPDOWN, 1, 0);
 end;
end;

procedure TfrmAcervo.imgAcervoDblClick(Sender: TObject);
begin
 if dtmdados.qryAcervo.state <> dsbrowse then
 begin
   opcAcervo.Execute;
   imgAcervo.Picture.LoadFromFile(opcAcervo.FileName);
   dtmdados.qryAcervoImagem.AsString := opcAcervo.FileName;
 end;
end;

procedure TfrmAcervo.dbeQuantidadeExit(Sender: TObject);
begin
 if dtmdados.qryAcervoQuantidade.AsInteger = 0 then
  application.MessageBox('Informe um valor maior que zero para Quantidade!', 'Atenção', mb_ok + mb_iconwarning);
end;

procedure TfrmAcervo.mnuInserirClick(Sender: TObject);
begin
 opcAcervo.Execute;
 imgAcervo.Picture.LoadFromFile(opcAcervo.FileName);
 dtmdados.qryAcervoImagem.AsString := opcAcervo.FileName;
end;

procedure TfrmAcervo.mnuExcluirClick(Sender: TObject);
begin
 imgAcervo.Picture := nil;
 dtmdados.qryAcervoImagem.AsString := '';
end;

procedure TfrmAcervo.imgAcervoClick(Sender: TObject);
begin
 popacervo.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TfrmAcervo.ApplicationEvents1Hint(Sender: TObject);
begin
 if dtmdados.qryacervo.state <> dsinactive then
  imgacervo.Hint := dtmdados.qryAcervoImagem.AsString;
end;

end.
