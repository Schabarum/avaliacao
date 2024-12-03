unit Register.Venda;

interface

uses
  Controller.GenericCrud;

type
  TRegisterVenda = class(TBaseEntity)
  private
    FVL_TOTAL: Double;
    FID_VENDA: Integer;
    FID_CLIENTE: Integer;
    FDATA_VENDA: TDateTime;
    procedure SetID_VENDA(const Value: Integer);
    procedure SetVL_TOTAL(const Value: Double);
    procedure SetDATA_VENDA(const Value: TDateTime);
    procedure SetID_CLIENTE(const Value: Integer);

  public
    property ID_VENDA: Integer read FID_VENDA write SetID_VENDA;
    property VL_TOTAL: Double read FVL_TOTAL write SetVL_TOTAL;
    property DATA_VENDA: TDateTime read FDATA_VENDA write SetDATA_VENDA;
    property ID_CLIENTE: Integer read FID_CLIENTE write SetID_CLIENTE;
  end;

implementation

{ TRegisterVenda }

procedure TRegisterVenda.SetDATA_VENDA(const Value: TDateTime);
begin
  FDATA_VENDA := Value;
end;

procedure TRegisterVenda.SetID_CLIENTE(const Value: Integer);
begin
  FID_CLIENTE := Value;
end;

procedure TRegisterVenda.SetID_VENDA(const Value: Integer);
begin
  FID_VENDA := Value;
end;

procedure TRegisterVenda.SetVL_TOTAL(const Value: Double);
begin
  FVL_TOTAL := Value;
end;

end.
