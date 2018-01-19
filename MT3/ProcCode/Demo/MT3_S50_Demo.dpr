program MT3_S50_Demo;

uses
  Forms,
  Fr_Main in 'Fr_Main.pas' {Form1},
  Device_MT3 in '..\Interface\Device_MT3.pas',
  Interface_ps in '..\Interface\Interface_ps.pas',
  LogicUnit in '..\Interface\LogicUnit.pas',
  Protocol_IC in '..\Interface\Protocol_IC.pas',
  Protocol_Meter in '..\Interface\Protocol_Meter.pas',
  PublicCode in '..\Interface\PublicCode.pas',
  superobject in '..\Interface\superobject.pas',
  superxmlparser in '..\Interface\superxmlparser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
