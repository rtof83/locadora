unit formPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, Buttons, DB,
  DBClient, jpeg, Menus, ComCtrls, pngimage;

type
  TfrmPedido = class(TForm)
    pmnItem: TPopupMenu;
    popAcervo: TMenuItem;
    popProduto: TMenuItem;
    pmnCliente: TPopupMenu;
    popTitular: TMenuItem;
    popDependente: TMenuItem;
    TabControl1: TTabControl;
    Panel1: TPanel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnBuscaCli: TSpeedButton;
    dbtCodCli: TDBText;
    dbtCliente: TDBText;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btnBuscaItem: TSpeedButton;
    dbtCodItem: TDBText;
    dbtItem: TDBText;
    lblCount: TLabel;
    dbtTipoItem: TDBText;
    dbtTipoCli: TDBText;
    Bevel5: TBevel;
    Label1: TLabel;
    Bevel6: TBevel;
    Label3: TLabel;
    Bevel7: TBevel;
    dbtQuantAcervo: TDBText;
    dbtQuantProd: TDBText;
    Label2: TLabel;
    btnCancela: TSpeedButton;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    dbeEntrega: TDBEdit;
    dbgItemPed: TDBGrid;
    dbtPago: TDBText;
    Label4: TLabel;
    Bevel8: TBevel;
    Label5: TLabel;
    dbtMulta: TDBText;
    Panel2: TPanel;
    dbtIDCliente: TDBText;
    DBText1: TDBText;
    dbtInscricao: TDBText;
    bvlPago: TBevel;
    dbtDevolucao: TDBText;
    dbtTotal: TDBText;
    Label6: TLabel;
    imgPago: TImage;
    lblTitular: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    imgPgEntregue: TImage;
    Label9: TLabel;

    //Procedures declaradas
    procedure SetLocacao;
    procedure Imprimir;
    //Procedures declaradas

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaCliClick(Sender: TObject);
    procedure dbeCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodAcervoKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscaItemClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure dbgItemLocDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure popAcervoClick(Sender: TObject);
    procedure popProdutoClick(Sender: TObject);
    procedure popTitularClick(Sender: TObject);
    procedure popDependenteClick(Sender: TObject);
    procedure dbgItemPedDblClick(Sender: TObject);
    procedure dbgItemPedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure dbeEntregaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;
   CalcTotal: real;

implementation

uses formDados, formPrincipal;

{$R *.dfm}

//Procedures declaradas
procedure TfrmPedido.SetLocacao;
begin
 with frmprincipal do
 begin
   dsform    := frmpedido;
   dstable   := dtmdados.qrypedido;
   Campo1    := 'idpedido';
   Campo2    := 'nome';
   Tabela    := 'Pedido';
   instrucao := 'SELECT IdPedido, Nome FROM Cliente INNER JOIN Pedido ON Cliente.IdCliente = Pedido.IdCliente';
 end;
end;

