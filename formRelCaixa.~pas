unit formRelCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask;

type
  TfrmRelCaixa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MskDataIni: TMaskEdit;
    MskDataFin: TMaskEdit;
    btnImprimir: TButton;
    btnFechar: TButton;
    rgpCaixa: TRadioGroup;
    procedure btnFecharClick(Sender: TObject);
    procedure MskDataIniExit(Sender: TObject);
    procedure MskDataFinExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCaixa: TfrmRelCaixa;

implementation

uses formPrincipal, formDados;

{$R *.dfm}

procedure TfrmRelCaixa.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRelCaixa.MskDataIniExit(Sender: TObject);
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

procedure TfrmRelCaixa.MskDataFinExit(Sender: TObject);
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

procedure TfrmRelCaixa.btnImprimirClick(Sender: TObject);
var Data: Tdatetime;
begin
 if (trystrtodate(mskdataini.text, data)) and (trystrtodate(mskdatafin.text, data)) then
 begin
   if rgpcaixa.ItemIndex = 0 then
   begin
     dtmdados.qryPedido.SQL.Clear;
     dtmdados.qryPedido.SQL.Text := 'select * from pedido where devolucao >= #' + formatdatetime('m/d/yyyy', strtodate(mskdataini.text)) + '# and devolucao <= #' + (formatdatetime('m/d/yyyy', strtodate(mskdatafin.text))) + '# order by devolucao';
     dtmdados.qryPedido.Open;
   end;

   if rgpcaixa.ItemIndex = 1 then
   begin
     dtmdados.qryCaixaProd.SQL.Clear;
     dtmdados.qryCaixaProd.SQL.Text := 'SELECT ItemPed.Descricao, Count(ItemPed.Descricao) AS Quantidade, Sum(ItemPed.SubTotal) AS SubTotal, ItemPed.IdItem, Acervo.Quantidade as Estoque ' +
                                       'FROM (Acervo INNER JOIN ItemPed ON Acervo.IdAcervo = ItemPed.IdItem) INNER JOIN Pedido ON ItemPed.IdPedido = Pedido.IdPedido ' +
                                       'WHERE ItemPed.Tipo = ''Acervo'' AND Pedido.Devolucao >= #' + formatdatetime('m/d/yyyy', strtodate(mskdataini.text)) + '# AND devolucao <= #' + (formatdatetime('m/d/yyyy', strtodate(mskdatafin.text))) + '# ' +
                                       'GROUP BY ItemPed.Descricao, ItemPed.IdItem, Acervo.Quantidade';
     dtmdados.qryCaixaProd.Open;
   end;

   if rgpcaixa.ItemIndex = 2 then
   begin
     dtmdados.qryCaixaProd.Close;
     dtmdados.qryCaixaProd.SQL.Clear;
     dtmdados.qryCaixaProd.SQL.Text := 'SELECT ItemPed.Descricao, Count(ItemPed.Descricao) AS Quantidade, Sum(ItemPed.SubTotal) AS SubTotal, ItemPed.IdItem, Produto.Quantidade as Estoque ' +
                                       'FROM (Produto INNER JOIN ItemPed ON Produto.IdProduto = ItemPed.IdItem) INNER JOIN Pedido ON ItemPed.IdPedido = Pedido.IdPedido ' +
                                       'WHERE ItemPed.Tipo = ''Produto'' AND Pedido.Devolucao >= #' + formatdatetime('m/d/yyyy', strtodate(mskdataini.text)) + '# and devolucao <= #' + (formatdatetime('m/d/yyyy', strtodate(mskdatafin.text))) + '# ' +
                                       'GROUP BY ItemPed.Descricao, ItemPed.IdItem, Produto.Quantidade';
     dtmdados.qryCaixaProd.Open;
   end;
 end;

 if rgpcaixa.ItemIndex > 0 then
 begin
   if dtmdados.qryCaixaProd.recordcount = 0 then
   begin
     application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);
     mskdataini.setfocus;
     exit;
   end;

   frmPrincipal.rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relCaixaProd.rav';
   if rgpcaixa.ItemIndex = 1 then
   begin
     frmprincipal.rvpLocadora.SetParam('Titulo', 'Relatório de Caixa | Acervos');
     frmprincipal.rvpLocadora.SetParam('TituloTipo', 'Locados');
   end;
   if rgpcaixa.ItemIndex = 2 then
   begin
     frmprincipal.rvpLocadora.SetParam('Titulo', 'Relatório de Caixa | Produtos');
     frmprincipal.rvpLocadora.SetParam('TituloTipo', 'Vendidos');
   end;

   frmPrincipal.rvpLocadora.SetParam('Periodo', 'Período: ' + mskdataini.text + ' à ' + mskdatafin.text);
   frmPrincipal.rvplocadora.Execute;
   frmprincipal.rvplocadora.close;

   dtmdados.qrycaixaprod.close;
 end
 else
 begin
   if dtmdados.qryPedido.recordcount = 0 then
   begin
     application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);
     mskdataini.setfocus;
     exit;
   end;

   frmPrincipal.rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relCaixa.rav';
   frmPrincipal.rvpLocadora.SetParam('Periodo', 'Período: ' + mskdataini.text + ' à ' + mskdatafin.text);
   frmPrincipal.rvplocadora.Execute;
   frmprincipal.rvplocadora.close;

   dtmdados.qryPedido.Close;
   dtmdados.qryPedido.SQL.Clear;
   dtmdados.qryPedido.SQL.Text := 'select * from pedido';
 end;
end;

procedure TfrmRelCaixa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;
end;

end.
