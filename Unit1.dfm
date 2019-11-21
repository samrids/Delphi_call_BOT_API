object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Delphi Get BOT API'
  ClientHeight = 656
  ClientWidth = 991
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 68
    Height = 13
    Caption = 'Interest date:'
  end
  object Memo1: TMemo
    Left = 200
    Top = 8
    Width = 783
    Height = 273
    TabOrder = 0
  end
  object Button1: TButton
    Left = 31
    Top = 66
    Width = 163
    Height = 25
    Caption = 'Get EXCHAGE RATE'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 200
    Top = 296
    Width = 777
    Height = 352
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 39
    Width = 186
    Height = 21
    Date = 43790.000000000000000000
    Time = 0.667525914352154400
    TabOrder = 3
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 
      'https://apigw1.bot.or.th/bot/public/Stat-ReferenceRate/v2/DAILY_' +
      'REF_RATE/?start_period=2019-11-20&end_period=2019-11-20'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 72
    Top = 112
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Name = 'Accept'
        Value = 'application/json'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'x-ibm-client-id'
      end>
    Response = RestResponse1
    SynchronizedEvents = False
    Left = 64
    Top = 184
  end
  object RestResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 72
    Top = 256
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <
      item
        Name = 'result'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 72
    Top = 424
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RestResponse1
    Left = 72
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 72
    Top = 488
  end
end
