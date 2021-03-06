unit formLocalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, DBTables, ADODB,
  ComCtrls;

type
  TfrmLocalizar = class(TForm)
    dsLocalizar: TDataSource;
    qryLocalizar: TADOQuery;
    TabControl1: TTabControl;
    Panel1: TPanel;
    lblCount: TLabel;
    gridLocalizar: TDBGrid;
    edtLocalizar: TEdit;
    rgLocalizar: TRadioGroup;
    procedure dsLocalizarDataChange(Sender: TObject; Field: TField);
    procedure edtLocalizarChange(Sender: TObject);
    procedure edtLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure rgLocalizarClick(Sender: TObject);
    procedure gridLocalizarDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizar: TfrmLocalizar;

implementation

uses formDados, formCliente, formPrincipal, formDevolucao;

{$R *.dfm}

{procedure TfrmLocalizar.gridLocalizarDblClick(Sender: TObject);
begin
 {if rgplocalizar.ItemIndex = 0 then
 begin
   if (frmaluno <> nil) and (frmmensalidade <> nil) then frmprincipal.btnaluno.Click;
   dtmdados.qryaluno.locate('Matricula',qrylocalizar.fieldbyname('Matricula').asinteger,[]);
 end;
 {***}
 {if rgplocalizar.ItemIndex = 1 then
 begin
   if frmmodalidade <> nil then frmprincipal.btnmodalidade.Click;
   dtmdados.qrymodalidade.locate('CodModalidade',qrylocalizar.fieldbyname('CodModalidade').asinteger,[]);
 end;
 {***}
 {if rgplocalizar.ItemIndex = 2 then
 begin
   if frmmunicipio <> nil then frmprincipal.btnmunicipio.Click;
   dtmdados.qrycidade.locate('CodCidade',qrylocalizar.fieldbyname('CodCidade').asinteger,[]);
 end;
 {***}
 {if rgplocalizar.ItemIndex = 3 then
 begin
   if frmformapagamento <> nil then frmprincipal.btnformapagamento.Click;
   dtmdados.qryformapagamento.locate('CodFormaPagamento',qrylocalizar.fieldbyname('CodFormaPagamento').asinteger,[]);
 end;
 close;
end;

procedure TfrmLocalizar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action := cafree;
end;}

procedure TfrmLocalizar.dsLocalizarDataChange(Sender: TObject; Field: TField);
begin
 lblCount.caption := inttostr(qrylocalizar.RecordCount) + ' registro(s) encontrado(s)';
end;

procedure TfrmLocalizar.edtLocalizarChange(Sender: TObject);
begin
 qrylocalizar.close;
 qrylocalizar.sql.clear;

 if frmdevolucao <> nil then
 begin
   case rglocalizar.ItemIndex of
     0: qrylocalizar.sql.text := frmprincipal.instrucao + ' and ' + frmprincipal.campo1 + ' like ''' + edtlocalizar.text + '%''';
     1: qrylocalizar.sql.text := frmprincipal.instrucao + ' and ' + frmprincipal.campo2 + ' like ''%' + edtlocalizar.text + '%''';
   end;
 end
 else
 begin
   case rglocalizar.ItemIndex of
     0: qrylocalizar.sql.text := frmprincipal.instrucao + ' where ' + frmprincipal.campo1 + ' like ''' + edtlocalizar.text + '%''';
     1: qrylocalizar.sql.text := frmprincipal.instrucao + ' where ' + frmprincipal.campo2 + ' like ''%' + edtlocalizar.text + '%''';
   end;
 end;

 qrylocalizar.open;
end;

procedure TfrmLocalizar.edtLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
 if (rglocalizar.ItemIndex = 0) and (frmprincipal.tabela <> 'Produto') then
  If not (key in['0'..'9',#8]) then key := #0;
end;

procedure TfrmLocalizar.rgLocalizarClick(Sender: TObject);
begin
 if rglocalizar.ItemIndex = 0 then
 begin
   qrylocalizar.close;
   qrylocalizar.sql.clear;

   qrylocalizar.sql.text  := frmprincipal.instrucao + ' order by ' + frmprincipal.campo1;

   qrylocalizar.open;
   edtlocalizar.MaxLength := 20;
 end;

 if rglocalizar.ItemIndex = 1 then
 begin
   qrylocalizar.close;
   qrylocalizar.sql.clear;
   qrylocalizar.sql.text  := frmprincipal.instrucao + ' order by ' + frmprincipal.campo2;
   qrylocalizar.open;
   edtlocalizar.MaxLength := 0;
 end;

 edtlocalizar.text := '';
 edtlocalizar.setfocus;
end;

procedure TfrmLocalizar.gridLocalizarDblClick(Sender: TObject);
begin
 close;
end;

procedure TfrmLocalizar.FormActivate(Sender: TObject);
begin
 rglocalizarclick(sender);
end;

procedure TfrmLocalizar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
   27: close;
  112: rglocalizar.ItemIndex := 0;
  113: rglocalizar.ItemIndex := 1;
 end;
end;

end.

