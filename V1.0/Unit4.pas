unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
var tf:textfile;
    s:string;
begin
 try
  assignfile(tf,extractfilepath(application.ExeName)+'Instruction/V1.0更新说明.txt');
  reset(tf);
  while not eof(tf) do
   begin
    readln(tf,s);
    label1.Caption:=label1.Caption+s+#13#10;
   end;
  closefile(tf);
 except
  showmessage('The instruction is not found')
 end;
end;

end.
