unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function change(a:integer):integer;
begin
 case a of
  0:change:=0;
  1:change:=2;
  2:change:=1;
  3:change:=503;
  4:change:=504;
  5:change:=502;
  6:change:=501;
  7:change:=205;
  8:change:=202;
  9:change:=204;
  10:change:=201;
  11:change:=401;
  12:change:=402;
  13:change:=403;
  14:change:=301;
  15:change:=302;
  16:change:=101;
  17:change:=303;
  18:change:=405;
  19:change:=304;
  20:change:=305;
  21:change:=306;
  22:change:=404;
  23:change:=103;
  24:change:=106;
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var f,f2:textfile;
    t,i,j,k,a,b:integer;
    s:string;
begin
 if opendialog1.Execute then
  for t:=1 to opendialog1.Files.Count do
   begin
    s:=opendialog1.Files[t-1];
    assignfile(f,s);
    reset(f);
    insert('k',s,length(s)-3);
    assignfile(f2,s);
    rewrite(f2);
    readln(f,a,b);
    writeln(f2,a,' ',b);
    for i:=1 to a do
     begin
      for j:=1 to a do
       begin
        read(f,k);
        write(f2,change(k),' ');
       end;
      readln(f);
      writeln(f2);
     end;
    while not eof(f) do
     begin
      readln(f,s);
      writeln(f2,s);
     end;
    closefile(f);
    closefile(f2);
   end;
 showmessage('finish')
end;

end.
