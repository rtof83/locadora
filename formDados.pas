unit formDados;

interface

uses
  SysUtils, Classes, DB, Forms, Dialogs, Windows, DBTables, ADODB, COMObj,
  RpDefine, RpCon, RpConDS, IniFiles, Graphics;

type
  TdtmDados = class(TDataModule)
    dbLocadora: TADOConnection;
    qryCliente: TADOQuery;
    qryClienteIdCliente: TAutoIncField;
    qryClienteNome: TWideStringField;
    qryClienteFantasia: TWideStringField;
    qryClienteInscricao: TDateTimeField;
    qryClienteNascimento: TDateTimeField;
    qryClienteTipoEnd: TWideStringField;
    qryClienteEndereco: TWideStringField;
    qryClienteComplemento: TWideStringField;
    qryClienteBairro: TWideStringField;
    qryClienteCEP: TWideStringField;
    qryClienteCidade: TWideStringField;
    qryClienteUF: TWideStringField;
    qryClienteTelefone: TWideStringField;
    qryClienteCelular: TWideStringField;
    qryClienteEmail: TWideStringField;
    qryClienteObservacao: TMemoField;
    qryClienteStatus: TWideStringField;
    qryClienteCPF: TWideStringField;
    qryClienteRG: TWideStringField;
    qryDepend: TADOQuery;
    qryDependIdCliente: TIntegerField;
    qryDependIdDepend: TAutoIncField;
    qryDependDependente: TWideStringField;
    qryLocadora: TADOQuery;
    qryLocadoraIdLocadora: TAutoIncField;
    qryLocadoraRazao: TWideStringField;
    qryLocadoraFantasia: TWideStringField;
    qryLocadoraCNPJ: TWideStringField;
    qryLocadoraEmail: TWideStringField;
    qryLocadoraTelefone: TWideStringField;
    qryLocadoraTipoEnd: TWideStringField;
    qryLocadoraEndereco: TWideStringField;
    qryLocadoraComplemento: TWideStringField;
    qryLocadoraBairro: TWideStringField;
    qryLocadoraCidade: TWideStringField;
    qryLocadoraUF: TWideStringField;
    qryLocadoraDataCadastro: TDateTimeField;
    qryLocadoraCEP: TWideStringField;
    dsCliente: TDataSource;
    dsDepend: TDataSource;
    dsLocadora: TDataSource;
    qryAcervo: TADOQuery;
    qryAcervoIdAcervo: TAutoIncField;
    qryAcervoNome: TWideStringField;
    qryAcervoTipo: TWideStringField;
    qryAcervoClassificacao: TWideStringField;
    qryAcervoDuracao: TSmallintField;
    qryAcervoEspecificacoes: TWideStringField;
    qryAcervoProdutora: TWideStringField;
    qryAcervoAtores: TMemoField;
    qryAcervoDiretor: TWideStringField;
    qryAcervoComentario: TMemoField;
    qryAcervoAudio: TWideStringField;
    qryAcervoLegenda: TWideStringField;
    qryAcervoDataCadastro: TDateTimeField;
    qryAcervoLocado: TSmallintField;
    qryAcervoAnoLanc: TWideStringField;
    qryAcervoBarCode: TWideStringField;
    dsAcervo: TDataSource;
    qryConfig: TADOQuery;
    qryConfigUsuario: TWideStringField;
    qryConfigSenha: TWideStringField;
    dsConfig: TDataSource;
    dlgDB: TOpenDialog;
    qryPedido: TADOQuery;
    dsPedido: TDataSource;
    qryItemPed: TADOQuery;
    dsItemPed: TDataSource;
    qryBusca: TADOQuery;
    dsProduto: TDataSource;
    qryProduto: TADOQuery;
    qryProdutoIdProduto: TAutoIncField;
    qryProdutoProduto: TWideStringField;
    qryProdutoBarCode: TWideStringField;
    qryProdutoDataCadastro: TDateTimeField;
    qryAcervoContLoc: TIntegerField;
    rdsLocadora: TRvDataSetConnection;
    rdsAcervo: TRvDataSetConnection;
    rdsCliente: TRvDataSetConnection;
    rdsPedido: TRvDataSetConnection;
    rdsItemPed: TRvDataSetConnection;
    qryPedidoIdPedido: TAutoIncField;
    qryPedidoIdCliente: TIntegerField;
    qryPedidoDataCadastro: TDateTimeField;
    qryPedidoTotal: TBCDField;
    qryCategoria: TADOQuery;
    dsCategoria: TDataSource;
    qryCategoriaIdCategoria: TAutoIncField;
    qryCategoriaCategoria: TWideStringField;
    qryCategoriaPreco: TBCDField;
    qryAcervoIdCategoria: TIntegerField;
    qryProdutoPreco: TBCDField;
    qryAcervoImagem: TWideStringField;
    qryProdutoImagem: TWideStringField;
    qryCategoriaDataCadastro: TDateTimeField;
    qryItemPedIdItemPed: TAutoIncField;
    qryItemPedIdPedido: TIntegerField;
    qryItemPedIdItem: TIntegerField;
    qryItemPedDescricao: TWideStringField;
    qryItemPedSubTotal: TBCDField;
    qryItemPedTipo: TWideStringField;
    qryPedidoTipoCli: TWideStringField;
    qryCategoriaEntrega: TSmallintField;
    qryAcervoEntrega: TIntegerField;
    qryAcervoValor: TCurrencyField;
    qryPedidoCliente: TWideStringField;
    qryProdutoQuantidade: TIntegerField;
    qryPedidoEntrega: TDateTimeField;
    qryPedidoDevolucao: TDateTimeField;
    qryItemPedQuantAcervo: TIntegerField;
    qryItemPedQuantProd: TIntegerField;
    rdsConfig: TRvDataSetConnection;
    qryPedidoMulta: TBCDField;
    qryPedidoPago: TBCDField;
    rdsProduto: TRvDataSetConnection;
    rdsDepend: TRvDataSetConnection;
    qryItemPedDevolvido: TWideStringField;
    qryItemPedAberto: TWideStringField;
    qryAcervoCodigo: TIntegerField;
    qryPedidoCliDepend: TStringField;
    dsConfigSys: TDataSource;
    qryConfigSys: TADOQuery;
    qryConfigSysUsuario: TWideStringField;
    qryConfigSysSenha: TWideStringField;
    qryConfigSysHost: TWideStringField;
    qryCaixaProd: TADOQuery;
    qryCaixaProdDescricao: TWideStringField;
    qryCaixaProdQuantidade: TIntegerField;
    qryCaixaProdSubTotal: TBCDField;
    qryCaixaProdIdItem: TIntegerField;
    qryCaixaProdEstoque: TIntegerField;
    qryAcervoQuantidade: TIntegerField;
    qryGenero: TADOQuery;
    dsGenero: TDataSource;
    qryGeneroIdGenero: TAutoIncField;
    qryGeneroGenero: TWideStringField;
    qryGeneroDataCadastro: TDateTimeField;
    qryAcervoIdGenero: TIntegerField;
    qryAcervoGenero: TStringField;
    qryItemPedQuantidade: TSmallintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryAcervoAfterInsert(DataSet: TDataSet);
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure qryPedidoAfterInsert(DataSet: TDataSet);
    procedure qryPedidoAfterEdit(DataSet: TDataSet);
    procedure qryPedidoAfterPost(DataSet: TDataSet);
    procedure qryPedidoBeforePost(DataSet: TDataSet);
    procedure qryClienteAfterInsert(DataSet: TDataSet);
    procedure qryPedidoBeforeDelete(DataSet: TDataSet);
    procedure qryDependentesAfterInsert(DataSet: TDataSet);
    procedure dsClienteDataChange(Sender: TObject; Field: TField);
    procedure qryLocadoraAfterInsert(DataSet: TDataSet);
    procedure dsLocadoraDataChange(Sender: TObject; Field: TField);
    procedure qryProdutoAfterInsert(DataSet: TDataSet);
    procedure qryClienteAfterPost(DataSet: TDataSet);
    procedure qryClienteAfterCancel(DataSet: TDataSet);
    procedure qryLocadoraAfterEdit(DataSet: TDataSet);
    procedure qryLocadoraAfterCancel(DataSet: TDataSet);
    procedure qryLocadoraAfterPost(DataSet: TDataSet);
    procedure qryAcervoAfterCancel(DataSet: TDataSet);
    procedure qryAcervoAfterEdit(DataSet: TDataSet);
    procedure qryAcervoAfterPost(DataSet: TDataSet);
    procedure qryProdutoAfterCancel(DataSet: TDataSet);
    procedure qryProdutoAfterEdit(DataSet: TDataSet);
    procedure qryProdutoAfterPost(DataSet: TDataSet);
    procedure qryAcervoBeforePost(DataSet: TDataSet);
    procedure qryItemPedAfterInsert(DataSet: TDataSet);
    procedure qryPedidoAfterDelete(DataSet: TDataSet);
    procedure qryDependAfterInsert(DataSet: TDataSet);
    procedure qryClienteAfterDelete(DataSet: TDataSet);
    procedure qryClienteAfterEdit(DataSet: TDataSet);
    procedure qryClienteBeforeDelete(DataSet: TDataSet);
    procedure qryClienteBeforePost(DataSet: TDataSet);
    procedure qryCategoriaAfterInsert(DataSet: TDataSet);
    procedure qryCategoriaAfterCancel(DataSet: TDataSet);
    procedure qryCategoriaAfterEdit(DataSet: TDataSet);
    procedure qryCategoriaAfterPost(DataSet: TDataSet);
    procedure qryProdutoAfterDelete(DataSet: TDataSet);
    procedure qryPedidoAfterScroll(DataSet: TDataSet);
    procedure dsItemPedDataChange(Sender: TObject; Field: TField);
    procedure qryClienteAfterOpen(DataSet: TDataSet);
    procedure qryAcervoAfterOpen(DataSet: TDataSet);
    procedure qryProdutoAfterOpen(DataSet: TDataSet);
    procedure qryCategoriaAfterOpen(DataSet: TDataSet);
    procedure qryPedidoAfterOpen(DataSet: TDataSet);
    procedure qryLocadoraAfterOpen(DataSet: TDataSet);
    procedure qryPedidoBeforeCancel(DataSet: TDataSet);
    procedure qryPedidoBeforeClose(DataSet: TDataSet);
    procedure qryPedidoAfterClose(DataSet: TDataSet);
    procedure qryConfigAfterOpen(DataSet: TDataSet);
    procedure qryClienteBeforeClose(DataSet: TDataSet);
    procedure qryConfigSysAfterOpen(DataSet: TDataSet);
    procedure qryConfigSysAfterInsert(DataSet: TDataSet);
    procedure qryConfigSysAfterPost(DataSet: TDataSet);
    procedure qryConfigAfterInsert(DataSet: TDataSet);
    procedure qryConfigAfterPost(DataSet: TDataSet);
    procedure qryProdutoAfterScroll(DataSet: TDataSet);
    procedure qryAcervoAfterScroll(DataSet: TDataSet);
    procedure qryGeneroAfterCancel(DataSet: TDataSet);
    procedure qryGeneroAfterEdit(DataSet: TDataSet);
    procedure qryGeneroAfterInsert(DataSet: TDataSet);
    procedure qryGeneroAfterOpen(DataSet: TDataSet);
    procedure qryGeneroAfterPost(DataSet: TDataSet);
    procedure qryAcervoBeforeClose(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryPedidoAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmDados: TdtmDados;

implementation

uses formLogin, formPrincipal, formAcervo, formPedido, formCliente, formLocadora,
     formProduto, formCategoria, formDevolucao, unit01, formConfigSys, formConfig,
     formGenero, formBackup;

{$R *.dfm}

procedure TdtmDados.DataModuleCreate(Sender: TObject);
var Ini: TIniFile;
begin
 Ini := TIniFile.Create(copy(application.ExeName, 0, length(application.ExeName) - 12) + 'Config.ini');
 if Ini.ReadString('DB', 'Path', '') = '' then
 begin
   application.messagebox('A base de dados n?o foi localizada!', 'Aten??o', mb_ok + mb_iconwarning);
   dlgdb.InitialDir := application.GetNamePath + '\DB';
   dlgdb.Execute;
   if dlgdb.filename <> '' then
    Ini.WriteString('DB', 'Path', dlgdb.FileName)
   else
    exit;
 end;

 try
  dblocadora.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + Ini.ReadString('DB','Path','') + ';Persist Security Info=False';
  dblocadora.open;
 except
  application.messagebox('N?o foi poss?vel realizar a conex?o com a base de dados','Erro',mb_ok + mb_iconerror);
  exit;
 end;
 Ini.free;
 {***}
 //serial DVDCIA -> 'Y2CBGBRE' | serial do notebook -> 'ZAHTUF'
 {if unit01.unit001 <> 'Y2CBGBRE' then
 begin
   application.messagebox('O Sistema n?o est? validado!', 'Erro', mb_ok + mb_iconerror);
   application.terminate;
 end;
 {***}
 qryconfig.open;
 application.createform(tfrmlogin, frmlogin);
 frmlogin.showmodal;
 frmlogin.free;
 {***}
 qrylocadora.open;
 {***}
 application.createform(tfrmprincipal, frmprincipal);
 frmprincipal.show;
end;

procedure TdtmDados.qryAcervoAfterInsert(DataSet: TDataSet);
begin
 if frmacervo <> nil then
 begin
   frmacervo.btnfechar.enabled := false;
   frmacervo.grbgame.enabled   := false;
   frmacervo.pcAcervo.ActivePageIndex := 0;
   frmacervo.dbeNome.SetFocus;
 end;
 qryacervoDataCadastro.AsDateTime := date;
 qryacervoTipo.AsString := 'DVD';
end;

procedure TdtmDados.dsPedidoDataChange(Sender: TObject; Field: TField);
begin
 if frmpedido <> nil then
 begin
   if (qryitemped.state = dsbrowse) and (tag = 0) then
   begin
     qryitemped.filtered := false;
     qryitemped.filter   := 'idpedido = ' + inttostr(qryPedidoIdPedido.asinteger);
     qryitemped.filtered := true;

     //Valida a Data de Entrega
     {if qrypedidoEntrega.AsDateTime < date then
      frmpedido.dbeEntrega.Font.Color := clRed
     else
      frmpedido.dbeEntrega.Font.Color := clBlack;}
   end;

   //Exibe Titular do Dependente
   if qryPedidoTipoCli.AsString = 'Dependente' then
    frmpedido.lblTitular.Caption := '(Titular: ' + qryPedidoCliDepend.AsString + ')'
   else
    frmpedido.lblTitular.Caption := '';
 end;
end;

procedure TdtmDados.qryPedidoAfterInsert(DataSet: TDataSet);
begin
 qryPedidoDataCadastro.AsDateTime := date;
 qryPedidoEntrega.AsDateTime      := date;
 qryPedidoPago.AsCurrency         := 0;
 with frmPedido do
 begin
   imgPago.hide;
   imgPgEntregue.hide;
   btndel.enabled     := true;
   btncancela.enabled := false;
   btnadd.click;
 end;
end;

procedure TdtmDados.qryPedidoAfterEdit(DataSet: TDataSet);
begin
 if tag = 0 then
 begin
   with frmPedido do
   begin
     btndel.enabled       := true;
     btncancela.enabled   := false;
     btnbuscaitem.enabled := false;
     imgPago.hide;
     imgPgEntregue.hide;
   end;
 end;
end;

procedure TdtmDados.qryPedidoBeforePost(DataSet: TDataSet);
begin
 if tag = 0 then
 begin
   if qryitemped.recordcount = 0 then
   begin
     application.messagebox('Nenhum item foi inclu?do!', 'Aten??o', mb_ok + mb_iconwarning);
     abort;
   end;

   if qryPedidoEntrega.AsString = '' then
   begin
     application.messagebox('Informe a Data de Entrega!', 'Aten??o', mb_ok + mb_iconwarning);
     frmPedido.dbeEntrega.setfocus;
     abort;
   end;

   if qryPedidoEntrega.AsDateTime < date then
   begin
     application.messagebox('A Data de Entrega deve ser superior ? data atual!', 'Aten??o', mb_ok + mb_iconwarning);
     frmPedido.dbeEntrega.setfocus;
     abort;
   end;

   qryitemped.UpdateBatch;

  { qrybusca.SQL.Clear;
   qrybusca.SQL.Text := 'SELECT sum(itemped.subtotal) as TotalGeral FROM Pedido INNER JOIN ' +
                        'ItemPed ON Pedido.IdPedido = ItemPed.IdPedido WHERE ItemPed.IdPedido = ' + inttostr(qryPedidoIdPedido.asinteger);
   qrybusca.Open;
   qrypedidoTotal.AsCurrency := qryBusca.FieldbyName('totalgeral').AsCurrency;
   qrybusca.Close;}
 end;
end;

procedure TdtmDados.qryPedidoAfterPost(DataSet: TDataSet);
begin
 if tag = 0 then
 begin
   qryacervo.UpdateBatch;
   qryproduto.UpdateBatch;
   qryPedido.UpdateBatch;
   with frmPedido do
   begin
     btndel.enabled     := true;
     btncancela.enabled := false;
   end;

   qryitemped.Close;
   qryitemped.SQL.Clear;
   qryitemped.SQL.Text := 'UPDATE itemped SET idPedido = ' + qryPedidoIdPedido.asstring + ' WHERE itemped.idPedido = 0';
   qryitemped.ExecSQL;
   {***}
   qryitemped.SQL.Clear;
   qryitemped.SQL.Text := 'select * from itemped';
   qryitemped.Open;

   if application.messagebox('Emitir Pedido', 'Mensagem', mb_yesno + mb_iconexclamation) = id_yes then
    frmpedido.imprimir;

   qryitemped.close;
   qrycliente.close;
   qrydepend.close;
   qryacervo.close;
   qryproduto.close;
   qrypedido.close;

   frmpedido.lblCount.Visible := false;
 end;
end;

procedure TdtmDados.qryClienteAfterInsert(DataSet: TDataSet);
begin
 qryclienteInscricao.AsDateTime := date;
 qryClienteStatus.AsString      := 'ATIVO';
 with frmcliente do
 begin
   btnfechar.enabled  := false;
   btncancela.enabled := false;
   btndel.enabled     := false;
   pccliente.ActivePageIndex := 0;
   dbenome.setfocus;
 end;
end;

procedure TdtmDados.qryPedidoBeforeDelete(DataSet: TDataSet);
begin
 //Acervo
 qryacervo.Close;
 qryacervo.SQL.Clear;
 qryacervo.SQL.Text := 'UPDATE Acervo INNER JOIN itemped ON Acervo.IdAcervo = itemped.IdItem ' +
                       'SET Acervo.Locado = (Acervo.Locado - 1), Acervo.Quantidade = (Acervo.Quantidade + 1) ' +
                       'WHERE itemped.tipo = "Acervo" AND itemped.IdPedido = ' + inttostr(qryPedidoIdPedido.asinteger);
 qryacervo.ExecSQL;
 {***}
 qryacervo.SQL.Clear;
 qryacervo.SQL.Text := 'select * from acervo';
 qryacervo.Open;

 //itemped
 qryitemped.Close;
 qryitemped.SQL.Clear;
 qryitemped.SQL.Text := 'DELETE * FROM itemped WHERE IdPedido = ' + inttostr(qryPedidoIdPedido.asinteger);
 qryitemped.ExecSQL;
 {***}
 qryitemped.SQL.Clear;
 qryitemped.SQL.Text := 'select * from itemped';
 qryitemped.Open;
end;

procedure TdtmDados.qryDependentesAfterInsert(DataSet: TDataSet);
begin
 qryDependIdCliente.AsInteger := qryClienteIdCliente.AsInteger;
end;

procedure TdtmDados.dsClienteDataChange(Sender: TObject; Field: TField);
begin
 if frmcliente <> nil then
 begin
   if qrydepend.state = dsbrowse then
   begin
     qrydepend.filtered := false;
     qrydepend.filter   := 'idcliente = ' + inttostr(qryClienteIdCliente.AsInteger);
     qrydepend.filtered := true;
   end;
 end;
end;

procedure TdtmDados.qryLocadoraAfterInsert(DataSet: TDataSet);
begin
 if frmlocadora <> nil then
 begin
   frmlocadora.btnfechar.enabled := false;
   frmlocadora.dbeRazao.SetFocus;
 end;
 qryLocadoraDataCadastro.AsDateTime := date;
end;

procedure TdtmDados.dsLocadoraDataChange(Sender: TObject; Field: TField);
begin
 frmprincipal.Caption := dtmdados.qrylocadoraRazao.asstring;
end;

procedure TdtmDados.qryProdutoAfterInsert(DataSet: TDataSet);
begin
 if frmproduto <> nil then
 begin
   frmproduto.btnfechar.enabled := false;
   frmproduto.dbeProduto.SetFocus;
 end;
 qryProdutoDataCadastro.AsDateTime := date;
end;

procedure TdtmDados.qryClienteAfterPost(DataSet: TDataSet);
begin
 qrycliente.UpdateBatch;
 with frmcliente do
 begin
   btnfechar.enabled  := true;
   btndel.enabled     := true;
   btncancela.enabled := false;
 end;

 qrydepend.Close;
 qrydepend.SQL.Clear;
 qrydepend.SQL.Text := 'UPDATE dependentes SET idcliente = ' + inttostr(qryClienteIdCliente.AsInteger) + ' WHERE idcliente = 0';
 qrydepend.ExecSQL;
 {***}
 qrydepend.SQL.Clear;
 qrydepend.SQL.Text := 'select * from dependentes';
 qrydepend.Open;
end;

procedure TdtmDados.qryClienteAfterCancel(DataSet: TDataSet);
begin
 if frmcliente <> nil then frmcliente.btnfechar.enabled := true;
 qrydepend.CancelBatch;
 qrycliente.CancelBatch;
end;

procedure TdtmDados.qryLocadoraAfterEdit(DataSet: TDataSet);
begin
 if frmlocadora <> nil then frmlocadora.btnfechar.enabled := false;
end;

procedure TdtmDados.qryLocadoraAfterCancel(DataSet: TDataSet);
begin
 if frmlocadora <> nil then frmlocadora.btnfechar.enabled := true;
end;

procedure TdtmDados.qryLocadoraAfterPost(DataSet: TDataSet);
begin
 if frmlocadora <> nil then frmlocadora.btnfechar.enabled := true;
end;

procedure TdtmDados.qryAcervoAfterCancel(DataSet: TDataSet);
begin
 if frmacervo <> nil then
 begin
   frmacervo.imgAcervo.Picture := nil;
   frmacervo.btnfechar.enabled := true;
   qryacervo.CancelBatch;
 end;
end;

procedure TdtmDados.qryAcervoAfterEdit(DataSet: TDataSet);
begin
 if frmacervo <> nil then frmacervo.btnfechar.enabled := false;
end;

procedure TdtmDados.qryAcervoAfterPost(DataSet: TDataSet);
begin
 if frmacervo <> nil then
 begin
   frmacervo.imgAcervo.Picture := nil;
   frmacervo.btnfechar.enabled := true;
   qryacervo.UpdateBatch;
 end;
end;

procedure TdtmDados.qryProdutoAfterCancel(DataSet: TDataSet);
begin
 if frmproduto <> nil then
 begin
   frmproduto.imgProduto.Picture := nil;
   frmproduto.btnfechar.enabled  := true;
   qryproduto.CancelBatch;
 end;
end;

procedure TdtmDados.qryProdutoAfterEdit(DataSet: TDataSet);
begin
 if frmproduto <> nil then
 begin
   frmproduto.btnfechar.enabled := false;
 end;
end;

procedure TdtmDados.qryProdutoAfterPost(DataSet: TDataSet);
begin
 if frmproduto <> nil then
 begin
   frmproduto.imgProduto.Picture := nil;
   frmproduto.btnfechar.enabled  := true;
   qryproduto.UpdateBatch;
 end;
end;

procedure TdtmDados.qryAcervoBeforePost(DataSet: TDataSet);
begin
 if qryAcervoQuantidade.AsInteger < 0 then
 begin
   application.messagebox('A Quantidade informada deve ser maior que o n?mero de itens Locados.', 'Aten??o', mb_ok + mb_iconwarning);
   if frmacervo <> nil then frmacervo.dbeQuantidade.SetFocus;
   abort;
 end;
end;

procedure TdtmDados.qryItemPedAfterInsert(DataSet: TDataSet);
begin
 qryitempedIdPedido.AsInteger := qryPedidoIdPedido.AsInteger;
end;

procedure TdtmDados.qryPedidoAfterDelete(DataSet: TDataSet);
begin
 qryPedido.UpdateBatch;
end;

procedure TdtmDados.qryDependAfterInsert(DataSet: TDataSet);
begin
 qryDependIdCliente.AsInteger := qryClienteIdCliente.AsInteger;
end;

procedure TdtmDados.qryClienteAfterDelete(DataSet: TDataSet);
begin
 qrycliente.UpdateBatch;
end;

procedure TdtmDados.qryClienteAfterEdit(DataSet: TDataSet);
begin
 with frmcliente do
 begin
   btnfechar.enabled  := false;
   btncancela.enabled := false;

   if qrydepend.recordcount > 0 then
    btndel.enabled    := true;
 end;
end;

procedure TdtmDados.qryClienteBeforeDelete(DataSet: TDataSet);
begin
 qrydepend.Close;
 qrydepend.SQL.Clear;
 qrydepend.SQL.Text := 'DELETE * FROM dependentes WHERE IdCliente = ' + inttostr(qryClienteIdCliente.AsInteger);
 qrydepend.ExecSQL;
 {***}
 qrydepend.SQL.Clear;
 qrydepend.SQL.Text := 'select * from dependentes';
 qrydepend.Open;
end;

procedure TdtmDados.qryClienteBeforePost(DataSet: TDataSet);
begin
 qrydepend.UpdateBatch;
end;

procedure TdtmDados.qryCategoriaAfterInsert(DataSet: TDataSet);
begin
 if frmcategoria <> nil then
 begin
   frmcategoria.btnfechar.enabled := false;
   frmcategoria.dbeCategoria.SetFocus;
 end;
 qryCategoriaDataCadastro.AsDateTime := date;
end;

procedure TdtmDados.qryCategoriaAfterCancel(DataSet: TDataSet);
begin
 if frmcategoria <> nil then frmcategoria.btnfechar.enabled := true;
end;

procedure TdtmDados.qryCategoriaAfterEdit(DataSet: TDataSet);
begin
 if frmcategoria <> nil then frmcategoria.btnfechar.enabled := false;
end;

procedure TdtmDados.qryCategoriaAfterPost(DataSet: TDataSet);
begin
 if frmcategoria <> nil then frmcategoria.btnfechar.enabled := true;
end;

procedure TdtmDados.qryProdutoAfterDelete(DataSet: TDataSet);
begin
 qryproduto.UpdateBatch;
end;

procedure TdtmDados.qryPedidoAfterScroll(DataSet: TDataSet);
begin
 if frmpedido <> nil then
 begin
   if qrypedido.state = dsbrowse then
   begin
     //Filtra Devolu??o
     if qryPedidoDevolucao.AsString <> '' then
     begin
       frmprincipal.toolbtnexcluir.enabled := false;
       frmprincipal.toolbtnalterar.enabled := false;
     end
     else if (qryPedidoDevolucao.AsString = '') and (qrypedido.RecordCount > 0) then
      frmprincipal.controles(true, false);

     //Exibe label Pago / Pago e Entregue
     if frmpedido.tag = 0 then
     begin
       if (qryPedidoPago.AsCurrency > 0) and (qryPedidoDevolucao.AsString <> '') then
       begin
         frmpedido.imgPgEntregue.show;
         frmpedido.imgPago.hide;
       end
       else if qryPedidoPago.AsCurrency > 0 then
       begin
         frmpedido.imgPgEntregue.hide;
         frmpedido.imgPago.show;
       end
       else
       begin
         frmpedido.imgPgEntregue.hide;
         frmpedido.imgPago.hide;
       end;
     end;
   end;

   //Exibe label de Multa
   if qryPedidoMulta.AsCurrency > 0 then
   begin
     frmpedido.bevel8.Visible   := true;
     frmpedido.dbtmulta.Visible := true;
     frmpedido.label5.Visible   := true;
   end
   else
   begin
     frmpedido.bevel8.Visible   := false;
     frmpedido.dbtmulta.Visible := false;
     frmpedido.label5.Visible   := false;
   end;
 end;
end;

procedure TdtmDados.dsItemPedDataChange(Sender: TObject; Field: TField);
var ChecaItem: string;
begin
 if frmpedido <> nil then
 begin
   if qryitemped.state = dsbrowse then
   begin
     if qryitemped.recordcount = 1 then
      checaitem := ' item'
     else
      checaitem := ' itens';

     frmPedido.lblCount.caption := formatfloat('00', qryitemped.recordcount) + checaitem;
   end;

   if qryItemPedTipo.AsString = 'Acervo' then
   begin
     frmpedido.dbtQuantAcervo.Visible := true;
     frmpedido.dbtQuantProd.Visible   := false;
   end;

   if qryItemPedTipo.AsString = 'Produto' then
   begin
     frmpedido.dbtQuantAcervo.Visible := false;
     frmpedido.dbtQuantProd.Visible   := true;
   end;
 end;
end;

procedure TdtmDados.qryClienteAfterOpen(DataSet: TDataSet);
begin
 if frmcliente <> nil then
 begin
   qrydepend.Open;
   frmprincipal.controles(true, false);
   if qrycliente.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryAcervoAfterOpen(DataSet: TDataSet);
begin
 if frmacervo <> nil then
 begin
   frmprincipal.controles(true, false);
   qrycategoria.open;
   qrygenero.open;
   if qryacervo.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryProdutoAfterOpen(DataSet: TDataSet);
begin
 if frmproduto <> nil then
 begin
   frmprincipal.controles(true, false);
   if qryproduto.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryCategoriaAfterOpen(DataSet: TDataSet);
begin
 if frmcategoria <> nil then
 begin
   frmprincipal.controles(true, false);
   if qrycategoria.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryPedidoAfterOpen(DataSet: TDataSet);
begin
 if frmpedido <> nil then
 begin
   qryitemped.open;
   qrycliente.open;
   qryitemped.open;
   qryacervo.open;
   qryproduto.open;
   frmprincipal.controles(true, false);
   if qrypedido.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryLocadoraAfterOpen(DataSet: TDataSet);
begin
 if frmlocadora <> nil then
 begin
   frmprincipal.controles(true, false);
   if qrylocadora.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryPedidoBeforeCancel(DataSet: TDataSet);
begin
 qryitemped.CancelUpdates;
 qrycliente.CancelUpdates;
 qryacervo.CancelUpdates;
 qryproduto.CancelUpdates;
end;

procedure TdtmDados.qryPedidoBeforeClose(DataSet: TDataSet);
begin
 qryitemped.close;
 qrycliente.close;
 qryacervo.close;
 qryproduto.close;
end;

procedure TdtmDados.qryPedidoAfterClose(DataSet: TDataSet);
begin
 if frmpedido <> nil then
 begin
   frmpedido.imgPago.hide;
   frmpedido.imgPgEntregue.hide;
   frmpedido.lblTitular.Caption := '';
 end;
end;

procedure TdtmDados.qryConfigAfterOpen(DataSet: TDataSet);
begin
 if frmcategoria <> nil then
 begin
   frmprincipal.controles(true, false);
   if qryconfig.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryClienteBeforeClose(DataSet: TDataSet);
begin
 qrydepend.close;
end;

procedure TdtmDados.qryConfigSysAfterOpen(DataSet: TDataSet);
begin
 if frmcategoria <> nil then
 begin
   frmprincipal.controles(true, false);
   if qryconfig.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryConfigSysAfterInsert(DataSet: TDataSet);
begin
 if frmconfigsys <> nil then
 begin
   frmconfigsys.btnfechar.enabled := false;
   frmconfigsys.dbeUsuario.SetFocus;
 end;
end;

procedure TdtmDados.qryConfigSysAfterPost(DataSet: TDataSet);
begin
 if frmconfigsys <> nil then frmconfigsys.btnfechar.enabled := true;
end;

procedure TdtmDados.qryConfigAfterInsert(DataSet: TDataSet);
begin
 if frmconfig <> nil then
 begin
   frmconfig.dbeusuario.setfocus;
   frmconfig.btnFechar.Enabled := false;
 end;
end;

procedure TdtmDados.qryConfigAfterPost(DataSet: TDataSet);
begin
 if frmconfig <> nil then frmconfig.btnFechar.Enabled := true;
end;

procedure TdtmDados.qryProdutoAfterScroll(DataSet: TDataSet);
begin
 if frmproduto <> nil then
 begin
   //Carrega Imagem
   if qryProdutoImagem.AsString = '' then
    frmproduto.imgProduto.Picture := nil
   else
   begin
     try
      frmproduto.imgProduto.Picture.LoadFromFile(qryprodutoImagem.AsString);
     except
     end;
   end;
 end;
end;

procedure TdtmDados.qryAcervoAfterScroll(DataSet: TDataSet);
begin
 if frmacervo <> nil then
 begin
   //Carrega Imagem
   if qryAcervoImagem.AsString = '' then
    frmacervo.imgacervo.Picture := nil
   else
   begin
     try
      frmacervo.imgAcervo.Picture.LoadFromFile(qryacervoImagem.AsString);
     except
     end;
   end;
 end;
end;

procedure TdtmDados.qryGeneroAfterCancel(DataSet: TDataSet);
begin
 if frmgenero <> nil then frmgenero.btnfechar.enabled := true;
end;

procedure TdtmDados.qryGeneroAfterEdit(DataSet: TDataSet);
begin
 if frmgenero <> nil then frmgenero.btnfechar.enabled := false;
end;

procedure TdtmDados.qryGeneroAfterInsert(DataSet: TDataSet);
begin
 if frmgenero <> nil then
 begin
   frmgenero.btnfechar.enabled := false;
   frmgenero.dbegenero.SetFocus;
 end;
 qryGeneroDataCadastro.AsDateTime := date;
end;

procedure TdtmDados.qryGeneroAfterOpen(DataSet: TDataSet);
begin
 if frmgenero <> nil then
 begin
   frmprincipal.controles(true, false);
   if qrygenero.recordcount = 0 then
   begin
     frmprincipal.toolbtnexcluir.enabled   := false;
     frmprincipal.toolbtnalterar.enabled   := false;
     frmprincipal.toolbtnlocalizar.enabled := false;
     frmprincipal.toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TdtmDados.qryGeneroAfterPost(DataSet: TDataSet);
begin
 if frmgenero <> nil then frmgenero.btnfechar.enabled := true;
end;

procedure TdtmDados.qryAcervoBeforeClose(DataSet: TDataSet);
begin
 qrycategoria.close;
 qrygenero.close;
end;

procedure TdtmDados.DataModuleDestroy(Sender: TObject);
var ArquivoMDB, Temp: string;
    DB: OLEVariant;
begin
 ArquivoMDB := ExtractFilePath(Application.ExeName) + 'DB\Locadora.mdb';
 dbLocadora.Close;
 DB   := CreateOLEObject('DAO.DBEngine.36');
 Temp := ExtractFilePath(ArquivoMDB) + 'Temp.mdb';
 DB.CompactDataBase(ArquivoMDB, Temp);
 DeleteFile(pchar(ArquivoMDB));
 RenameFile(Temp, ArquivoMDB);

 //Backup
 try
  deletefile(pchar(ExtractFilePath(Application.ExeName) + 'DB\Backup' + formatdatetime('ddmmyy', date) + '.bck'));
 finally
  copyfile(pchar(ArquivoMDB), pchar(ExtractFilePath(Application.ExeName) + 'DB\Backup' + formatdatetime('ddmmyy', date) + '.bck'), true);
 end;

 application.CreateForm(tfrmbackup, frmbackup);
 frmbackup.tag := 1;
 frmbackup.close;
end;

procedure TdtmDados.qryPedidoAfterCancel(DataSet: TDataSet);
begin
 if frmpedido <> nil then frmpedido.lblCount.Visible := false;
end;

end.

//Est? ? a senha para entrar no banco da dvdCia. Microsoft Access
//senha osirc2006
