unit UnitTisaneNLP;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Rtti, FMX.Grid.Style, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Edit, FMX.Memo.Types, FMX.Memo;

type
  TFormTisaneAPI = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Edit1: TEdit;
    StyleBook1: TStyleBook;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTisaneAPI: TFormTisaneAPI;

implementation

{$R *.fmx}

uses
  System.Threading;

procedure TFormTisaneAPI.Button1Click(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      RESTClient2.ResetToDefaults;
      RESTClient2.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient2.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient2.BaseURL := 'https://api.apilayer.com/tisane/detectLanguage';
      RESTClient2.ContentType := 'application/json';

      RESTRequest2.ClearBody;
      RESTRequest2.Params.Clear;

      RESTRequest2.Params.AddItem;
      RESTRequest2.Params.Items[0].Kind := pkHTTPHEADER;
      RESTRequest2.Params.Items[0].Name := 'apikey';
      RESTRequest2.Params.Items[0].Value := '37BHHAMeQCOYhkfR4qtz31b8fCuJE3fV';
      RESTRequest2.Params.Items[0].Options := [poDoNotEncode];

      RESTRequest2.Params.AddItem;
      RESTRequest2.Params.Items[1].Kind := pkREQUESTBODY;
      RESTRequest2.Params.Items[1].Name := 'body';
      RESTRequest2.Params.Items[1].Value := '{"content": "' + Edit1.Text + '"}';
      RESTRequest2.Params.Items[1].ContentTypeStr := 'application/json';

      // send request
      RESTRequest2.Execute;
    end);

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse2.Content);
end;

procedure TFormTisaneAPI.FormCreate(Sender: TObject);
begin
   RESTRequest1.Execute;
end;

end.
