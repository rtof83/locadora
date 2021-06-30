program Locadora;

uses
  Forms,
  formPrincipal in 'formPrincipal.pas' {frmPrincipal},
  formDados in 'formDados.pas' {dtmDados: TDataModule},
  formLogin in 'formLogin.pas' {frmLogin},
  formCliente in 'formCliente.pas' {frmCliente},
  formCalendario in 'formCalendario.pas' {frmCalendario},
  formEmail in 'formEmail.pas' {frmEmail},
  formLocalizar in 'formLocalizar.pas' {frmLocalizar},
  formSobre in 'formSobre.pas' {frmSobre},
  formAcervo in 'formAcervo.pas' {frmAcervo},
  formConfig in 'formConfig.pas' {frmConfig},
  formPedido in 'formPedido.pas' {frmPedido},
  formProduto in 'formProduto.pas' {frmProduto},
  formCategoria in 'formCategoria.pas' {frmCategoria},
  formLocadora in 'formLocadora.pas' {frmLocadora},
  formDevolucao in 'formDevolucao.pas' {frmDevolucao},
  formRelVendas in 'formRelVendas.pas' {frmRelVendas},
  formRelCaixa in 'formRelCaixa.pas' {frmRelCaixa},
  unit01 in '..\Componentes\unit01.pas',
  formConfigSys in 'formConfigSys.pas' {frmConfigSys},
  formRelAcervo in 'formRelAcervo.pas' {frmRelAcervo},
  formGenero in 'formGenero.pas' {frmGenero},
  formBackup in 'formBackup.pas' {frmBackup};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'VideoSys 1.2';
  Application.CreateForm(TdtmDados, dtmDados);
  Application.Run;
end.
