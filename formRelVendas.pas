unit formRelVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons, DBCtrls, RpCon, RpConDS,
  RpRenderPDF, RpRender, RpRenderHTML, RpBase, RpSystem, RpDefine,
  RpRave;

type
  TfrmRelVendas = class(TForm)
    Panel1: TPanel;
    MskDataIni: TMaskEdit;
    MskDataFin: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnImprimir: TButton;
    btnFechar: TButton;
    procedure MskDataIniExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure MskDataFinExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbeCodRepKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

uses formPrincipal, formDados;

{$R *.dfm}

procedure TfrmRelVendas.MskDataIniExit(Sender: TObject);
begin
 //---------------------------------------------------------------------------------
 If(ActiveControl = BtnFechar) Then Exit;
 //---------------------------------------------------------------------------------
 If(MskDataIni.Text <> '') And (MskDataIni.Text <> '  /  /  ') And (MskDataIni.Text <> '  /  /    ') Then
 Begin
   Try
    MskDataIni.Text := DateToStr(StrToDate(frmprincipal.Val_Data(MskDataIni.Text)));
   Except
    application.messagebox('Data Inválida!', 'Atençao', mb_ok + mb_iconwarning);
    MskDataIni.SetFocus;
    exit;
   End;
   mskdatafin.text := mskdataini.text;
 End;
end;

procedure TfrmRelVendas.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRelVendas.MskDataFinExit(Sender: TObject);
begin
 //---------------------------------------------------------------------------------
 If(ActiveControl = BtnFechar) Then Exit;
 //---------------------------------------------------------------------------------
 If(MskDataFin.Text <> '') And (MskDataFin.Text <> '  /  /  ') And (MskDataFin.Text <> '  /  /    ') Then Begin
    Try
     Begin
      MskDataFin.Text := DateToStr(StrToDate(frmprincipal.Val_Data(MskDataFin.Text)));
     End;
    Except
     Begin
      application.messagebox('Data Inválida!', 'Atençao', mb_ok + mb_iconwarning);
      MskDataFin.SetFocus;
     End;
    End;
 End;
end;

procedure TfrmRelVendas.btnImprimirClick(Sender: TObject);
var Data: Tdatetime;
begin
 if (trystrtodate(mskdataini.text, data)) and (trystrtodate(mskdatafin.text, data)) then
 begin
   dtmdados.qrypedido.open;
   dtmdados.qrypedido.filter   := 'devolucao >= ' + mskdataini.text + ' and devolucao <= ' + mskdatafin.text;
   dtmdados.qrypedido.filtered := true;

   if dtmdados.qrypedido.recordcount > 0 then
   begin
     frmPrincipal.rvpLocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\RelPeriodoPed.rav';
     frmPrincipal.rvpLocadora.SetParam('Periodo', 'Período: ' + mskdataini.text + ' a ' + mskdatafin.text);
     frmPrincipal.rvpLocadora.Execute;
     frmprincipal.rvpLocadora.Close;
   end
   else
   begin
     application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);
     mskdataini.setfocus;
   end;
   dtmdados.qrypedido.filtered := false;
   dtmdados.qrypedido.close;
 end;
end;

procedure TfrmRelVendas.dbeCodRepKeyPress(Sender: TObject; var Key: Char);
begin
 If not (key in['0'..'9',#8]) then key := #0;
end;

procedure TfrmRelVendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;
end;

end.
