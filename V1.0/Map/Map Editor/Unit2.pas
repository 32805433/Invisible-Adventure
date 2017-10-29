unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
 form2.Color:=RGB(200,255,150);
 label1.Caption:='1¡¢(1,1,1) can only be the space!'+#13#10+'2¡¢You should use your mouse to drag the items onto the button.'+#13#10+'3¡¢The name of each item will be shown with the mouse moving above it.'+#13#10#13#10+'The name of the map might be£ºdifficulty(1~5¡ù)+No.';
end;

end.
