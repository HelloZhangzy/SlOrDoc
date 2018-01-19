program MeterDebugDemo_17A;

uses
  Forms,
  MeterDebugDemo in 'MeterDebugDemo.pas' {Form2},
  superobject in '..\Interface\superobject.pas',
  superxmlparser in '..\Interface\superxmlparser.pas',
  PublicCode in '..\Interface\PublicCode.pas',
  Device_MT3 in '..\Interface\Device_MT3.pas',
  Protocol_IC in '..\Interface\Protocol_IC.pas',
  Protocol_Meter in '..\Interface\Protocol_Meter.pas',
  LogicUnit in '..\Interface\LogicUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
