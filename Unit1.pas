unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids,
  REST.Response.Adapter, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RestResponse1: TRESTResponse;
    Memo1: TMemo;
    Button1: TButton;
    FDMemTable1: TFDMemTable;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  CLIENT_ID = 'YOU CLIENT ID'; // Your client ID (see with document)

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTClient1.BaseURL :=
    format('https://apigw1.bot.or.th/bot/public/Stat-ReferenceRate/v2/DAILY_' +
    'REF_RATE/?start_period=%s&end_period=%s',
    [formatdatetime('YYYY-MM-DD', DateTimePicker1.Date),
    formatdatetime('YYYY-MM-DD', DateTimePicker1.Date)]);

  RESTRequest1.Params.ParameterByName('x-ibm-client-id').Value := CLIENT_ID;
  try
    RESTRequest1.Execute;
    Memo1.Lines.Add(RestResponse1.Content);
  except
    Memo1.Lines.Add(RestResponse1.Content);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
