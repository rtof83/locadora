unit formPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Menus,
  Dialogs, ComCtrls, RpRave, RpBase, RpSystem, RpDefine, RpRender, Buttons, DB, ADODB,
  RpRenderPDF, ExtCtrls, AppEvnts, ImgList, ToolWin, DBTables, DBCtrls, StdCtrls, pngimage;

type
  TfrmPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    mnuArquivo: TMenuItem;
    mnuCliente: TMenuItem;
    mnuAcervo: TMenuItem;
    mnuPedido: TMenuItem;
    N2: TMenuItem;
    mnuSair: TMenuItem;
    mnuUtilitario: TMenuItem;
    mnuCalendario: TMenuItem;
    mnuImpressao: TMenuItem;
    mnuEmail: TMenuItem;
    mnuConfigSys: TMenuItem;
    mnuRelatorio: TMenuItem;
    mnuRelLocados: TMenuItem;
    mnuRelPendencias: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuSobre: TMenuItem;
    ImgMenu: TImageList;
    AppEventos: TApplicationEvents;
    Timer: TTimer;
    ImageListDisabled: TImageList;
    ImageListEnabled: TImageList;
    PrinterConfig: TPrinterSetupDialog;
    StbPadrao: TStatusBar;
    coolbarFerramentas: TCoolBar;
    ToolBar: TToolBar;
    btnCliente: TToolButton;
    btnAcervo: TToolButton;
    btnPedido: TToolButton;
    btnProduto: TToolButton;
    btnDevolucao: TToolButton;
    ToolButton1: TToolButton;
    btnSair: TToolButton;
    ToolBarMenu: TToolBar;
    coolbarCadastro: TCoolBar;
    ToolBar1: TToolBar;
    toolbtnInserir: TToolButton;
    toolbtnAlterar: TToolButton;
    toolbtnExcluir: TToolButton;
    ToolBar2: TToolBar;
    toolbtnConfirmar: TToolButton;
    toolbtnCancelar: TToolButton;
    ToolBar3: TToolBar;
    toolbtnFirst: TToolButton;
    toolbtnPrior: TToolButton;
    toolbtnNext: TToolButton;
    toolbtnLast: TToolButton;
    ToolBar4: TToolBar;
    toolbtnLocalizar: TToolButton;
    mnuLocadora: TMenuItem;
    mnuProduto: TMenuItem;
    rvpLocadora: TRvProject;
    rvsLocadora: TRvSystem;
    mnuCategoria: TMenuItem;
    mnuDevolucao: TMenuItem;
    mnuRelCliente: TMenuItem;
    mnuRelAcervo: TMenuItem;
    mnuRelProduto: TMenuItem;
    toolbtnImprimir: TToolButton;
    mnuPeriodoPed: TMenuItem;
    RvRenderPDF1: TRvRenderPDF;
    mnuCaixa: TMenuItem;
    mnuUsuario: TMenuItem;
    N1: TMenuItem;
    mnuBackup: TMenuItem;
    mnuGenero: TMenuItem;

    //Procedures declaradas
    procedure Controles(Insercao: boolean; Confirmacao: boolean);
    procedure AtivaForm(Botoes: boolean; BarCadastro: boolean);
    //Procedures declaradas

    //Fun??es
    Function Val_Data(Data: String): String;
    //Fun??es
    
    procedure TimerTimer(Sender: TObject);
    procedure mnuSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AppEventosHint(Sender: TObject);
    procedure mnuImpressaoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure toolbtnInserirClick(Sender: TObject);
    procedure toolbtnAlterarClick(Sender: TObject);
    procedure toolbtnExcluirClick(Sender: TObject);
    procedure toolbtnConfirmarClick(Sender: TObject);
    procedure toolbtnCancelarClick(Sender: TObject);
    procedure toolbtnFirstClick(Sender: TObject);
    procedure toolbtnNextClick(Sender: TObject);
    procedure toolbtnPriorClick(Sender: TObject);
    procedure toolbtnLastClick(Sender: TObject);
    procedure mnuCalendarioClick(Sender: TObject);
    procedure toolbtnLocalizarClick(Sender: TObject);
    procedure btnAcervoClick(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure mnuPedidoClick(Sender: TObject);
    procedure mnuAcervoClick(Sender: TObject);
    procedure mnuClienteClick(Sender: TObject);
    procedure mnuConfigSysClick(Sender: TObject);
    procedure mnuSobreClick(Sender: TObject);
    procedure mnuLocadoraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuProdutoClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure mnuEmailClick(Sender: TObject);
    procedure mnuRelLocadosClick(Sender: TObject);
    procedure mnuRelPendenciasClick(Sender: TObject);
    procedure mnuCategoriaClick(Sender: TObject);
    procedure btnDevolucaoClick(Sender: TObject);
    procedure mnuDevolucaoClick(Sender: TObject);
    procedure toolbtnImprimirClick(Sender: TObject);
    procedure mnuPeriodoPedClick(Sender: TObject);
    procedure mnuRelProdutoClick(Sender: TObject);
    procedure mnuRelAcervoClick(Sender: TObject);
    procedure mnuRelClienteClick(Sender: TObject);
    procedure mnuCaixaClick(Sender: TObject);
    procedure mnuUsuarioClick(Sender: TObject);
    procedure mnuGeneroClick(Sender: TObject);
    procedure mnuBackupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dsForm : TForm;
    dsTable: TADOQuery;
    Campo1, Campo2, Campo3, Tabela, Instrucao: string;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses formCliente, formCalendario, formLocalizar, formAcervo, formPedido,
  formConfig, formSobre, formLocadora, formDados, formProduto, formEmail,
  formCategoria, formDevolucao, formRelVendas, formRelCaixa, formConfigSys,
  formRelAcervo, formGenero, formBackup;

{$R *.dfm}

//Procedures declaradas
procedure tfrmprincipal.controles(Insercao: boolean; Confirmacao: boolean);
var I: integer;
begin
 toolbtninserir.enabled   := insercao;
 toolbtnexcluir.enabled   := insercao;
 toolbtnalterar.enabled   := insercao;
 toolbtnlocalizar.enabled := insercao;
 toolbtnimprimir.enabled  := insercao;
 toolbtnconfirmar.enabled := confirmacao;
 toolbtncancelar.enabled  := confirmacao;
 {***}
 toolbtnfirst.enabled     := insercao;
 toolbtnprior.enabled     := insercao;
 toolbtnnext.enabled      := insercao;
 toolbtnlast.enabled      := insercao;
 {***}
 I := dsform.ComponentCount - 1;
 repeat
  if dsform.components[I].classname = 'TPanel' then
   TPanel(dsform.FindComponent(dsform.components[I].name)).Enabled       := Confirmacao;
  if dsform.components[I].classname = 'TSpeedButton' then
   TSpeedButton(dsform.FindComponent(dsform.components[I].name)).Enabled := Confirmacao;
  I := I - 1;
 until I = 0;
end;

procedure tfrmprincipal.ativaform(Botoes: boolean; BarCadastro: boolean);
begin
 btncliente.enabled       := Botoes;
 mnucliente.enabled       := Botoes;
 btnacervo.enabled        := Botoes;
 mnuacervo.enabled        := Botoes;
 btnproduto.enabled       := Botoes;
 mnuproduto.enabled       := Botoes;
 btndevolucao.enabled     := Botoes;
 mnudevolucao.enabled     := Botoes;
 btnpedido.enabled        := Botoes;
 mnupedido.enabled        := Botoes;
 mnucategoria.enabled     := Botoes;
 mnugenero.enabled        := Botoes;
 mnuusuario.enabled       := Botoes;
 mnuconfigsys.enabled     := Botoes;
 mnulocadora.enabled      := Botoes;

 coolbarcadastro.visible  := BarCadastro;

 toolbtnexcluir.enabled   := Botoes;
 toolbtnalterar.enabled   := Botoes;
 toolbtnimprimir.enabled  := Botoes;
 toolbtnconfirmar.enabled := Botoes;
 toolbtncancelar.enabled  := Botoes;
 toolbtnlocalizar.enabled := BarCadastro;
 toolbtnInserir.enabled   := BarCadastro;
 {***}
 toolbtnfirst.enabled     := Botoes;
 toolbtnprior.enabled     := Botoes;
 toolbtnnext.enabled      := Botoes;
 toolbtnlast.enabled      := Botoes;
end;
//Procedures declaradas

//Fun??es
Function tfrmprincipal.Val_Data(Data : String) : String;
Var Ano : Integer;
Begin
 If(Data <> '') Then
   Begin
    If(Copy(Data,7,4) <> '') Then
      Begin
       Ano := StrToInt(TrimLeft(TrimRight(Copy(Data,7,4))));
       If(Ano >= 0) And (Ano <= 9) Then
         Val_Data := Copy(Data,1,6) + '200' + IntToStr(Ano)
       Else If(Ano >= 10) And (Ano <= 69) Then
         Val_Data := Copy(Data,1,6) + '20'  + IntToStr(Ano)
       Else If(Ano >= 70) And (Ano <= 99) Then
         Val_Data := Copy(Data,1,6) + '19' + IntToStr(Ano)
       Else
         Val_Data := Data;
      End
    Else
      Val_Data := '';
   End
 Else
   Val_Data := '';
End;
//Fun??es

procedure TfrmPrincipal.TimerTimer(Sender: TObject);
begin
 stbPadrao.panels[1].text := FormatDateTime('dddd, dd "de" mmmm "de" yyyy',date);
 stbPadrao.panels[2].text := timetostr(time);
end;

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if application.messagebox('Sair do sistema?','Mensagem',mb_yesno + mb_iconquestion) = id_yes then
  action := cafree
 else
  action := canone;
end;

procedure TfrmPrincipal.AppEventosHint(Sender: TObject);
begin
 stbpadrao.panels[0].text := application.hint;
end;

procedure TfrmPrincipal.mnuImpressaoClick(Sender: TObject);
begin
 printerconfig.execute;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
 ativaform(false, true);
 mnurelcliente.enabled := false;
 application.createform(tfrmcliente, frmcliente);
 frmcliente.show;
end;

procedure TfrmPrincipal.toolbtnInserirClick(Sender: TObject);
begin
 if frmpedido <> nil then frmpedido.tag := 2;
 if dstable.State = dsInactive then dstable.Open;
 controles(false,true);
 dstable.append;
 if frmpedido <> nil then frmpedido.tag := 0;
end;

procedure TfrmPrincipal.toolbtnAlterarClick(Sender: TObject);
begin
 controles(false, true);
 dstable.edit;
end;

procedure TfrmPrincipal.toolbtnExcluirClick(Sender: TObject);
begin
 if application.messagebox('Tem certeza que deseja excluir este registro?','Aten??o',mb_yesno + mb_iconwarning) = id_yes then
 begin
   dstable.Delete;
   if dstable.recordcount = 0 then
   begin
     toolbtnexcluir.enabled   := false;
     toolbtnalterar.enabled   := false;
     toolbtnlocalizar.enabled := false;
     toolbtnimprimir.enabled  := false;
   end;
 end;
end;

procedure TfrmPrincipal.toolbtnConfirmarClick(Sender: TObject);
var I: integer;
begin
 I := dsform.ComponentCount - 1;
 repeat
   // Campos Obrigat?rios
   if dsform.components[I].classname = 'TDBEdit' then
   begin
     if (TDBEdit(dsform.FindComponent(dsform.components[I].name)).Tag = 1) and (TDBEdit(dsform.FindComponent(dsform.components[I].name)).Text = '') then
     begin
       application.messagebox('Os Campos obrigat?rios devem ser preenchidos.', 'Aten??o', mb_ok + mb_iconwarning);
       exit;
     end;
   end;
   if dsform.components[I].classname = 'TDBLookupComboBox' then
   begin
     if (TDBLookupComboBox(dsform.FindComponent(dsform.components[I].name)).Tag = 1) and (TDBLookupComboBox(dsform.FindComponent(dsform.components[I].name)).Text = '') then
     begin
       application.messagebox('Os Campos obrigat?rios devem ser preenchidos.', 'Aten??o', mb_ok + mb_iconwarning);
       exit;
     end;
   end;
   I := I - 1;
 until I = 0;

 dstable.post;
 dstable.Close;
 controles(true, false);

 toolbtnexcluir.enabled   := false;
 toolbtnalterar.enabled   := false;
 toolbtnimprimir.enabled  := false;
 toolbtnconfirmar.enabled := false;
 toolbtncancelar.enabled  := false;
 toolbtnlocalizar.enabled := true;
 toolbtnInserir.enabled   := true;
 {***}
 toolbtnfirst.enabled     := false;
 toolbtnprior.enabled     := false;
 toolbtnnext.enabled      := false;
 toolbtnlast.enabled      := false;
end;

procedure TfrmPrincipal.toolbtnCancelarClick(Sender: TObject);
begin
 dstable.cancelupdates;
 dstable.Close;
 controles(true, false);

 toolbtnexcluir.enabled   := false;
 toolbtnalterar.enabled   := false;
 toolbtnimprimir.enabled  := false;
 toolbtnconfirmar.enabled := false;
 toolbtncancelar.enabled  := false;
 toolbtnlocalizar.enabled := true;
 toolbtnInserir.enabled   := true;
 {***}
 toolbtnfirst.enabled     := false;
 toolbtnprior.enabled     := false;
 toolbtnnext.enabled      := false;
 toolbtnlast.enabled      := false;
end;

procedure TfrmPrincipal.toolbtnFirstClick(Sender: TObject);
begin
 dstable.first;
end;

procedure TfrmPrincipal.toolbtnNextClick(Sender: TObject);
begin
 dstable.next;
end;

procedure TfrmPrincipal.toolbtnPriorClick(Sender: TObject);
begin
 dstable.prior;
end;

procedure TfrmPrincipal.toolbtnLastClick(Sender: TObject);
begin
 dstable.last;
end;

procedure TfrmPrincipal.mnuCalendarioClick(Sender: TObject);
begin
 mnucalendario.enabled := false;
 application.createform(tfrmcalendario, frmcalendario);
 frmcalendario.show;
end;

procedure TfrmPrincipal.toolbtnLocalizarClick(Sender: TObject);
begin
 application.createform(tfrmlocalizar, frmlocalizar);
 with frmlocalizar do
 begin
   gridlocalizar.Columns[0].FieldName := campo1;
   gridlocalizar.Columns[1].FieldName := campo2;

   qrylocalizar.sql.text := instrucao + ' order by ' + campo1;
   qrylocalizar.open;

   caption := 'Localizar ' + tabela;
   showmodal;

   if qrylocalizar.recordcount > 0 then
   begin
     if frmdevolucao <> nil then
     begin
       frmdevolucao.edtIdPedido.Text := qrylocalizar.fieldbyname(campo1).asstring;
       frmdevolucao.edtIdPedido.setfocus;
       exit;
     end
     else if dstable.State = dsInactive then
      dstable.Open;

     if dstable = dtmdados.qryacervo then
      dstable.Locate('idacervo', qrylocalizar.fieldbyname('idacervo').asstring, [])
     else if dstable = dtmdados.qryproduto then
      dstable.Locate('idproduto', qrylocalizar.fieldbyname('idproduto').asstring, [])
     else
      dstable.Locate(campo1, qrylocalizar.fieldbyname(campo1).asstring, []);
   end;

   free;
 end;
end;

procedure TfrmPrincipal.btnAcervoClick(Sender: TObject);
begin
 ativaform(false, true);
 mnurelacervo.enabled := false;
 application.createform(tfrmacervo, frmacervo);
 frmacervo.show;
end;

procedure TfrmPrincipal.btnPedidoClick(Sender: TObject);
begin
 ativaform(false, true);
 mnuRelLocados.enabled    := false;
 mnurelpendencias.enabled := false;
 application.createform(tfrmpedido, frmpedido);
 frmpedido.show;
end;

procedure TfrmPrincipal.mnuPedidoClick(Sender: TObject);
begin
 btnPedido.click;
end;

procedure TfrmPrincipal.mnuAcervoClick(Sender: TObject);
begin
 btnacervo.click;
end;

procedure TfrmPrincipal.mnuClienteClick(Sender: TObject);
begin
 btncliente.click;
end;

procedure TfrmPrincipal.mnuConfigSysClick(Sender: TObject);
begin
 ativaform(false, true);
 application.createform(tfrmconfigsys, frmconfigsys);
 frmconfigsys.show;
end;

procedure TfrmPrincipal.mnuSobreClick(Sender: TObject);
begin
 application.createform(tfrmsobre, frmsobre);
 frmsobre.showmodal;
 frmsobre.free;
end;

procedure TfrmPrincipal.mnuLocadoraClick(Sender: TObject);
begin
 ativaform(false, true);
 application.createform(tfrmlocadora, frmlocadora);
 frmlocadora.show;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 frmprincipal.Caption := 'SysVideo 1.2 - ' + dtmdados.qrylocadoraRazao.asstring;
end;

procedure TfrmPrincipal.mnuProdutoClick(Sender: TObject);
begin
 btnproduto.Click;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
 ativaform(false, true);
 mnurelProduto.enabled := false;
 application.createform(tfrmproduto, frmproduto);
 frmproduto.show;
end;

procedure TfrmPrincipal.mnuEmailClick(Sender: TObject);
begin
 mnuemail.enabled := false;
 application.createform(tfrmemail, frmemail);
 frmemail.show;
end;

procedure TfrmPrincipal.mnuRelLocadosClick(Sender: TObject);
begin
 dtmdados.qryAcervo.Close;
 dtmdados.qryAcervo.SQL.Clear;
 dtmdados.qryAcervo.SQL.Text := 'select * from acervo order by contloc desc';
 dtmdados.qryAcervo.Open;

 if dtmdados.qryAcervo.RecordCount > 0 then
 begin
   rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relLocados.rav';
   rvplocadora.Execute;
   rvplocadora.close;
 end
 else
  application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);

 dtmdados.qryAcervo.Close;
 dtmdados.qryAcervo.SQL.Clear;
 dtmdados.qryAcervo.SQL.Text := 'select * from acervo';
