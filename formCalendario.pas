unit formCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ToolWin, DB;

type
  TfrmCalendario = class(TForm)
    MonthCalendar1: TMonthCalendar;
    ToolBar1: TToolBar;
    btnFechar: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalendario: TfrmCalendario;

implementation

uses formPrincipal;

{$R *.dfm}

procedure TfrmCalendario.FormCreate(Sender: TObject);
begin
 monthcalendar1.Date := date;
 if frmprincipal.coolbarcadastro.visible = true then
 begin
   frmprincipal.coolbarcadastro.visible := false;
   tag := 1;
 end;
end;

procedure TfrmCalendario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmprincipal.mnucalendario.enabled := true;
 if tag = 1 then frmprincipal.coolbarcadastro.visible := true;
 frmcalendario := nil;
 action := cafree;
end;

procedure TfrmCalendario.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCalendario.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = 27 then close;
end;

end.
