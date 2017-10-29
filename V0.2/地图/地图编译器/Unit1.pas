unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, WinProcs;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    Image5: TImage;
    GroupBox1: TGroupBox;
    Image6: TImage;
    Image7: TImage;
    GroupBox2: TGroupBox;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Button5: TButton;
    Button6: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure imu(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure sc(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  size,i1,i2,i:integer;
  sb:array [1..22,1..22] of Tspeedbutton;
  l:array [1..100] of Tspeedbutton;
  f:boolean;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 try
  size:=strtoint(edit1.Text);
 except
  exit;
 end;
 if (size<2) or (size>22) then
  exit;
 for i1:=1 to size do
  for i2:=1 to size do
   begin
    sb[i1,i2]:=Tspeedbutton.Create(form1);
    with sb[i1,i2] do
     begin
      parent:=form1;
      name:='sb'+inttostr(i1*size+i2-size);
      left:=25*i1-9;
      top:=size*25-i2*25+16;
      width:=25;
      height:=25;
      groupindex:=0;
      onclick:=sc;
      tag:=0;
     end;
   end;
 label1.Visible:=false;
 edit1.Visible:=false;
 button1.Visible:=false;
 groupbox1.Visible:=true;
 groupbox2.Visible:=true;
 f:=true;
end;

procedure TForm1.imu(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var a,b:integer;
    s:string;
begin
 a:=(groupbox1.Left+Timage(sender).Left+x+9) div 25;
 b:=size-((groupbox1.Top+Timage(sender).Top+y+9) div 25)+1;
 if (a>0)and(a<=size)and(b>0)and(b<=size)and(groupbox1.Left+(Timage(sender).Left+x) mod 25<>16)and(groupbox1.Top+(Timage(sender).Top+y) mod 25<>16) then
  begin
   sb[a,b].Glyph:=Timage(sender).Picture.Bitmap;
   sb[a,b].Tag:=Timage(sender).Tag;
   if i<100 then
    inc(i)
    else
     i:=1;
   l[i]:=sb[a,b];
   button2.Enabled:=true;
   if (10<sb[a,b].Tag)and(sb[a,b].Tag<14) then
    begin          
     s:=sb[a,b].Hint;
     inputquery('设置','编辑文字   ',s);
     sb[a,b].Hint:=s;
    end;
   f:=true;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 l[i].Glyph:=nil;
 l[i].Tag:=0;
 l[i]:=nil;
 if i>1 then
  dec(i)
  else
   i:=100;
 if l[i]=nil then
  button2.Enabled:=false;
 f:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if f then
  if messagebox(form1.Handle,'更改尚未保存，你确定要退出吗？','提示',mb_yesno+mb_iconquestion)=7 then
   exit;
 winexec(pchar(ExtractFilePath(application.ExeName)+'Project1.exe'),sw_show);
 close;
end;

procedure TForm1.Button4Click(Sender: TObject);
var tf:textfile;
begin
 if savedialog1.Execute then
  try
   assignfile(tf,savedialog1.FileName);
   rewrite(tf);
   writeln(tf,size);
   for i2:=size downto 1 do
    begin
     for i1:=1 to size do
      write(tf,sb[i1,i2].tag,' ');
     writeln(tf);
    end;
   for i2:=size downto 1 do
    for i1:=1 to size do
     if (10<sb[i1,i2].Tag)and(sb[i1,i2].Tag<14) then
      writeln(tf,i1,' ',i2,' ',sb[i1,i2].Hint);
   closefile(tf);
   f:=false;
  except
   showmessage('保存失败');
  end;
end;

procedure TForm1.sc(Sender: TObject);
var sp:Tspeedbutton;
    s:string;
    ff:boolean;
begin
 sp:=sender as Tspeedbutton;
 ff:=false;
 for i1:=1 to size do
  begin
   for i2:=1 to size do
    if sb[i1,i2]=sp then
     begin
      ff:=true;
      break;
     end;
   if ff then
    break;
  end;
 if (10<sb[i1,i2].Tag)and(sb[i1,i2].Tag<14) then
  begin
   s:=sb[i1,i2].Hint;
   inputquery('设置','编辑文字   ',s);
   sb[i1,i2].Hint:=s;
  end;
 f:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 i:=0;
 f:=false;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if f then
  if messagebox(form1.Handle,'更改尚未保存，你确定要退出吗？','提示',mb_yesno+mb_iconquestion)=7 then
   canclose:=false;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 button1.Visible:=true;
 label1.Visible:=true;
 edit1.Visible:=true;
 button5.Visible:=false;
 button6.Visible:=false;
end;

procedure TForm1.Button6Click(Sender: TObject);
var tf:textfile;
    a:integer;
    h:string;
begin
 if opendialog1.Execute then
  begin
   try
    assignfile(tf,opendialog1.FileName);
    reset(tf);
    readln(tf,size);
    if (size<2) or (size>22) then
     exit;
    for i1:=1 to size do
     for i2:=1 to size do
      begin
       sb[i1,i2]:=Tspeedbutton.Create(form1);
       with sb[i1,i2] do
        begin
         parent:=form1;
         name:='sb'+inttostr(i1*size+i2-size);
         left:=25*i1-9;
         top:=size*25-i2*25+16;
         width:=25;
         height:=25;
         groupindex:=0;
         onclick:=sc;
        end;
      end;
    for i2:=size downto 1 do
     for i1:=1 to size do
      begin
       read(tf,a);
       sb[i1,i2].tag:=a;
       case a of
        1:sb[i1,i2].Glyph:=image1.Picture.Bitmap;
        2:sb[i1,i2].Glyph:=image10.Picture.Bitmap;
        3:sb[i1,i2].Glyph:=image7.Picture.Bitmap;
        4:sb[i1,i2].Glyph:=image8.Picture.Bitmap;
        5:sb[i1,i2].Glyph:=image9.Picture.Bitmap;
        6:sb[i1,i2].Glyph:=image11.Picture.Bitmap;
        7:sb[i1,i2].Glyph:=image6.Picture.Bitmap;
        8:sb[i1,i2].Glyph:=image12.Picture.Bitmap;
        9:sb[i1,i2].Glyph:=image13.Picture.Bitmap;
        10:sb[i1,i2].Glyph:=image14.Picture.Bitmap;
        11:sb[i1,i2].Glyph:=image15.Picture.Bitmap;
        12:sb[i1,i2].Glyph:=image16.Picture.Bitmap;
        13:sb[i1,i2].Glyph:=image17.Picture.Bitmap;
        14:sb[i1,i2].Glyph:=image3.Picture.Bitmap;
        15:sb[i1,i2].Glyph:=image2.Picture.Bitmap;
        16:sb[i1,i2].Glyph:=image4.Picture.Bitmap;
        17:sb[i1,i2].Glyph:=image18.Picture.Bitmap;
        18:sb[i1,i2].Glyph:=image19.Picture.Bitmap;
        19:sb[i1,i2].Glyph:=image20.Picture.Bitmap;
        20:sb[i1,i2].Glyph:=image21.Picture.Bitmap;
        21:sb[i1,i2].Glyph:=image22.Picture.Bitmap;
        22:sb[i1,i2].Glyph:=image23.Picture.Bitmap;
        23:sb[i1,i2].Glyph:=image24.Picture.Bitmap;
        24:sb[i1,i2].Glyph:=image25.Picture.Bitmap;
       end;
      end;
    while not eof(tf) do
     begin
      readln(tf,i1,i2,h);
      delete(h,1,1);
      sb[i1,i2].Hint:=h;
     end;
    closefile(tf);
    button5.Visible:=false;
    button6.Visible:=false;
    groupbox1.Visible:=true;
    groupbox2.Visible:=true;
   except
    exit;
   end;
  end;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
 button1.Click;
end;

end.