end;

procedure TfrmPrincipal.mnuRelPendenciasClick(Sender: TObject);
begin
 dtmdados.qryPedido.Close;
 dtmdados.qryPedido.SQL.Clear;
 dtmdados.qryPedido.SQL.Text := 'select * from pedido where devolucao is null';
 dtmdados.qryPedido.Open;

 if dtmdados.qryPedido.RecordCount > 0 then
 begin
   rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relPendencias.rav';
   rvplocadora.Execute;
   rvplocadora.close;
 end
 else
  application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);

 dtmdados.qryPedido.Close;
 dtmdados.qryPedido.SQL.Clear;
 dtmdados.qryPedido.SQL.Text := 'select * from pedido';
end;

procedure TfrmPrincipal.mnuCategoriaClick(Sender: TObject);
begin
 ativaform(false, true);
 application.createform(tfrmcategoria, frmcategoria);
 frmcategoria.show;
end;

procedure TfrmPrincipal.btnDevolucaoClick(Sender: TObject);
begin
 ativaform(false, false);
 mnuRelLocados.enabled    := false;
 mnurelpendencias.enabled := false;
 application.createform(tfrmdevolucao, frmdevolucao);
 frmdevolucao.show;
end;

procedure TfrmPrincipal.mnuDevolucaoClick(Sender: TObject);
begin
 btndevolucao.Click;
