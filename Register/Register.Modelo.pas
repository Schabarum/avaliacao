unit Register.Modelo;

interface

uses
  Controller.GenericCrud;

type
  TRegisterModelo = class(TBaseEntity)
  private
    FID_MODELO: Integer;
    FDESCRICAO: string;
    FLANCAMENTO: TDateTime;
    FID_MARCA: Integer;
    procedure SetID_MODELO(const Value: Integer);
    procedure SetDESCRICAO(const Value: string);
    procedure SetLANCAMENTO(const Value: TDateTime);
    procedure SetID_MARCA(const Value: Integer);

  public
    property ID_MODELO: Integer read FID_MODELO write SetID_MODELO;
    property DESCRICAO: string read FDESCRICAO write SetDESCRICAO;
    property LANCAMENTO: TDateTime read FLANCAMENTO write SetLANCAMENTO;
    property ID_MARCA: Integer read FID_MARCA write SetID_MARCA;
  end;

implementation

{ TRegisterModelo }

procedure TRegisterModelo.SetDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end;

procedure TRegisterModelo.SetID_MARCA(const Value: Integer);
begin
  FID_MARCA := Value;
end;

procedure TRegisterModelo.SetID_MODELO(const Value: Integer);
begin
  FID_MODELO := Value;
end;

procedure TRegisterModelo.SetLANCAMENTO(const Value: TDateTime);
begin
  FLANCAMENTO := Value;
end;

end.
