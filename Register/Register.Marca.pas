unit Register.Marca;

interface

uses
  Controller.GenericCrud;

type
  TRegisterMarca = class(TBaseEntity)
  private
    FID_MARCA: Integer;
    FDESCRICAO: string;
    procedure SetID_MARCA(const Value: Integer);
    procedure SetDESCRICAO(const Value: string);
  public
    property ID_MARCA: Integer read FID_MARCA write SetID_MARCA;
    property DESCRICAO: string read FDESCRICAO write SetDESCRICAO;
  end;

implementation

{ TRegisterMarca }

procedure TRegisterMarca.SetDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end;

procedure TRegisterMarca.SetID_MARCA(const Value: Integer);
begin
  FID_MARCA := Value;
end;

end.