end;

procedure TfrmPrincipal.toolbtnImprimirClick(Sender: TObject);
begin
 if dsform = frmpedido  then frmpedido.imprimir;
 if dsform = frmcliente then frmcliente.imprimir;
end;

procedure TfrmPrincipal.mnuPeriodoPedClick(Sender: TObject);
begin
 application.createform(tfrmrelvendas, frmrelvendas);
 frmrelvendas.showmodal;
 frmrelvendas.free;
end;

procedure TfrmPrincipal.mnuRelProdutoClick(Sender: TObject);
begin
 dtmdados.qryProduto.Close;
 dtmdados.qryProduto.SQL.Clear;
 dtmdados.qryProduto.SQL.Text := 'select * from produto order by produto';
 dtmdados.qryProduto.Open;

 if dtmdados.qryProduto.RecordCount > 0 then
 begin
   rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relproduto.rav';
   rvplocadora.Execute;
   rvplocadora.close;
 end
 else
  application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);

 dtmdados.qryProduto.Close;
 dtmdados.qryProduto.SQL.Clear;
 dtmdados.qryProduto.SQL.Text := 'select * from produto';
end;

procedure TfrmPrincipal.mnuRelAcervoClick(Sender: TObject);
begin
 application.createform(tfrmrelacervo, frmrelacervo);
 frmrelacervo.showmodal;
 frmrelacervo.free;
