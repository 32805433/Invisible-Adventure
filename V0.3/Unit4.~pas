unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if checkbox1.checked then
  form1.tag:=form1.tag+1;
 form1.Enabled:=true;
 form1.get;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
 form1.Tag:=2;
 close;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
 form1.Tag:=0;
 close;
end;

end.
