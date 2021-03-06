unit formDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, jpeg, DB,
  pngimage, Grids, DBGrids;

type
  TfrmDevolucao = class(TForm)
    ImageList1: TImageList;
    TabControl1: TTabControl;
    Panel1: TPanel;
    Image1: TImage;
    edtIdPedido: TEdit;
    Label1: TLabel;
    btnFechar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnCancelar: TSpeedButton;
    btnDevolucao: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnLocalizar: TSpeedButton;
    Label6: TLabel;
    dbgItemPed: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    dbtLocacao: TDBText;
    dbtEntrega: TDBText;
    dbtMulta: TDBText;
    dbtPago: TDBText;
    lblTotal: TLabel;
    edtRecebido: TEdit;
    Panel9: TPanel;
    dbtIdCliente: TDBText;
    dbtCliente: TDBText;
    dbtTipoCli: TDBText;
    Label9: TLabel;
    edtTroco: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnDevolucaoClick(Sender: TObject);
    procedure edtIdPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtIdPedidoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dbgItemPedDblClick(Sender: TObject);
    procedure dbgItemPedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtRecebidoExit(Sender: TObject);
    procedure edtRecebidoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDevolucao: TfrmDevolucao;
         Total: real;

implementation

uses formDados, formPrincipal, formPedido;

{$R *.dfm}

procedure TfrmDevolucao.btnFecharClick(Sender: TObject);
begin
 dtmdados.tag := 0;
 close;
end;