procedure tfrmpedido.Imprimir;
var ContAcervo: integer;
begin
 contacervo := 0;
 dtmdados.qrypedido.Filter   := 'idpedido = ' + inttostr(dtmdados.qrypedidoIdpedido.AsInteger);
 dtmdados.qrypedido.Filtered := true;

 if dtmdados.qryPedidoPago.AsCurrency = 0 then
 begin
   if application.messagebox('Pago?', 'Mensagem', mb_yesno + mb_iconquestion) = id_yes then
   begin
     dtmdados.tag := 9;

     dtmdados.qryItemPed.First;
     repeat
      if dtmdados.qryItemPedTipo.AsString = 'Acervo' then contacervo := 1;
      dtmdados.qryItemPed.Next;
     until (dtmdados.qryItemPed.Eof) or (contacervo = 1);

     dtmdados.qryPedido.Edit;
      dtmdados.qryPedidoPago.AsCurrency := dtmdados.qryPedidoTotal.AsCurrency;
      if contacervo = 0 then dtmdados.qryPedidoDevolucao.AsDateTime := date;
     dtmdados.qryPedido.Post;
     dtmdados.qryPedido.UpdateBatch;
     frmprincipal.rvpLocadora.SetParam('pago', '[PAGO]');
   end;
 end
 else
 begin
   if dtmdados.qryPedidoDevolucao.AsString = '' then
    frmprincipal.rvpLocadora.SetParam('pago', '[PAGO]')
   else
    frmprincipal.rvpLocadora.SetParam('pago', '[PAGO]' + #13 + 'Devolução: ' + dtmdados.qryPedidoDevolucao.AsString + #13 + 'Multa: ' + formatcurr('R$ #,##0.00', dtmdados.qryPedidoMulta.AsCurrency));
 end;

 frmprincipal.rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relPedido.rav';
 frmprincipal.rvplocadora.Execute;
 frmprincipal.rvplocadora.close;

 dtmdados.qrypedido.Filtered := false;
 dtmdados.qrypedido.last;
 dtmdados.tag := 0;
end;
//Procedures declaradas

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (dtmdados.qryPedido.state = dsinsert) or (dtmdados.qryPedido.state = dsedit) then
 begin
   application.messagebox('Inclusão ou edição em andamento.', 'Atenção', mb_ok + mb_iconwarning);
   exit;
 end;

 frmprincipal.ativaform(true, false);
 frmprincipal.mnuRelLocados.enabled    := true;
 frmprincipal.mnurelpendencias.enabled := true;
 frmprincipal.coolbarcadastro.visible  := false;

 action    := cafree;
 frmpedido := nil;

 dtmdados.qrypedido.close;
end;

procedure TfrmPedido.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;

 //Localizar
 if (key = 114) and ((dtmdados.qryPedido.State = dsbrowse) or (dtmdados.qryPedido.State = dsinactive)) then frmprincipal.toolbtnlocalizar.click;

 //Titular    -> F5
 if (key = 116) and (dtmdados.qryItemPed.State <> dsbrowse) and (dtmdados.qryItemPed.State <> dsinactive) then popTitular.click;
 //Dependente -> F6
 if (key = 117) and (dtmdados.qryItemPed.State <> dsbrowse) and (dtmdados.qryItemPed.State <> dsinactive) then popDependente.click;
 //Acervo     -> F7
 if (key = 118) and (dtmdados.qryItemPed.State <> dsbrowse) and (dtmdados.qryItemPed.State <> dsinactive) then popAcervo.click;
 //Produto    -> F8
 if (key = 119) and (dtmdados.qryItemPed.State <> dsbrowse) and (dtmdados.qryItemPed.State <> dsinactive) then popProduto.click;

 //Adiciona Produto
 if (key = 107) and (dtmdados.qryItemPed.State <> dsbrowse) and (dtmdados.qryItemPed.State <> dsinactive) and
    (dtmdados.qryItemPedTipo.AsString = 'Produto') and (dtmdados.qryProdutoQuantidade.AsInteger > dtmdados.qryItemPedQuantidade.AsInteger) then
 begin
   dtmdados.qryItemPedQuantidade.AsInteger := dtmdados.qryItemPedQuantidade.AsInteger + 1;
   dtmdados.qryItemPedSubTotal.AsCurrency  := dtmdados.qryProdutoPreco.AsCurrency * dtmdados.qryItemPedQuantidade.AsInteger;
   dtmdados.qryItemPedDescricao.AsString   := dtmdados.qryProdutoProduto.AsString + ' X ' + formatfloat('00', dtmdados.qryItemPedQuantidade.AsInteger);
 end;
 //Retira Produto
 if (key = 109) and (dtmdados.qryItemPed.State <> dsbrowse) and (dtmdados.qryItemPed.State <> dsinactive) and
    (dtmdados.qryItemPedTipo.AsString = 'Produto') and (dtmdados.qryItemPedQuantidade.AsInteger > 1) then
 begin
   dtmdados.qryItemPedQuantidade.AsInteger := dtmdados.qryItemPedQuantidade.AsInteger - 1;
   dtmdados.qryItemPedSubTotal.AsCurrency  := dtmdados.qryProdutoPreco.AsCurrency * dtmdados.qryItemPedQuantidade.AsInteger;
   if dtmdados.qryItemPedQuantidade.AsInteger > 1 then
    dtmdados.qryItemPedDescricao.AsString  := dtmdados.qryProdutoProduto.AsString + ' X ' + formatfloat('00', dtmdados.qryItemPedQuantidade.AsInteger)
   else
    dtmdados.qryItemPedDescricao.AsString  := dtmdados.qryProdutoProduto.AsString;
 end;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
 imgPago.hide;
 imgPgEntregue.hide;

 lblcount.Caption := '';
 setlocacao;

 panel1.enabled := false;
end;

procedure TfrmPedido.btnBuscaCliClick(Sender: TObject);
begin
 pmncliente.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TfrmPedido.dbeCodCliKeyPress(Sender: TObject; var Key: Char);
begin
 If not (key in['0'..'9',#8]) then key := #0;
end;

procedure TfrmPedido.dbeCodAcervoKeyPress(Sender: TObject; var Key: Char);
begin
 If not (key in['0'..'9',#8]) then key := #0;
end;

procedure TfrmPedido.btnBuscaItemClick(Sender: TObject);
begin
 pmnItem.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
end;

procedure TfrmPedido.btnAddClick(Sender: TObject);
begin
 if btnadd.caption = 'Inserir' then
 begin
   btnadd.caption        := 'Confirmar';
   btncancela.enabled    := true;
   btndel.enabled        := false;
   btnbuscaitem.enabled  := true;
   dbgitemped.enabled    := false;
   frmprincipal.toolbtnCancelar.Enabled  := false;
   frmprincipal.toolbtnConfirmar.Enabled := false;

   dtmdados.qryItemPed.Append;
 end
 else if btnadd.caption = 'Confirmar' then
 begin
   if dtmdados.qryItemPedIdItem.AsString = '' then
   begin
     application.messagebox('Informe o Código do Item.', 'Atenção', mb_ok + mb_iconwarning);
     exit;
   end;

   if dtmdados.qryItemPedTipo.AsString = 'Acervo' then
   begin
     if dtmdados.qryAcervoQuantidade.AsInteger = 0 then
     begin
       application.messagebox('Todas as cópias do Item estão locadas.', 'Atenção', mb_ok + mb_iconwarning);
       exit;
     end;

     //Atualiza Total
     dtmdados.qrypedidoTotal.AsCurrency := dtmdados.qrypedidoTotal.AsCurrency + dtmdados.qryItemPedSubTotal.AsCurrency;

     //Atualiza Data de Entrega
     dtmdados.qryPedidoEntrega.AsDateTime    := dtmdados.qryPedidoEntrega.AsDateTime + dtmdados.qryAcervoEntrega.AsInteger;

     //Atualiza Quantidade do Acervo
     dtmdados.qryAcervo.Edit;
      dtmdados.qryAcervoLocado.AsInteger     := dtmdados.qryAcervoLocado.AsInteger + 1;
      dtmdados.qryAcervoQuantidade.AsInteger := dtmdados.qryAcervoQuantidade.AsInteger - 1;
      dtmdados.qryAcervoContLoc.AsInteger    := dtmdados.qryAcervoContLoc.AsInteger + 1;
     dtmdados.qryAcervo.Post;

     dtmdados.qryItemPed.Post;
   end
   else if dtmdados.qryItemPedTipo.AsString = 'Produto' then
   begin
     if dtmdados.qryProdutoQuantidade.AsInteger < dtmdados.qryItemPedQuantidade.AsInteger then
     begin
       application.messagebox('Não existe estoque para a quantidade informada.', 'Atenção', mb_ok + mb_iconwarning);
       exit;
     end;

     //Atualiza Total
     dtmdados.qrypedidoTotal.AsCurrency := dtmdados.qrypedidoTotal.AsCurrency + dtmdados.qryItemPedSubTotal.AsCurrency;

     //Atualiza Quantidade do Produto
     dtmdados.qryProduto.Edit;
      dtmdados.qryProdutoQuantidade.AsInteger := dtmdados.qryProdutoQuantidade.AsInteger - dtmdados.qryItemPedQuantidade.AsInteger;
     dtmdados.qryProduto.Post;

     dtmdados.qryItemPed.Post;
   end;

   btnadd.caption       := 'Inserir';
   btndel.Enabled       := true;
   btncancela.enabled   := false;
   btnbuscaitem.enabled := false;
   dbgitemped.enabled   := true;
   frmprincipal.toolbtnCancelar.Enabled  := true;
   frmprincipal.toolbtnConfirmar.Enabled := true;
 end;
end;

procedure TfrmPedido.btnCancelaClick(Sender: TObject);
begin
 //Atualiza Data de Entrega
 dtmdados.qryPedidoEntrega.AsDateTime := dtmdados.qryPedidoEntrega.AsDateTime - dtmdados.qryAcervoEntrega.AsInteger;

 dtmdados.qryItemPed.Cancel;
 btnadd.Caption        := 'Inserir';
 btncancela.enabled    := false;
 btnbuscaitem.enabled  := false;
 dbgitemped.enabled    := true;
 frmprincipal.toolbtnCancelar.Enabled  := true;
 frmprincipal.toolbtnConfirmar.Enabled := true;

 if dtmdados.qryItemPed.RecordCount > 0 then
  btndel.Enabled := true
 else
  btndel.Enabled := false;
end;

procedure TfrmPedido.btnDelClick(Sender: TObject);
begin
 if dtmdados.qryItemPedDevolvido.AsString = 'X' then
 begin
   application.messagebox('Acervo devolvido. Não é possível removê-lo', 'Mensagem', mb_ok + mb_iconinformation);
   exit;
 end;

 dtmdados.tag := 1;
 if dtmdados.qryItemPedTipo.AsString = 'Acervo' then
 begin
   dtmdados.qryacervo.locate('idacervo', dtmdados.qryItemPedIdItem.asinteger, []);
   dtmdados.qryAcervo.Edit;
    dtmdados.qryAcervoLocado.AsInteger     := dtmdados.qryAcervoLocado.AsInteger - 1;
    dtmdados.qryAcervoQuantidade.AsInteger := dtmdados.qryAcervoQuantidade.AsInteger + 1;
    dtmdados.qryAcervoContLoc.AsInteger    := dtmdados.qryAcervoContLoc.AsInteger - 1;
    dtmdados.qryPedidoEntrega.AsDateTime   := dtmdados.qryPedidoEntrega.AsDateTime - dtmdados.qryAcervoEntrega.AsInteger;
   dtmdados.qryAcervo.Post;
 end;

 if dtmdados.qryItemPedTipo.AsString = 'Produto' then
 begin
   dtmdados.qryProduto.locate('idproduto', dtmdados.qryItemPedIdItem.asinteger, []);
   dtmdados.qryProduto.Edit;
    dtmdados.qryProdutoQuantidade.AsInteger := dtmdados.qryProdutoQuantidade.AsInteger + dtmdados.qryItemPedQuantidade.AsInteger;
   dtmdados.qryProduto.Post;
 end;

 //Atualiza Total
 dtmdados.qrypedidoTotal.AsCurrency := dtmdados.qrypedidoTotal.AsCurrency - dtmdados.qryItemPedSubTotal.AsCurrency;

 dtmdados.qryItemPed.Delete;
 if dtmdados.qryItemPed.RecordCount = 0 then btndel.Enabled := false;
 dtmdados.tag := 0;
end;

procedure TfrmPedido.dbgItemLocDblClick(Sender: TObject);
begin
 btnadd.Caption     := 'Confirmar';
 btndel.Enabled     := false;
 btncancela.Enabled := true;
 dtmdados.qryItemPed.Edit;
end;

procedure TfrmPedido.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmPedido.popAcervoClick(Sender: TObject);
begin
 with frmprincipal do
 begin
   dstable   := dtmdados.qryacervo;
   Campo1    := 'barcode';
   Campo2    := 'nome';
   Tabela    := 'Acervo';
   instrucao := 'SELECT * from acervo';
   toolbtnlocalizar.click;
 end;

 dtmdados.qryItemPedIdItem.AsInteger     := dtmdados.qryAcervoIdAcervo.AsInteger;
 dtmdados.qryItemPedDescricao.AsString   := dtmdados.qryAcervoNome.AsString;
 dtmdados.qryItemPedSubTotal.AsCurrency  := dtmdados.qryAcervoValor.AsCurrency;
 dtmdados.qryItemPedTipo.AsString        := 'Acervo';
 dtmdados.qryItemPedQuantidade.AsInteger := 0;

 SetLocacao;
end;

procedure TfrmPedido.popProdutoClick(Sender: TObject);
begin
 with frmprincipal do
 begin
   dstable   := dtmdados.qryproduto;
   Campo1    := 'barcode';
   Campo2    := 'produto';
   Tabela    := 'Produto';
   instrucao := 'SELECT * from produto';
   toolbtnlocalizar.click;
 end;

 dtmdados.qryItemPedIdItem.AsInteger     := dtmdados.qryProdutoIdProduto.AsInteger;
 dtmdados.qryItemPedDescricao.AsString   := dtmdados.qryProdutoProduto.AsString;
 dtmdados.qryItemPedSubTotal.AsCurrency  := dtmdados.qryProdutoPreco.AsCurrency;
 dtmdados.qryItemPedTipo.AsString        := 'Produto';
 dtmdados.qryItemPedQuantidade.AsInteger := 1;
 
 SetLocacao;
end;

procedure TfrmPedido.popTitularClick(Sender: TObject);
begin
 with frmprincipal do
 begin
   dstable   := dtmdados.qrycliente;
   Campo1    := 'idcliente';
   Campo2    := 'nome';
   Tabela    := 'Cliente';
   instrucao := 'SELECT * FROM cliente';
   toolbtnlocalizar.click;
 end;

 dtmdados.qryPedidoIdCliente.AsInteger := dtmdados.qryClienteIdCliente.AsInteger;
 dtmdados.qryPedidoCliente.AsString    := dtmdados.qryClienteNome.AsString;
 dtmdados.qryPedidoTipoCli.AsString    := 'Titular';

 SetLocacao;
end;

procedure TfrmPedido.popDependenteClick(Sender: TObject);
begin
 with frmprincipal do
 begin
   dstable   := dtmdados.qrydepend;
   Campo1    := 'iddepend';
   Campo2    := 'dependente';
   Tabela    := 'Dependentes';
   instrucao := 'SELECT * FROM dependentes';
   toolbtnlocalizar.click;
 end;

 dtmdados.qryCliente.Locate('idcliente', dtmdados.qryDependIdCliente.AsInteger, []);
 dtmdados.qryPedidoIdCliente.AsInteger := dtmdados.qryClienteIdCliente.AsInteger;
 dtmdados.qryPedidoCliente.AsString    := dtmdados.qryDependDependente.AsString;
 dtmdados.qryPedidoTipoCli.AsString    := 'Dependente';

 SetLocacao;
end;

procedure TfrmPedido.dbgItemPedDblClick(Sender: TObject);
begin
 dtmdados.qryItemPed.Edit;
 btnadd.Caption     := 'Confirmar';
 btndel.Enabled     := false;
 btncancela.Enabled := true;
end;

procedure TfrmPedido.dbgItemPedDrawColumnCell(Sender: TObject;
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

procedure TfrmPedido.FormActivate(Sender: TObject);
begin
 WindowState := wsMaximized;
end;

procedure TfrmPedido.dbeEntregaExit(Sender: TObject);
begin
 If(dbeEntrega.Text <> '') And (dbeEntrega.Text <> '  /  /  ') And (dbeEntrega.Text <> '  /  /    ') Then
 Begin
   Try
    dbeEntrega.Text := DateToStr(StrToDate(frmprincipal.Val_Data(dbeEntrega.Text)));
   Except
    application.messagebox('Data Inválida!', 'Atençao', mb_ok + mb_iconwarning);
    dbeEntrega.SetFocus;
   End;
 End;
end;

end.
