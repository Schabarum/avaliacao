unit Controller.Fields;

interface

uses
  Vcl.DBGrids;

type
  IControllerFields = interface
    ['{7571EEF3-7FF1-4AFC-BD29-DC318A5E05B3}']
    function SetColumn(AFieldName, ACaption: string; AWidth: Integer)
      : IControllerFields;
  end;

  TControllerFields = class(TInterfacedObject, IControllerFields)
  private
    FGrid: TDBGrid;
    function SetColumn(AFieldName, ACaption: string; AWidth: Integer)
      : IControllerFields;
  public
    class function New(AGrid: TDBGrid): IControllerFields;
    constructor Create(AGrid: TDBGrid);
  end;

implementation

uses
  System.Classes;

{ TControllerFields }

constructor TControllerFields.Create(AGrid: TDBGrid);
begin
  FGrid := AGrid;
  FGrid.Columns.Clear;
  inherited Create;
end;

class function TControllerFields.New(AGrid: TDBGrid): IControllerFields;
begin
  Result := TControllerFields.Create(AGrid);
end;

function TControllerFields.SetColumn(AFieldName, ACaption: string;
  AWidth: Integer): IControllerFields;
var
  vColumn: TColumn;
begin
  vColumn := FGrid.Columns.Add;
  vColumn.FieldName := AFieldName;
  vColumn.Title.Caption := ACaption;
  vColumn.Width := AWidth;
  vColumn.Alignment := taLeftJustify;
  Result := Self;
end;

end.