unit formSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmSobre = class(TForm)
    TabControl1: TTabControl;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label8: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.Image1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmSobre.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = 27 then close;
end;

end.
