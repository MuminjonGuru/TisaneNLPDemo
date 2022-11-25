program TisaneNLP;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitTisaneNLP in 'UnitTisaneNLP.pas' {FormTisaneAPI};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormTisaneAPI, FormTisaneAPI);
  Application.Run;
end.
