unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls,StrUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function GetKey():string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  miMax,miMin,miNum:int64;
  i,j,n:integer;
begin
memo1.Clear;
memo1.Lines.Add('<Key>');
////生成主密钥
//  for I :=0 to 15 do
//  begin
//     memo1.Lines.Add('<Item>M_'+inttostr(i)+'_'+GetKey()+'</Item>');
//  end;

//生成工作密钥
  for I :=1 to 253 do
  begin
//    for j := 0 to 3 do
     memo1.Lines.Add('<Item>Key_'+inttostr(i)+'_'+GetKey()+GetKey()+'</Item>');
  end;
  memo1.Lines.Add('</Key>');
end;

function TForm1.GetKey():string;
var
  miMax,miMin,miNum:int64;
begin

  Randomize;
  miMax := random(9720575940);
  while (miMax < 100000000) do
    miMax := random(9720575940);

  miMin := random(720575940);
  while (miMin < 10000000) do
    miMin := random(720575940);

  miNum:=strtoint64(inttostr(miMax)+inttostr(miMin));
  result:=rightstr(inttohex(minum,16),16);
end;

end.
