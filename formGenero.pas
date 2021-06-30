unit formGenero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ExtCtrls, DB;

type
  TfrmGenero = class(TForm)
    Panel2: TPanel;
    dbtIDGenero: TDBText;
    dbtInscricao: TDBText;
    dbtGenero: TDBText;
    btnFechar: TButton;
    TabControl1: TTabControl;
    Panel1: TPanel;
    Label1: TLabel;
    dbeGenero: TDBEdit;
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
  frmGenero: TfrmGenero;

implementation

uses formdados, formPrincipal;

{$R *.dfm}

procedure TfrmGenero.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmGenero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qrygenero.state = dsinsert) or (dtmdados.qrygenero.state = dsedit) then
 begin
   application.messagebox('Inclusão ou edição em andamento.', 'Atenção', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 action    := cafree;
 frmgenero := nil;

 dtmdados.qrygenero.close;
end;

procedure TfrmGenero.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and ((dtmdados.qryGenero.State = dsbrowse) or (dtmdados.qryGenero.State = dsinactive)) then frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmGenero.FormShow(Sender: TObject);
begin
 left := 0;
 top  := 0;

 with frmprincipal do
 begin
   dsform    := frmgenero;
   dstable   := dtmdados.qrygenero;
   Campo1    := 'Idgenero';
   Campo2    := 'Genero';
   Tabela    := 'Genero';
   instrucao := 'select * from genero';
 end;

 panel1.enabled := false;
end;

end.
