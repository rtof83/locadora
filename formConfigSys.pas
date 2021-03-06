unit formConfigSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, DB;

type
  TfrmConfigSys = class(TForm)
    TabControl1: TTabControl;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbeSenha: TDBEdit;
    dbeHost: TDBEdit;
    dbeUsuario: TDBEdit;
    btnFechar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigSys: TfrmConfigSys;

implementation

uses formDados, formPrincipal;

{$R *.dfm}

procedure TfrmConfigSys.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmConfigSys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qryconfigsys.state = dsinsert) or (dtmdados.qryconfigsys.state = dsedit) then
 begin
   application.messagebox('Inclus?o ou edi??o em andamento.', 'Aten??o', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);

 frmprincipal.toolbtnLocalizar.Visible := true;
 frmprincipal.toolbtnImprimir.Visible  := true;
 action       := cafree;
 frmconfigsys := nil;

 dtmdados.qryconfigsys.close;
end;

procedure TfrmConfigSys.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;
end;

procedure TfrmConfigSys.FormShow(Sender: TObject);
begin
 top  := 0;
 left := 0;

 with frmprincipal do
 begin
   dsform    := frmconfigsys;
   dstable   := dtmdados.qryconfigsys;
   Campo1    := 'usuario';
   Campo2    := 'host';
   Tabela    := 'ConfigSys';
   instrucao := 'select * from configsys';
 end;

 frmprincipal.toolbtnLocalizar.Visible := false;
 frmprincipal.toolbtnImprimir.Visible  := false;
 panel1.enabled := false;
end;

end.