procedure TfrmDevolucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if dtmdados.qryPedido.state = dsedit then
 begin
   application.messagebox('Devolu??o em andamento.', 'Aten??o', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 frmprincipal.mnurelpendencias.enabled := true;
 frmprincipal.mnuRelLocados.enabled    := true;

 action       := cafree;
 frmdevolucao := nil;
end;

procedure TfrmDevolucao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 if (key = 114) and (btnlocalizar.enabled = true) then
  frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmDevolucao.FormShow(Sender: TObject);
begin
 top  := 0;
 left := 0;

 dtmdados.qryitemped.close;
 dtmdados.qrypedido.close;

 with frmprincipal do
 begin
   dsform    := frmpedido;
   dstable   := dtmdados.qrypedido;
   Campo1    := 'idpedido';
   Campo2    := 'nome';
   Tabela    := 'Pedido';
   instrucao := 'SELECT IdPedido, Nome FROM Cliente INNER JOIN Pedido ON Cliente.IdCliente = Pedido.IdCliente WHERE Pedido.devolucao is null';
 end;

 edtidpedido.setfocus;
end;

procedure TfrmDevolucao.btnDevolucaoClick(Sender: TObject);
var ContItem: integer;
begin
 contitem := 0;
 dtmdados.qryItemPed.First;
 repeat
  if (dtmdados.qryItemPedDevolvido.AsString = '') and (lblTotal.Caption = '') then
  begin
    application.messagebox('Nenhum item foi selecionado!', 'Aten??o', mb_ok + mb_iconwarning);
    exit;
  end;
  dtmdados.qryItemPed.Next;
 until dtmdados.qryItemPed.Eof;

 if application.messagebox('Confirmar Devolu??o?', 'Mensagem', mb_yesno + mb_iconquestion) = id_yes then
 begin
   dtmdados.qryItemPed.Filtered := false;
   dtmdados.qryItemPed.Filter   := 'idpedido = ' + inttostr(dtmdados.qryPedidoIdPedido.asinteger) + ' and tipo = ''Acervo''';
   dtmdados.qryitemped.filtered := true;
   repeat
    if dtmdados.qryItemPedDevolvido.AsString = 'X' then
     contitem := contitem + 1;
    dtmdados.qryItemPed.Next;
   until dtmdados.qryItemPed.Eof;

   if dtmdados.qryItemPed.RecordCount = contitem then
    dtmdados.qryPedidoPago.AsCurrency    := total
   else
    dtmdados.qryPedidoDevolucao.AsString := '';
   dtmdados.qryPedido.Post;

   dtmdados.qryPedido.UpdateBatch;
   dtmdados.qryItemPed.UpdateBatch;

   //Atualiza Acervo
   dtmdados.qryacervo.Close;
   dtmdados.qryacervo.SQL.Clear;
   dtmdados.qryacervo.SQL.Text := 'UPDATE Acervo INNER JOIN itemped ON Acervo.IdAcervo = itemped.IdItem ' +
                                  'SET Acervo.Locado = (Acervo.Locado - 1), Acervo.Quantidade = (Acervo.Quantidade + 1) ' +
                                  'WHERE itemped.tipo = ''Acervo'' AND itemped.IdPedido = ' + inttostr(dtmdados.qryPedidoIdPedido.asinteger) + ' AND itemped.Devolvido = ''X'' AND itemped.aberto is null';
   dtmdados.qryacervo.ExecSQL;
   {***}
   dtmdados.qryacervo.SQL.Clear;
   dtmdados.qryacervo.SQL.Text := 'select * from acervo';
   dtmdados.qryacervo.Open;

   //Valida Item em Aberto
   if dtmdados.qryItemPed.RecordCount > contitem then
   begin
     dtmdados.qryItemPed.First;
     repeat
      if dtmdados.qryItemPedDevolvido.AsString = 'X' then
      begin
        dtmdados.qryItemPed.Edit;
         dtmdados.qryItemPedAberto.AsString := 'X';
        dtmdados.qryItemPed.Post;
        dtmdados.qryItemPed.UpdateBatch;
      end;
      dtmdados.qryItemPed.Next;
     until dtmdados.qryItemPed.Eof;
   end;

   if application.messagebox('Emitir recibo?', 'Mensagem', mb_yesno + mb_iconquestion) = id_yes then
   begin
     dtmdados.qryPedido.Filtered := false;
     dtmdados.qrypedido.Filter   := 'idpedido = ' + inttostr(dtmdados.qrypedidoIdpedido.AsInteger);
     dtmdados.qrypedido.Filtered := true;

     dtmdados.qryItemPed.Filtered := false;
     if dtmdados.qryPedidoDevolucao.AsString = '' then
      dtmdados.qryItemPed.Filter  := 'idpedido = ' + inttostr(dtmdados.qryPedidoIdPedido.asinteger) + ' and devolvido = ''X'''
     else
      dtmdados.qryItemPed.Filter  := 'idpedido = ' + inttostr(dtmdados.qryPedidoIdPedido.asinteger);
     dtmdados.qryItemPed.Filtered := true;

     frmprincipal.rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relPedido.rav';

     if dtmdados.qryPedidoDevolucao.AsString = '' then
      frmprincipal.rvpLocadora.SetParam('pago', '')
     else
      frmprincipal.rvpLocadora.SetParam('pago', '[PAGO]' + #13 + 'Devolu??o: ' + dtmdados.qryPedidoDevolucao.AsString + #13 + 'Multa: ' + formatcurr('R$ #,##0.00', dtmdados.qryPedidoMulta.AsCurrency));

     frmprincipal.rvplocadora.Execute;
     frmprincipal.rvpLocadora.Close;

     dtmdados.qryPedido.Filtered := false;
   end;

   dtmdados.qryPedido.Close;
   dtmdados.qryItemPed.Close;
   edtidpedido.enabled  := true;
   edtidpedido.setfocus;
   edtidpedido.Text     := '';
   btnlocalizar.enabled := true;
   btndevolucao.enabled := false;
   btnfechar.enabled    := true;
   btncancelar.enabled  := false;
   lbltotal.caption     := '';
   dtmdados.tag         := 0;

   edttroco.caption     := '';
   edtrecebido.text     := '';
 end;
end;

procedure TfrmDevolucao.edtIdPedidoKeyPress(Sender: TObject; var Key: Char);
begin
 if (key = #13) and (edtidpedido.text <> '') then
 begin
   dtmdados.qrypedido.open;
   if not dtmdados.qrypedido.locate('idpedido', edtidpedido.text, []) then
   begin
     dtmdados.qrypedido.close;
     application.messagebox('Pedido n?o encontrado!', 'Mensagem', mb_ok + mb_iconwarning);
     edtidpedido.setfocus;
   end
   else
   begin
     if dtmdados.qryPedidoDevolucao.AsString <> '' then
     begin
       dtmdados.qrypedido.close;
       application.messagebox('Devolu??o j? efetuada para este Pedido!', 'Aten??o', mb_ok + mb_iconstop);
       btnDevolucao.enabled := false;
       edtidpedido.setfocus;
       abort;
     end;

     dtmdados.qryItemPed.Open;
     dtmdados.qryitemped.filter   := 'idpedido = ' + inttostr(dtmdados.qryPedidoIdPedido.asinteger);
     dtmdados.qryitemped.filtered := true;
     //Calcula multa
     dtmdados.tag := 9;
     dtmdados.qryPedido.Edit;
     dtmdados.qryPedidoDevolucao.AsDateTime := date;

     total := dtmdados.qryPedidoTotal.AsCurrency;

     btnDevolucao.enabled := true;
     btnlocalizar.enabled := false;
     edtidpedido.setfocus;
     edtidpedido.enabled  := false;
     btncancelar.enabled  := true;
     btnfechar.enabled    := false;
   end;
 end;

 If not (key in['0'..'9',#8]) then key := #0;
end;

procedure TfrmDevolucao.edtIdPedidoExit(Sender: TObject);
begin
 if edtidpedido.text <> '' then
  edtidpedido.text := formatfloat('000000', strtofloat(edtidpedido.text));
end;

procedure TfrmDevolucao.btnCancelarClick(Sender: TObject);
begin
 dtmdados.qryPedido.Close;
 dtmdados.qryItemPed.Close;
 edtidpedido.enabled  := true;
 edtidpedido.setfocus;
 edtidpedido.Text     := '';
 btnlocalizar.enabled := true;
 btndevolucao.enabled := false;
 btnfechar.enabled    := true;
 btncancelar.enabled  := false;
 lbltotal.caption     := '';
 dtmdados.tag         := 0;
 edttroco.caption     := '';
 edtrecebido.text     := '';
end;

procedure TfrmDevolucao.btnLocalizarClick(Sender: TObject);
begin
 frmprincipal.toolbtnlocalizar.click;
end;

procedure TfrmDevolucao.dbgItemPedDblClick(Sender: TObject);
begin
 if (dtmdados.qrypedido.state = dsedit) and (dtmdados.qryItemPedTipo.AsString = 'Acervo') and (dtmdados.qryItemPedDevolvido.AsString = '') then
 begin
   dtmdados.qryItemPed.Edit;
    dtmdados.qryItemPedDevolvido.AsString := 'X';
   dtmdados.qryItemPed.Post;

   if dtmdados.qryPedidoEntrega.AsDateTime < date then
   begin
     dbtentrega.Font.Color := clRed;
     total := total + (dtmdados.qryitempedSubtotal.ascurrency * (date - dtmdados.qryPedidoEntrega.AsDateTime));

     dtmdados.qryPedidoMulta.AsCurrency := total - dtmdados.qryPedidoTotal.AsFloat;
     lbltotal.caption := formatcurr('R$ #,##0.00', total - dtmdados.qryPedidoPago.AsCurrency);
   end
   else
   begin
     dbtentrega.Font.Color := clBlack;
     lbltotal.caption := formatcurr('R$ #,##0.00', total - dtmdados.qryPedidoPago.AsCurrency);
   end;

   if dtmdados.qryPedidoMulta.AsCurrency > 0 then
    dbtmulta.Font.Color := clRed
   else
    dbtmulta.Font.Color := clBlack;
 end;
end;

procedure TfrmDevolucao.dbgItemPedDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if dtmdados.qryItemPedDevolvido.asstring = 'X' then
 begin
   dbgItemPed.Canvas.Brush.Color := cl3DLight;
   dbgItemPed.Canvas.FillRect(Rect);
   dbgItemPed.DefaultDrawDataCell(rect,Column.Field,state);
 end;
end;

procedure TfrmDevolucao.edtRecebidoExit(Sender: TObject);
begin
 if edtrecebido.text <> '' then edtrecebido.text := formatfloat('#,##0.00', strtofloat(edtrecebido.text));
end;

procedure TfrmDevolucao.edtRecebidoKeyPress(Sender: TObject; var Key: Char);
begin
 if (key = #13) and (dtmdados.qryPedido.State = dsedit) and (edtrecebido.text <> '') then
 begin
   edttroco.caption := formatfloat('R$ #,##0.00', (strtofloat(edtrecebido.text) - total));
   edtrecebido.text := formatfloat('##0.00', strtofloat(edtrecebido.text));
 end;

 If not (key in['0'..'9',',',#8]) then key := #0;
end;

end.
