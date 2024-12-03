unit View.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Controller.Connection, Controller.GenericCrud,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.RegisterWrite, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Register.Venda, Register.Item, Vcl.Mask, Vcl.DBCtrls;

type
  TVenda = class(TViewRegisterWrite)
    pcPrincipal: TPageControl;
    tsVenda: TTabSheet;
    tsItem: TTabSheet;
    cdsVenda: TClientDataSet;
    dsVenda: TDataSource;
    grdVenda: TDBGrid;
    dsItem: TDataSource;
    cdsItem: TClientDataSet;
    DBGrid1: TDBGrid;
    edtCodigo: TDBEdit;
    edtValor: TDBEdit;
    edtData: TDBEdit;
    edtCliente: TDBEdit;
    lblCodigo: TLabel;
    lblTotal: TLabel;
    lblVenda: TLabel;
    lblCliente: TLabel;
    edtItemCodigo: TDBEdit;
    edtVlItem: TDBEdit;
    edtQuantidade: TDBEdit;
    edtModelo: TDBEdit;
    lblItemCodigo: TLabel;
    lblVlItem: TLabel;
    lblQuantidade: TLabel;
    lblModelo: TLabel;
    btnInserirVenda: TButton;
    procedure FormShow(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure btnInserirVendaClick(Sender: TObject);
  private
    procedure CarregarGrid;
  public
    class function ShowForm: Boolean;
  protected
    procedure InserirRegistro; override;
    procedure ExcluirRegistro; override;
    procedure EditarRegistro; override;
  end;

var
  Venda: TVenda;

implementation

uses
  System.Generics.Collections;

{$R *.dfm}
{ TVenda }

procedure TVenda.btnInserirVendaClick(Sender: TObject);
const
  cSQL =
    ' INSERT INTO VENDA (ID_VENDA, VL_TOTAL, DATA_VENDA, ID_CLIENTE) ' +
    ' VALUES (%d, %s, %s, %d)';

  cSQLItem =
    ' INSERT INTO ITEM (ID_ITEM, ID_VENDA, VL_ITEM, QUANTIDADE, ID_MODELO) ' +
    ' VALUES (%d, %d, %s, %d, %d)';
var
  vString:string;
begin
  inherited;
  TConnection.New
    .InserirDadosBD(Format(cSQL, [200, '100000', QuotedStr('2024-01-01'), 100]))
    .InserirDadosBD(Format(cSQL, [201, '120000', QuotedStr('2024-01-01'), 101]))
    .InserirDadosBD(Format(cSQL, [202, '130000', QuotedStr('2024-01-01'), 102]))
    .InserirDadosBD(Format(cSQL, [203, '140000', QuotedStr('2024-01-01'), 103]))
    .InserirDadosBD(Format(cSQL, [204, '150000', QuotedStr('2024-01-01'), 104]))
    .InserirDadosBD(Format(cSQLItem, [200, 200, '100000', 1, 100]))
    .InserirDadosBD(Format(cSQLItem, [201, 201, '120000', 1, 101]))
    .InserirDadosBD(Format(cSQLItem, [202, 202, '130000', 1, 102]))
    .InserirDadosBD(Format(cSQLItem, [203, 203, '140000', 1, 103]))
    .InserirDadosBD(Format(cSQLItem, [204, 204, '150000', 1, 104]));

  CarregarGrid;
end;

procedure TVenda.CarregarGrid;
var
  vVendaGeneric: TControllerGenericCrud<TRegisterVenda>;
  vVenda: TRegisterVenda;
  vVendas: TObjectList<TRegisterVenda>;

  vItemGeneric: TControllerGenericCrud<TRegisterItem>;
  vItem: TRegisterItem;
  vItens: TObjectList<TRegisterItem>;
begin
  if pcPrincipal.ActivePage = tsVenda then
  begin
    vVendaGeneric := TControllerGenericCrud<TRegisterVenda>.Create
      (TConnection.New.SetConnection, 'VENDA');

    vVendas := TObjectList<TRegisterVenda>.Create;
    try
      vVendas := vVendaGeneric.ListarTodos;

      cdsVenda.Close;
      cdsVenda.FieldDefs.Clear;
      cdsVenda.FieldDefs.Add('ID_VENDA', ftInteger);
      cdsVenda.FieldDefs.Add('VL_TOTAL', ftFloat);
      cdsVenda.FieldDefs.Add('DATA_VENDA', ftDateTime);
      cdsVenda.FieldDefs.Add('ID_CLIENTE', ftInteger);
      cdsVenda.CreateDataSet;

      for vVenda in vVendas do
      begin
        cdsVenda.Append;
        cdsVenda.FieldByName('ID_VENDA').AsInteger := vVenda.ID_VENDA;
        cdsVenda.FieldByName('VL_TOTAL').AsFloat := vVenda.VL_TOTAL;
        cdsVenda.FieldByName('DATA_VENDA').AsDateTime := vVenda.DATA_VENDA;
        cdsVenda.FieldByName('ID_CLIENTE').AsInteger := vVenda.ID_CLIENTE;
        cdsVenda.Post;
      end;

      cdsVenda.First;
    finally
      vVendas.Free;
      vVendaGeneric.Free;
    end;
  end
  else if pcPrincipal.ActivePage = tsItem then
  begin
    vItemGeneric := TControllerGenericCrud<TRegisterItem>.Create
      (TConnection.New.SetConnection, 'ITEM');

    vItens := TObjectList<TRegisterItem>.Create;
    try
      vItens := vItemGeneric.ListarTodos;

      cdsItem.Close;
      cdsItem.FieldDefs.Clear;
      cdsItem.FieldDefs.Add('ID_ITEM', ftInteger);
      cdsItem.FieldDefs.Add('ID_VENDA', ftInteger);
      cdsItem.FieldDefs.Add('VL_ITEM', ftFloat);
      cdsItem.FieldDefs.Add('QUANTIDADE', ftInteger);
      cdsItem.FieldDefs.Add('ID_MODELO', ftInteger);
      cdsItem.CreateDataSet;

      for vItem in vItens do
      begin
        if vItem.ID_VENDA = StrToInt(edtCodigo.Text) then
        begin
          cdsItem.Append;
          cdsItem.FieldByName('ID_ITEM').AsInteger := vItem.ID_ITEM;
          cdsItem.FieldByName('ID_VENDA').AsInteger := vItem.ID_VENDA;
          cdsItem.FieldByName('VL_ITEM').AsFloat := vItem.VL_ITEM;
          cdsItem.FieldByName('QUANTIDADE').AsInteger := vItem.QUANTIDADE;
          cdsItem.FieldByName('ID_MODELO').AsInteger := vItem.ID_MODELO;
          cdsItem.Post;
        end;
      end;

      cdsItem.First;
    finally
      vItens.Free;
      vItemGeneric.Free;
    end;
  end;
end;

procedure TVenda.EditarRegistro;
var
  vVendaGeneric: TControllerGenericCrud<TRegisterVenda>;
  vVenda: TRegisterVenda;

  vItemGeneric: TControllerGenericCrud<TRegisterItem>;
  vItem: TRegisterItem;
begin
  inherited;
  if pcPrincipal.ActivePage = tsVenda then
  begin
    vVendaGeneric := TControllerGenericCrud<TRegisterVenda>.Create
      (TConnection.New.SetConnection, 'VENDA');

    vVenda := TRegisterVenda.Create;
    try
      vVenda.ID_VENDA := StrToInt(edtCodigo.Text);
      vVenda.VL_TOTAL := StrToFloat(edtValor.Text);
      vVenda.DATA_VENDA := StrToDate(edtData.Text);
      vVenda.ID_CLIENTE := StrToInt(edtCliente.Text);
      vVendaGeneric.Update(vVenda);

      CarregarGrid;
    finally
      vVenda.Free;
      vVendaGeneric.Free;
    end;
  end
  else if pcPrincipal.ActivePage = tsItem then
  begin
    vItemGeneric := TControllerGenericCrud<TRegisterItem>.Create
      (TConnection.New.SetConnection, 'ITEM');
    try
      vItem := TRegisterItem.Create;
      try
        vItem.ID_ITEM := StrToInt(edtItemCodigo.Text);
        vItem.ID_VENDA := StrToInt(edtCodigo.Text);
        vItem.VL_ITEM := StrToFloat(edtVlItem.Text);
        vItem.QUANTIDADE := StrToInt(edtQuantidade.Text);
        vItem.ID_MODELO := StrToInt(edtModelo.Text);
        vItemGeneric.Update(vItem);
      finally
        vItem.Free;
      end;
    finally
      vItemGeneric.Free;
    end;
  end;
end;

procedure TVenda.ExcluirRegistro;
var
  vVendaGeneric: TControllerGenericCrud<TRegisterVenda>;
  vVenda: TRegisterVenda;

  vItemGeneric: TControllerGenericCrud<TRegisterItem>;
  vItem: TRegisterItem;
begin
  inherited;
  if pcPrincipal.ActivePage = tsVenda then
  begin
    vVendaGeneric := TControllerGenericCrud<TRegisterVenda>.Create
      (TConnection.New.SetConnection, 'VENDA');

    vVenda := TRegisterVenda.Create;
    try
      vVenda.ID_VENDA := StrToInt(edtCodigo.Text);
      vVenda.VL_TOTAL := StrToFloat(edtValor.Text);
      vVenda.DATA_VENDA := StrToDate(edtData.Text);
      vVenda.ID_CLIENTE := StrToInt(edtCliente.Text);
      vVendaGeneric.Delete(vVenda);
    finally
      vVenda.Free;
      vVendaGeneric.Free;
    end;
  end
  else if pcPrincipal.ActivePage = tsItem then
  begin
    vItemGeneric := TControllerGenericCrud<TRegisterItem>.Create
      (TConnection.New.SetConnection, 'ITEM');
    try
      vItem := TRegisterItem.Create;
      try
        vItem.ID_ITEM := StrToInt(edtItemCodigo.Text);
        vItem.ID_VENDA := StrToInt(edtCodigo.Text);
        vItem.VL_ITEM := StrToFloat(edtVlItem.Text);
        vItem.QUANTIDADE := StrToInt(edtQuantidade.Text);
        vItem.ID_MODELO := StrToInt(edtModelo.Text);
        vItemGeneric.Delete(vItem);
      finally
        vItem.Free;
      end;
    finally
      vItemGeneric.Free;
    end;
  end;

  CarregarGrid;
end;

procedure TVenda.FormShow(Sender: TObject);
begin
  inherited;
  CarregarGrid;
end;

procedure TVenda.InserirRegistro;
var
  vVendaGeneric: TControllerGenericCrud<TRegisterVenda>;
  vVenda: TRegisterVenda;

  vItemGeneric: TControllerGenericCrud<TRegisterItem>;
  vItem: TRegisterItem;
begin
  inherited;
  if pcPrincipal.ActivePage = tsVenda then
  begin
    vVendaGeneric := TControllerGenericCrud<TRegisterVenda>.Create
      (TConnection.New.SetConnection, 'VENDA');
    try
      vVenda := TRegisterVenda.Create;
      try
        vVenda.ID_VENDA := StrToInt(edtCodigo.Text);
        vVenda.VL_TOTAL := StrToFloat(edtValor.Text);
        vVenda.DATA_VENDA := StrToDate(edtData.Text);
        vVenda.ID_CLIENTE := StrToInt(edtCliente.Text);
        vVendaGeneric.Insert(vVenda);
      finally
        vVenda.Free;
      end;
    finally
      vVendaGeneric.Free;
    end;
  end
  else if pcPrincipal.ActivePage = tsItem then
  begin
    vItemGeneric := TControllerGenericCrud<TRegisterItem>.Create
      (TConnection.New.SetConnection, 'ITEM');
    try
      vItem := TRegisterItem.Create;
      try
        vItem.ID_ITEM := StrToInt(edtItemCodigo.Text);
        vItem.ID_VENDA := StrToInt(edtCodigo.Text);
        vItem.VL_ITEM := StrToFloat(edtVlItem.Text);
        vItem.QUANTIDADE := StrToInt(edtQuantidade.Text);
        vItem.ID_MODELO := StrToInt(edtModelo.Text);
        vItemGeneric.Insert(vItem);
      finally
        vItem.Free;
      end;
    finally
      vItemGeneric.Free;
    end;
  end;

  CarregarGrid;
end;

procedure TVenda.pcPrincipalChange(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tsItem then
    CarregarGrid;
end;

class function TVenda.ShowForm: Boolean;
var
  vForm: TVenda;
begin
  Result := False;
  vForm := TVenda.Create(Application);
  try
    if vForm.ShowModal = mrOk then
      Result := True;
  finally
    vForm.Free;
  end;
end;

end.
