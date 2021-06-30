object dtmDados: TdtmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 225
  Top = 111
  Height = 534
  Width = 479
  object dbLocadora: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=R:\Arquivos\Delphi\' +
      'Locadora\DB\Locadora.mdb;Persist Security Info=False'
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 24
  end
  object qryCliente: TADOQuery
    Connection = dbLocadora
    LockType = ltBatchOptimistic
    AfterOpen = qryClienteAfterOpen
    BeforeClose = qryClienteBeforeClose
    AfterInsert = qryClienteAfterInsert
    AfterEdit = qryClienteAfterEdit
    BeforePost = qryClienteBeforePost
    AfterPost = qryClienteAfterPost
    AfterCancel = qryClienteAfterCancel
    BeforeDelete = qryClienteBeforeDelete
    AfterDelete = qryClienteAfterDelete
    Parameters = <>
    SQL.Strings = (
      'select * from cliente')
    Left = 40
    Top = 96
    object qryClienteIdCliente: TAutoIncField
      FieldName = 'IdCliente'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object qryClienteNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryClienteFantasia: TWideStringField
      FieldName = 'Fantasia'
      Size = 50
    end
    object qryClienteInscricao: TDateTimeField
      FieldName = 'Inscricao'
    end
    object qryClienteNascimento: TDateTimeField
      FieldName = 'Nascimento'
      EditMask = '99/99/9999'
    end
    object qryClienteTipoEnd: TWideStringField
      FieldName = 'TipoEnd'
    end
    object qryClienteEndereco: TWideStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object qryClienteComplemento: TWideStringField
      FieldName = 'Complemento'
      Size = 40
    end
    object qryClienteBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qryClienteCEP: TWideStringField
      FieldName = 'CEP'
      EditMask = '99.999-999'
      Size = 10
    end
    object qryClienteCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qryClienteUF: TWideStringField
      Alignment = taCenter
      FieldName = 'UF'
      Size = 2
    end
    object qryClienteTelefone: TWideStringField
      Alignment = taCenter
      FieldName = 'Telefone'
      EditMask = '(99) 9999-9999'
      Size = 14
    end
    object qryClienteCelular: TWideStringField
      Alignment = taCenter
      FieldName = 'Celular'
      EditMask = '(99) 9999-9999'
      Size = 14
    end
    object qryClienteEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object qryClienteObservacao: TMemoField
      FieldName = 'Observacao'
      BlobType = ftMemo
    end
    object qryClienteStatus: TWideStringField
      FieldName = 'Status'
      Size = 7
    end
    object qryClienteCPF: TWideStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99'
      Size = 14
    end
    object qryClienteRG: TWideStringField
      FieldName = 'RG'
      Size = 12
    end
  end
  object qryDepend: TADOQuery
    Connection = dbLocadora
    LockType = ltBatchOptimistic
    AfterInsert = qryDependAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from dependentes')
    Left = 40
    Top = 152
    object qryDependIdCliente: TIntegerField
      FieldName = 'IdCliente'
    end
    object qryDependIdDepend: TAutoIncField
      FieldName = 'IdDepend'
      ReadOnly = True
    end
    object qryDependDependente: TWideStringField
      FieldName = 'Dependente'
      Size = 60
    end
  end
  object qryLocadora: TADOQuery
    Connection = dbLocadora
    AfterOpen = qryLocadoraAfterOpen
    AfterInsert = qryLocadoraAfterInsert
    AfterEdit = qryLocadoraAfterEdit
    AfterPost = qryLocadoraAfterPost
    AfterCancel = qryLocadoraAfterCancel
    Parameters = <>
    SQL.Strings = (
      'select * from Locadora')
    Left = 40
    Top = 208
    object qryLocadoraIdLocadora: TAutoIncField
      Alignment = taCenter
      FieldName = 'IdLocadora'
      ReadOnly = True
      DisplayFormat = '000'
    end
    object qryLocadoraRazao: TWideStringField
      FieldName = 'Razao'
      Size = 60
    end
    object qryLocadoraFantasia: TWideStringField
      FieldName = 'Fantasia'
      Size = 60
    end
    object qryLocadoraCNPJ: TWideStringField
      FieldName = 'CNPJ'
      EditMask = '99.999.999/9999-99'
      Size = 18
    end
    object qryLocadoraEmail: TWideStringField
      FieldName = 'Email'
      Size = 40
    end
    object qryLocadoraTelefone: TWideStringField
      Alignment = taCenter
      FieldName = 'Telefone'
      EditMask = '(99) 9999-9999'
      Size = 14
    end
    object qryLocadoraTipoEnd: TWideStringField
      FieldName = 'TipoEnd'
    end
    object qryLocadoraEndereco: TWideStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object qryLocadoraComplemento: TWideStringField
      FieldName = 'Complemento'
    end
    object qryLocadoraBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qryLocadoraCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qryLocadoraUF: TWideStringField
      Alignment = taCenter
      FieldName = 'UF'
      Size = 2
    end
    object qryLocadoraDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object qryLocadoraCEP: TWideStringField
      Alignment = taCenter
      FieldName = 'CEP'
      EditMask = '99.999-999'
      Size = 10
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    OnDataChange = dsClienteDataChange
    Left = 120
    Top = 96
  end
  object dsDepend: TDataSource
    DataSet = qryDepend
    Left = 120
    Top = 152
  end
  object dsLocadora: TDataSource
    DataSet = qryLocadora
    OnDataChange = dsLocadoraDataChange
    Left = 120
    Top = 208
  end
  object qryAcervo: TADOQuery
    Connection = dbLocadora
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = qryAcervoAfterOpen
    BeforeClose = qryAcervoBeforeClose
    AfterInsert = qryAcervoAfterInsert
    AfterEdit = qryAcervoAfterEdit
    BeforePost = qryAcervoBeforePost
    AfterPost = qryAcervoAfterPost
    AfterCancel = qryAcervoAfterCancel
    AfterScroll = qryAcervoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from Acervo')
    Left = 40
    Top = 264
    object qryAcervoIdAcervo: TAutoIncField
      Alignment = taCenter
      FieldName = 'IdAcervo'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object qryAcervoNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryAcervoTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 40
    end
    object qryAcervoClassificacao: TWideStringField
      FieldName = 'Classificacao'
      Size = 40
    end
    object qryAcervoDuracao: TSmallintField
      Alignment = taCenter
      FieldName = 'Duracao'
      DisplayFormat = '000 minutos'
    end
    object qryAcervoEspecificacoes: TWideStringField
      FieldName = 'Especificacoes'
      Size = 50
    end
    object qryAcervoProdutora: TWideStringField
      FieldName = 'Produtora'
      Size = 50
    end
    object qryAcervoAtores: TMemoField
      FieldName = 'Atores'
      BlobType = ftMemo
    end
    object qryAcervoDiretor: TWideStringField
      FieldName = 'Diretor'
      Size = 50
    end
    object qryAcervoComentario: TMemoField
      FieldName = 'Comentario'
      BlobType = ftMemo
    end
    object qryAcervoAudio: TWideStringField
      FieldName = 'Audio'
      Size = 10
    end
    object qryAcervoLegenda: TWideStringField
      FieldName = 'Legenda'
      Size = 10
    end
    object qryAcervoDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object qryAcervoLocado: TSmallintField
      Alignment = taCenter
      FieldName = 'Locado'
      DisplayFormat = '00'
    end
    object qryAcervoAnoLanc: TWideStringField
      Alignment = taCenter
      FieldName = 'AnoLanc'
      EditMask = '9999'
      Size = 4
    end
    object qryAcervoBarCode: TWideStringField
      FieldName = 'BarCode'
      Size = 60
    end
    object qryAcervoContLoc: TIntegerField
      Alignment = taCenter
      FieldName = 'ContLoc'
      DisplayFormat = '000000'
    end
    object qryAcervoIdCategoria: TIntegerField
      FieldName = 'IdCategoria'
    end
    object qryAcervoImagem: TWideStringField
      FieldName = 'Imagem'
      Size = 255
    end
    object qryAcervoEntrega: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Entrega'
      LookupDataSet = qryCategoria
      LookupKeyFields = 'IdCategoria'
      LookupResultField = 'Entrega'
      KeyFields = 'IdCategoria'
      DisplayFormat = '00 dia(s)'
      Lookup = True
    end
    object qryAcervoValor: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'Valor'
      LookupDataSet = qryCategoria
      LookupKeyFields = 'IdCategoria'
      LookupResultField = 'Preco'
      KeyFields = 'IdCategoria'
      Lookup = True
    end
    object qryAcervoCodigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Codigo'
      DisplayFormat = '000000'
    end
    object qryAcervoQuantidade: TIntegerField
      Alignment = taCenter
      FieldName = 'Quantidade'
      DisplayFormat = '00'
    end
    object qryAcervoIdGenero: TIntegerField
      FieldName = 'IdGenero'
    end
    object qryAcervoGenero: TStringField
      FieldKind = fkLookup
      FieldName = 'Genero'
      LookupDataSet = qryGenero
      LookupKeyFields = 'IdGenero'
      LookupResultField = 'Genero'
      KeyFields = 'IdGenero'
      Lookup = True
    end
  end
  object dsAcervo: TDataSource
    DataSet = qryAcervo
    Left = 120
    Top = 264
  end
  object qryConfig: TADOQuery
    Connection = dbLocadora
    AfterOpen = qryConfigAfterOpen
    AfterInsert = qryConfigAfterInsert
    AfterEdit = qryConfigAfterInsert
    AfterPost = qryConfigAfterPost
    AfterCancel = qryConfigAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from config')
    Left = 224
    Top = 96
    object qryConfigUsuario: TWideStringField
      FieldName = 'Usuario'
      Size = 16
    end
    object qryConfigSenha: TWideStringField
      FieldName = 'Senha'
      Size = 12
    end
  end
  object dsConfig: TDataSource
    DataSet = qryConfig
    Left = 296
    Top = 96
  end
  object dlgDB: TOpenDialog
    DefaultExt = 'mdb'
    Filter = 'Banco MS Access|*.mdb'
    Left = 120
    Top = 24
  end
  object qryPedido: TADOQuery
    Connection = dbLocadora
    LockType = ltBatchOptimistic
    AfterOpen = qryPedidoAfterOpen
    BeforeClose = qryPedidoBeforeClose
    AfterClose = qryPedidoAfterClose
    AfterInsert = qryPedidoAfterInsert
    AfterEdit = qryPedidoAfterEdit
    BeforePost = qryPedidoBeforePost
    AfterPost = qryPedidoAfterPost
    BeforeCancel = qryPedidoBeforeCancel
    AfterCancel = qryPedidoAfterCancel
    BeforeDelete = qryPedidoBeforeDelete
    AfterDelete = qryPedidoAfterDelete
    AfterScroll = qryPedidoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from pedido')
    Left = 224
    Top = 272
    object qryPedidoIdPedido: TAutoIncField
      Alignment = taCenter
      FieldName = 'IdPedido'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object qryPedidoIdCliente: TIntegerField
      Alignment = taCenter
      FieldName = 'IdCliente'
      DisplayFormat = '00000'
    end
    object qryPedidoCliente: TWideStringField
      FieldName = 'Cliente'
      Size = 60
    end
    object qryPedidoTotal: TBCDField
      FieldName = 'Total'
      currency = True
      Precision = 19
    end
    object qryPedidoTipoCli: TWideStringField
      FieldName = 'TipoCli'
    end
    object qryPedidoDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
      EditMask = '99/99/9999'
    end
    object qryPedidoEntrega: TDateTimeField
      FieldName = 'Entrega'
      EditMask = '99/99/9999'
    end
    object qryPedidoDevolucao: TDateTimeField
      FieldName = 'Devolucao'
      EditMask = '99/99/9999'
    end
    object qryPedidoMulta: TBCDField
      FieldName = 'Multa'
      currency = True
      Precision = 19
    end
    object qryPedidoPago: TBCDField
      FieldName = 'Pago'
      currency = True
      Precision = 19
    end
    object qryPedidoCliDepend: TStringField
      FieldKind = fkLookup
      FieldName = 'CliDepend'
      LookupDataSet = qryCliente
      LookupKeyFields = 'IdCliente'
      LookupResultField = 'Nome'
      KeyFields = 'IdCliente'
      Lookup = True
    end
  end
  object dsPedido: TDataSource
    DataSet = qryPedido
    OnDataChange = dsPedidoDataChange
    Left = 296
    Top = 272
  end
  object qryItemPed: TADOQuery
    Connection = dbLocadora
    LockType = ltBatchOptimistic
    AfterInsert = qryItemPedAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from itemped')
    Left = 224
    Top = 328
    object qryItemPedIdItemPed: TAutoIncField
      Alignment = taCenter
      FieldName = 'IdItemPed'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object qryItemPedIdPedido: TIntegerField
      FieldName = 'IdPedido'
      DisplayFormat = '000000'
    end
    object qryItemPedIdItem: TIntegerField
      FieldName = 'IdItem'
      DisplayFormat = '000000'
    end
    object qryItemPedDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object qryItemPedQuantidade: TSmallintField
      Alignment = taCenter
      FieldName = 'Quantidade'
      DisplayFormat = '00'
    end
    object qryItemPedSubTotal: TBCDField
      FieldName = 'SubTotal'
      currency = True
      Precision = 19
    end
    object qryItemPedTipo: TWideStringField
      FieldName = 'Tipo'
    end
    object qryItemPedQuantAcervo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'QuantAcervo'
      LookupDataSet = qryAcervo
      LookupKeyFields = 'IdAcervo'
      LookupResultField = 'Quantidade'
      KeyFields = 'IdItem'
      DisplayFormat = '0000'
      Lookup = True
    end
    object qryItemPedQuantProd: TIntegerField
      FieldKind = fkLookup
      FieldName = 'QuantProd'
      LookupDataSet = qryProduto
      LookupKeyFields = 'IdProduto'
      LookupResultField = 'Quantidade'
      KeyFields = 'IdItem'
      DisplayFormat = '0000'
      Lookup = True
    end
    object qryItemPedDevolvido: TWideStringField
      FieldName = 'Devolvido'
      Size = 1
    end
    object qryItemPedAberto: TWideStringField
      FieldName = 'Aberto'
      Size = 1
    end
  end
  object dsItemPed: TDataSource
    DataSet = qryItemPed
    OnDataChange = dsItemPedDataChange
    Left = 296
    Top = 328
  end
  object qryBusca: TADOQuery
    Connection = dbLocadora
    Parameters = <>
    Left = 224
    Top = 392
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 120
    Top = 320
  end
  object qryProduto: TADOQuery
    Connection = dbLocadora
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = qryProdutoAfterOpen
    AfterInsert = qryProdutoAfterInsert
    AfterEdit = qryProdutoAfterEdit
    AfterPost = qryProdutoAfterPost
    AfterCancel = qryProdutoAfterCancel
    AfterDelete = qryProdutoAfterDelete
    AfterScroll = qryProdutoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from Produto')
    Left = 40
    Top = 320
    object qryProdutoIdProduto: TAutoIncField
      FieldName = 'IdProduto'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object qryProdutoProduto: TWideStringField
      FieldName = 'Produto'
      Size = 60
    end
    object qryProdutoPreco: TBCDField
      FieldName = 'Preco'
      currency = True
      Precision = 19
    end
    object qryProdutoBarCode: TWideStringField
      FieldName = 'BarCode'
      Size = 60
    end
    object qryProdutoDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
      EditMask = '99/99/9999'
    end
    object qryProdutoImagem: TWideStringField
      FieldName = 'Imagem'
      Size = 255
    end
    object qryProdutoQuantidade: TIntegerField
      Alignment = taCenter
      FieldName = 'Quantidade'
      DisplayFormat = '0000'
    end
  end
  object rdsLocadora: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryLocadora
    Left = 392
    Top = 24
  end
  object rdsAcervo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryAcervo
    Left = 392
    Top = 72
  end
  object rdsCliente: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryCliente
    Left = 392
    Top = 120
  end
  object rdsPedido: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryPedido
    Left = 392
    Top = 168
  end
  object rdsItemPed: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryItemPed
    Left = 392
    Top = 216
  end
  object qryCategoria: TADOQuery
    Connection = dbLocadora
    CursorType = ctStatic
    AfterOpen = qryCategoriaAfterOpen
    AfterInsert = qryCategoriaAfterInsert
    AfterEdit = qryCategoriaAfterEdit
    AfterPost = qryCategoriaAfterPost
    AfterCancel = qryCategoriaAfterCancel
    Parameters = <>
    SQL.Strings = (
      'select * from categoria')
    Left = 40
    Top = 376
    object qryCategoriaIdCategoria: TAutoIncField
      FieldName = 'IdCategoria'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object qryCategoriaCategoria: TWideStringField
      FieldName = 'Categoria'
      Size = 50
    end
    object qryCategoriaPreco: TBCDField
      FieldName = 'Preco'
      currency = True
      Precision = 19
    end
    object qryCategoriaDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
      EditMask = '99/99/9999'
    end
    object qryCategoriaEntrega: TSmallintField
      Alignment = taCenter
      FieldName = 'Entrega'
      DisplayFormat = '00 dia(s)'
    end
  end
  object dsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 120
    Top = 376
  end
  object rdsConfig: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryConfig
    Left = 392
    Top = 264
  end
  object rdsProduto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryProduto
    Left = 392
    Top = 312
  end
  object rdsDepend: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryDepend
    Left = 392
    Top = 360
  end
  object dsConfigSys: TDataSource
    DataSet = qryConfigSys
    Left = 296
    Top = 152
  end
  object qryConfigSys: TADOQuery
    Connection = dbLocadora
    AfterOpen = qryConfigSysAfterOpen
    AfterInsert = qryConfigSysAfterInsert
    AfterEdit = qryConfigSysAfterInsert
    AfterPost = qryConfigSysAfterPost
    AfterCancel = qryConfigSysAfterPost
    Parameters = <>
    SQL.Strings = (
      'select * from configsys')
    Left = 224
    Top = 152
    object qryConfigSysUsuario: TWideStringField
      FieldName = 'Usuario'
    end
    object qryConfigSysSenha: TWideStringField
      FieldName = 'Senha'
    end
    object qryConfigSysHost: TWideStringField
      FieldName = 'Host'
      Size = 50
    end
  end
  object rdsBusca: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qryCaixaProd
    Left = 296
    Top = 24
  end
  object qryCaixaProd: TADOQuery
    Connection = dbLocadora
    Parameters = <>
    Left = 224
    Top = 24
    object qryCaixaProdDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object qryCaixaProdQuantidade: TIntegerField
      FieldName = 'Quantidade'
      DisplayFormat = '00000'
    end
    object qryCaixaProdSubTotal: TBCDField
      FieldName = 'SubTotal'
      currency = True
      Precision = 19
    end
    object qryCaixaProdIdItem: TIntegerField
      FieldName = 'IdItem'
      DisplayFormat = '00000'
    end
    object qryCaixaProdEstoque: TIntegerField
      FieldName = 'Estoque'
      DisplayFormat = '00000'
    end
  end
  object qryGenero: TADOQuery
    Connection = dbLocadora
    CursorType = ctStatic
    AfterOpen = qryGeneroAfterOpen
    AfterInsert = qryGeneroAfterInsert
    AfterEdit = qryGeneroAfterEdit
    AfterPost = qryGeneroAfterPost
    AfterCancel = qryGeneroAfterCancel
    Parameters = <>
    SQL.Strings = (
      'select * from genero')
    Left = 40
    Top = 432
    object qryGeneroIdGenero: TAutoIncField
      FieldName = 'IdGenero'
      ReadOnly = True
      DisplayFormat = '000'
    end
    object qryGeneroGenero: TWideStringField
      FieldName = 'Genero'
      Size = 30
    end
    object qryGeneroDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
  end
  object dsGenero: TDataSource
    DataSet = qryGenero
    Left = 120
    Top = 432
  end
end
