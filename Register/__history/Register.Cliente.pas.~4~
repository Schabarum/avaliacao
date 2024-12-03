unit Register.Cliente;

interface

uses
  Controller.GenericCrud;

type
  TRegisterCliente = class(TBaseEntity)
  private
    FCPF: string;
    FID_CLIENTE: Integer;
    FNOME: string;
    procedure SetCPF(const Value: string);
    procedure SetID_CLIENTE(const Value: Integer);
    procedure SetNOME(const Value: string);
  public
    property ID_CLIENTE: Integer read FID_CLIENTE write SetID_CLIENTE;
    property NOME: string read FNOME write SetNOME;
    property CPF: string read FCPF write SetCPF;
  end;

implementation

{ TRegisterCliente }

procedure TRegisterCliente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TRegisterCliente.SetID_CLIENTE(const Value: Integer);
begin
  FID_CLIENTE := Value;
end;

procedure TRegisterCliente.SetNOME(const Value: string);
begin
  FNOME := Value;
end;

end.
