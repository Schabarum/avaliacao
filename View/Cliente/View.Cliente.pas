unit View.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Controller.Connection, Controller.GenericCrud,
  Register.Cliente,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.RegisterWrite, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Mask,
  Vcl.DBCtrls;

type
  TCliente = class(TViewRegisterWrite)
    grdCliente: TDBGrid;
    dsCliente: TDataSource;
    cdsCliente: TClientDataSet;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    edtCPF: TDBEdit;
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblCPF: TLabel;
    btnClientes: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
  private
    procedure CarregarGrid;
  public
    class function ShowForm: Boolean;
  protected
    procedure InserirRegistro; override;
    procedure EditarRegistro; override;
    procedure ExcluirRegistro; override;
  end;

var
  Cliente: TCliente;

implementation

uses
  System.Generics.Collections;

{$R *.dfm}
{ TCliente }

procedure TCliente.btnClientesClick(Sender: TObject);
const
  cSQL = 'INSERT INTO CLIENTE (ID_CLIENTE, NOME, CPF) VALUES (%0:d, %1:s, %2:s)';
begin
  inherited;
  TConnection.New
    .InserirDadosBD(Format(cSQL, [100, QuotedStr('Jo�o Silva'), QuotedStr('012.345.678-90')]))
    .InserirDadosBD(Format(cSQL, [101, QuotedStr('Maria Oliveira'), QuotedStr('001.234.567-89')]))
    .InserirDadosBD(Format(cSQL, [102, QuotedStr('Carlos Souza'), QuotedStr('023.456.789-01')]))
    .InserirDadosBD(Format(cSQL, [103, QuotedStr('Ana Lima'), QuotedStr('000.123.456-78')]))
    .InserirDadosBD(Format(cSQL, [104, QuotedStr('Paulo Mendes'), QuotedStr('005.678.901-23')]));

  CarregarGrid;
end;

procedure TCliente.CarregarGrid;
var
  vClienteGeneric: TControllerGenericCrud<TRegisterCliente>;
  vCliente: TRegisterCliente;
  vClientes: TObjectList<TRegisterCliente>;
begin
  inherited;
  vClienteGeneric := TControllerGenericCrud<TRegisterCliente>.Create
    (TConnection.New.SetConnection, 'CLIENTE');

  vClientes := TObjectList<TRegisterCliente>.Create;
  try
    vClientes := vClienteGeneric.ListarTodos;

    cdsCliente.Close;
    cdsCliente.FieldDefs.Clear;
    cdsCliente.FieldDefs.Add('ID_CLIENTE', ftInteger);
    cdsCliente.FieldDefs.Add('NOME', ftString, 50);
    cdsCliente.FieldDefs.Add('CPF', ftString, 15);
    cdsCliente.CreateDataSet;

    for vCliente in vClientes do
    begin
      cdsCliente.Append;
      cdsCliente.FieldByName('ID_CLIENTE').AsInteger := vCliente.ID_CLIENTE;
      cdsCliente.FieldByName('NOME').AsString := vCliente.NOME;
      cdsCliente.FieldByName('CPF').AsString := vCliente.CPF;
      cdsCliente.Post;
    end;

    cdsCliente.First;
  finally
    vCliente.Free;
    vClienteGeneric.Free;
  end;
end;

procedure TCliente.EditarRegistro;
var
  vClienteGeneric: TControllerGenericCrud<TRegisterCliente>;
  vCliente: TRegisterCliente;
begin
  inherited;
  vClienteGeneric := TControllerGenericCrud<TRegisterCliente>.Create
    (TConnection.New.SetConnection, 'CLIENTE');

  vCliente := TRegisterCliente.Create;
  try
    vCliente.ID_CLIENTE := StrToInt(edtCodigo.Text);
    vCliente.NOME := edtNome.Text;
    vCliente.CPF := edtCPF.Text;
    vClienteGeneric.Update(vCliente);

    CarregarGrid;
  finally
    vCliente.Free;
    vClienteGeneric.Free;
  end;
end;

procedure TCliente.ExcluirRegistro;
var
  vClienteGeneric: TControllerGenericCrud<TRegisterCliente>;
  vCliente: TRegisterCliente;
begin
  inherited;
  vClienteGeneric := TControllerGenericCrud<TRegisterCliente>.Create
    (TConnection.New.SetConnection, 'CLIENTE');

  vCliente := TRegisterCliente.Create;
  try
    vCliente.ID_CLIENTE := StrToInt(edtCodigo.Text);
    vCliente.NOME := edtNome.Text;
    vCliente.CPF := edtCPF.Text;
    vClienteGeneric.Delete(vCliente);

    CarregarGrid;
  finally
    vCliente.Free;
    vClienteGeneric.Free;
  end;
end;

procedure TCliente.FormShow(Sender: TObject);
begin
  inherited;
  CarregarGrid;
end;

procedure TCliente.InserirRegistro;
var
  vClienteGeneric: TControllerGenericCrud<TRegisterCliente>;
  vCliente: TRegisterCliente;
begin
  inherited;
  vClienteGeneric := TControllerGenericCrud<TRegisterCliente>.Create
    (TConnection.New.SetConnection, 'MODELO');

  vCliente := TRegisterCliente.Create;
  try
    vCliente.ID_CLIENTE := StrToInt(edtCodigo.Text);
    vCliente.NOME := edtNome.Text;
    vCliente.CPF := edtCPF.Text;
    vClienteGeneric.Insert(vCliente);

    CarregarGrid;
  finally
    vCliente.Free;
    vClienteGeneric.Free;
  end;
end;

class function TCliente.ShowForm: Boolean;
var
  vForm: TCliente;
begin
  Result := False;
  vForm := TCliente.Create(Application);
  try
    if vForm.ShowModal = mrOk then
      Result := True;
  finally
    vForm.Free;
  end;
end;

end.