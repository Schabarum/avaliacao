unit Controller.Connection;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  IConnection = interface
    ['{1582506A-A1E5-472E-B7D6-71F63F8CF6C6}']
    function SetConnection: TFDConnection;
    function InserirDadosBD(const ASQL: string): IConnection;
  end;

  TConnection = class(TInterfacedObject, IConnection)
  private
    function SetConnection: TFDConnection;
    function InserirDadosBD(const ASQL: string): IConnection;
  public
    class function New: IConnection;
    constructor Create;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, FireDAC.Phys.MySQL;

constructor TConnection.Create;
begin
  inherited Create;
end;

function TConnection.InserirDadosBD(const ASQL: string): IConnection;
var
  vConnection: TFDConnection;
  vQuery: TFDQuery;
begin
  vConnection := TConnection.New.SetConnection;
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := vConnection;
    vQuery.SQL.Text := ASQL;
    try
      vQuery.ExecSQL;
    except
      on E: Exception do
        ShowMessage('Ocorreu um erro na execu��o do Insert: ' + E.Message);
    end;
  finally
    vQuery.Free;
  end;
  Result := Self;
end;

class function TConnection.New: IConnection;
begin
  Result := TConnection.Create;
end;

function TConnection.SetConnection: TFDConnection;
var
  vConnection: TFDConnection;
  vDriverLink: TFDPhysMySQLDriverLink;
begin
  Result := nil;
  vConnection := TFDConnection.Create(nil);
  vConnection.DriverName := 'MySQL';

  vConnection.Params.Clear;
  vConnection.Params.Add('DriverID=MySQL');
  vConnection.Params.Add('Server=localhost');
  vConnection.Params.Add('Port=3306');
  vConnection.Params.Add('Database=questor');
  vConnection.Params.Add('User_Name=root');
  vConnection.Params.Add('Password=1234');
  vConnection.Params.Add('CharacterSet=utf8mb4');
  vConnection.Params.Add('SSLMode=None');
  vConnection.Params.Add('UseSSL=False');

  vDriverLink := TFDPhysMySQLDriverLink.Create(nil);
  vDriverLink.DriverID := 'MySQL';
  vDriverLink.VendorLib := StringReplace(ExtractFilePath(ParamStr(0)),
    '\Projeto\Win32\Debug\', '\libs\libmariadb.dll', [rfReplaceAll]);
  try
    vConnection.Connected := True;
    Result := vConnection;
  except
    on E: Exception do
      ShowMessage('Erro ao instanciar a connection: ' + E.Message);
  end;
end;

end.