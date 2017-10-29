unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
//var tf:textfile;
//    s:string;
begin
 label1.Caption:=memo1.Text;
{ try
  assignfile(tf,extractfilepath(application.ExeName)+'Instruction/ÓÎÏ·ËµÃ÷.txt');
  reset(tf);
  while not eof(tf) do
   begin
    readln(tf,s);
    label1.Caption:=label1.Caption+s+#13#10;
   end;
  closefile(tf);
 except
  showmessage('The instrucion is not found!');
 end;                                                   }
end;

end.
