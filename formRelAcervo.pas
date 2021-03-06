unit formRelAcervo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DBCtrls;

type
  TfrmRelAcervo = class(TForm)
    TabControl1: TTabControl;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    rdbGeral: TRadioButton;
    rdbEstoque: TRadioButton;
    rdbGenero: TRadioButton;
    btnFechar: TButton;
    btnImprimir: TButton;
    dbcGenero: TComboBox;
    procedure btnFecharClick(Sender: TObject);
    procedure rdbGeneroClick(Sender: TObject);
    procedure rdbGeralClick(Sender: TObject);
    procedure rdbEstoqueClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAcervo: TfrmRelAcervo;

implementation

uses formDados, formPrincipal;

{$R *.dfm}

procedure TfrmRelAcervo.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmRelAcervo.rdbGeneroClick(Sender: TObject);
begin
 dbcGenero.Enabled := true;
 SendMessage(dbcGenero.Handle, CB_SHOWDROPDOWN, 1, 0);
end;

procedure TfrmRelAcervo.rdbGeralClick(Sender: TObject);
begin
 dbcGenero.Enabled := false;
end;

procedure TfrmRelAcervo.rdbEstoqueClick(Sender: TObject);
begin
 dbcGenero.Enabled := false;
end;

procedure TfrmRelAcervo.btnImprimirClick(Sender: TObject);
begin
 dtmdados.qryAcervo.Close;
 dtmdados.qryAcervo.SQL.Clear;
 {***}
 if rdbgeral.Checked   = true then dtmdados.qryAcervo.SQL.Text := 'select * from Acervo order by nome';
 if rdbestoque.Checked = true then dtmdados.qryAcervo.SQL.Text := 'select * from Acervo where quantidade > 0 order by nome, quantidade desc';
 if rdbgenero.checked  = true then dtmdados.qryAcervo.SQL.Text := 'select Acervo.* from Genero INNER JOIN Acervo ON Genero.IdGenero = Acervo.IdGenero WHERE Genero.Genero = ''' + dbcgenero.Text + '''';
 {***}
 dtmdados.qryAcervo.Open;

 if dtmdados.qryacervo.RecordCount > 0 then
 begin
   frmprincipal.rvplocadora.ProjectFile := ExtractFilePath(Application.ExeName) + '\Relatorios\relacervo.rav';
   if rdbgeral.Checked   = true then frmprincipal.rvpLocadora.SetParam('Tipo', 'Geral');
   if rdbestoque.Checked = true then frmprincipal.rvpLocadora.SetParam('Tipo', 'Dispon?vel em Estoque');
   if rdbgenero.checked  = true then frmprincipal.rvpLocadora.SetParam('Tipo', 'G?nero');
   frmprincipal.rvplocadora.Execute;
   frmprincipal.rvplocadora.close;
 end
 else
  application.messagebox('Nenhum registro encontrado.', 'Mensagem', mb_ok + mb_iconinformation);

 dtmdados.qryAcervo.Close;
 dtmdados.qryAcervo.SQL.Clear;
 dtmdados.qryAcervo.SQL.Text := 'select * from acervo';
end;

procedure TfrmRelAcervo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 case key of
  38: SelectNext(ActiveControl,False,True);
  40: SelectNext(ActiveControl,True,True);
  13: SelectNext(ActiveControl,True,True);
  27: close;
 end;
end;

procedure TfrmRelAcervo.FormShow(Sender: TObject);
begin
 dtmdados.qryGenero.Open;
  repeat
   dbcgenero.Items.Add(dtmdados.qryGeneroGenero.AsString);
   dtmdados.qryGenero.Next;
  until dtmdados.qryGenero.Eof;
 dtmdados.qryGenero.Close;
end;

end.
