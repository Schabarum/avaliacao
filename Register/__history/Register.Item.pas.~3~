unit Register.Item;

interface

uses
  Controller.GenericCrud;

type
  TRegisterItem = class(TBaseEntity)
  private
    FID_VENDA: Integer;
    FVL_ITEM: Double;
    FID_MODELO: Integer;
    FQUANTIDADE: Integer;
    FID_ITEM: Integer;
    procedure SetID_ITEM(const Value: Integer);
    procedure SetID_MODELO(const Value: Integer);
    procedure SetID_VENDA(const Value: Integer);
    procedure SetQUANTIDADE(const Value: Integer);
    procedure SetVL_ITEM(const Value: Double);
  public
    property ID_ITEM: Integer read FID_ITEM write SetID_ITEM;
    property ID_VENDA: Integer read FID_VENDA write SetID_VENDA;
    property VL_ITEM: Double read FVL_ITEM write SetVL_ITEM;
    property QUANTIDADE: Integer read FQUANTIDADE write SetQUANTIDADE;
    property ID_MODELO: Integer read FID_MODELO write SetID_MODELO;
  end;

implementation

{ TRegisterItem }

procedure TRegisterItem.SetID_ITEM(const Value: Integer);
begin
  FID_ITEM := Value;
end;

procedure TRegisterItem.SetID_MODELO(const Value: Integer);
begin
  FID_MODELO := Value;
end;

procedure TRegisterItem.SetID_VENDA(const Value: Integer);
begin
  FID_VENDA := Value;
end;

procedure TRegisterItem.SetQUANTIDADE(const Value: Integer);
begin
  FQUANTIDADE := Value;
end;

procedure TRegisterItem.SetVL_ITEM(const Value: Double);
begin
  FVL_ITEM := Value;
end;

end.