end;

procedure TfrmPrincipal.mnuRelClienteClick(Sender: TObject);
begin
 dtmdados.qryCliente.Close;
 dtmdados.qryCliente.SQL.Clear;
 dtmdados.qryCliente.SQL.Text := 'select * from cliente order by nome';
 dtmdados.qryCliente.Open;

 if dtmdados.qryCliente.RecordCount > 0 then
 begin
   rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relClientes.rav';
   rvplocadora.Execute;
   rvplocadora.close;
 end
 else
  application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);

 dtmdados.qryCliente.Close;
 dtmdados.qryCliente.SQL.Clear;
 dtmdados.qryCliente.SQL.Text := 'select * from Cliente';
end;

procedure TfrmPrincipal.mnuCaixaClick(Sender: TObject);
begin
 application.createform(tfrmrelcaixa, frmrelcaixa);
 frmrelcaixa.showmodal;
 frmrelcaixa.free;
end;

procedure TfrmPrincipal.mnuUsuarioClick(Sender: TObject);
begin
 ativaform(false, true);
 application.createform(tfrmconfig, frmconfig);
 frmconfig.show;
end;

procedure TfrmPrincipal.mnuGeneroClick(Sender: TObject);
begin
 ativaform(false, true);
 application.createform(tfrmgenero, frmgenero);
 frmgenero.show;
end;

procedure TfrmPrincipal.mnuBackupClick(Sender: TObject);
begin
 application.CreateForm(tfrmbackup, frmbackup);
 frmbackup.ShowModal;
end;

end.
