unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Menus, jpeg;

type
    TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    OpenDialog1: TOpenDialog;
    Label10: TLabel;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Button11: TButton;
    GroupBox4: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Button12: TButton;
    Label16: TLabel;
    Label17: TLabel;
    Button13: TButton;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Button14: TButton;
    MainMenu1: TMainMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N2: TMenuItem;
    N01: TMenuItem;
    N03: TMenuItem;
    N02: TMenuItem;
    N04: TMenuItem;
    N05: TMenuItem;
    N06: TMenuItem;
    N07: TMenuItem;
    GroupBox6: TGroupBox;
    Button10: TButton;
    Button15: TButton;
    Button16: TButton;
    Button6: TButton;
    Button9: TButton;
    Button17: TButton;
    N10: TMenuItem;
    N11: TMenuItem;
    Image1: TImage;
    N12: TMenuItem;
    Label4: TLabel;
    Image2: TImage;
    ComboBox1: TComboBox;
    Button18: TButton;
    Button19: TButton;
    N1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(S:string);
//    procedure N4Click(Sender: TObject);
//    procedure N5Click(Sender: TObject);
    procedure N9Click;
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N03Click(Sender: TObject);
    procedure N04Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N05Click(Sender: TObject);
    procedure N06Click(Sender: TObject);
    procedure N07Click(Sender: TObject);
    procedure N02Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure swift;
    procedure drink;
    procedure fight_;
    procedure get;
    procedure die(f:boolean);
    procedure light(a:integer);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
  private
    procedure sbclick(Sender: TObject);
  public
    { Public declarations }
  end;


const n=25;
      m=24;

var
  Form1: TForm1;
  rocks,guns,dz,winem,curem,minem,lightm,lt,
  i1,i2,at,bt,x,y,xyuan,yyuan,p,k,win,hitpoints,life,ropes,keys,
  maxhitpoints,gold,getgold,size,torch,bulb,
  minattack,maxattack,monsterlife,minmonsterattack,maxmonsterattack,
  pat,pbt,pct,pdt,dgood,dbad,jiang:integer;
  a,wineinfer,showsb:array[1..n,1..n] of integer;
  b:array[1..m] of boolean;
  hints:array[1..n,1..n] of string;
  cansay:array[1..n,1..n] of boolean;
  find,fish,start,lh,fight,pon,pa,pb,pc,pd,fj,cq,fteach:boolean;
  goldnumber:set of 2..4;
  sb:array[1..n,1..n] of Tspeedbutton;
  wall,s0,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s14,s15,s16,s17,s18,s19,s20,s21,s22:TBitmap;
  s:string;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm1.die(f:boolean);
begin
 if f then
  begin
   Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'你已经没有命了，游戏结束！';
   button11.Enabled:=false;button14.Enabled:=false;
   Label7.Caption:='生命值：0';light(0);
   Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=true;
   n2.Enabled:=false;Image1.Picture.Bitmap:=nil;button5.SetFocus;p:=5;
   for i1:=1 to size do
    for i2:=1 to size do
     sb[i1,i2].Enabled:=false;
  end
  else
   begin
    Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'很遗憾，你损失了一条命。你还有'+inttostr(life)+'条命。'+chr(13)+chr(10)+'现在回到出发点。按确定键继续...';
    x:=1;y:=1;p:=3;hitpoints:=maxhitpoints;
    Label7.Caption:='生命值：'+inttostr(maxhitpoints);
    Label8.Caption:='你的位置：（1,1）';
    sb[1,1].Down:=true;Image1.Picture.Bitmap:=s0;
    Button5.Visible:=true;button5.SetFocus;
   end;
end;

procedure TForm1.fight_;
begin
  label2.Caption:='';
  if pon then monsterlife:=monsterlife-4;
  monsterlife:=monsterlife-at;
  if monsterlife<=0 then
    begin
      fight:=false;
      if pon then Label2.Caption:='怪物中毒了！受到4点伤害！'+chr(13)+chr(10)+'你对怪物造成了'+inttostr(at)+'点伤害'+chr(13)+chr(10)+'战斗胜利！';
      if not pon then Label2.Caption:='你对怪物造成了'+inttostr(at)+'点伤害'+chr(13)+chr(10)+'战斗胜利！';
      Image1.Picture.Bitmap:=s0;
      pon:=false;light(1);
      groupbox5.Visible:=false;
      if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
      if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
      if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
      if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
      a[x,y]:=0;
    end;
  if monsterlife>0 then
    begin
      if pon then Label2.Caption:='怪物中毒了！受到4点伤害！'+chr(13)+chr(10)+'你对怪物造成了'+inttostr(at)+'点伤害';
      if not pon then Label2.Caption:='你对怪物造成了'+inttostr(at)+'点伤害';
      Label16.Caption:='生命值：'+inttostr(monsterlife);
      randomize;bt:=minmonsterattack+random(maxmonsterattack-minmonsterattack+1);
      hitpoints:=hitpoints-bt;Label7.Caption:='生命值：'+inttostr(hitpoints);
      Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'怪物对你造成了'+inttostr(bt)+'点伤害';
      if hitpoints<=0 then
        begin
          pon:=false;
          fight:=false;
          life:=life-1;
          Label6.Caption:='※：'+inttostr(life);
          groupbox5.Visible:=false;
          if life=0 then
           die(true);
          if life>0 then
           die(false);
        end;
     end;
end;

procedure TForm1.drink;
begin
  Label2.Caption:='你使用了一瓶酒!';
  if wineinfer[x,y]=1 then
    begin
      hitpoints:=hitpoints+10;
      Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'恭喜你，这是一瓶好酒！'+chr(13)+chr(10)+'获得10点生命值！';
      Label7.Caption:='生命值：'+inttostr(hitpoints);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      p:=2;a[x,y]:=0;
    end
    else
      begin
        hitpoints:=hitpoints-10;
        Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'噢，这是一瓶毒酒！'+chr(13)+chr(10)+'失去10点生命值！';
        if hitpoints<=0 then
          begin
            life:=life-1;
            Label6.Caption:='※：'+inttostr(life);
            if life=0 then
             die(true);
            if life>0 then
             begin
              a[x,y]:=0;
              die(false);
             end;
          end;
        if hitpoints>0 then
          begin
            p:=2;
            Label7.Caption:='生命值：'+inttostr(hitpoints);
            Button5.Enabled:=true;
          end;
        Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
        p:=2;a[x,y]:=0;
      end;
end;

procedure TForm1.light(a:integer);
begin
 if a=0 then
  begin
   button11.Enabled:=false;
   button14.Enabled:=false;
  end
  else
   begin
    if torch>0 then
     button11.Enabled:=true;
    if bulb>0 then
     button14.Enabled:=true;
   end;
end;

procedure TForm1.swift;
begin
  if gold>=7 then Button10.Enabled:=true;
  if gold>=7 then Button15.Enabled:=true;
  if gold>=2 then Button16.Enabled:=true;
  if gold>=7 then Button6.Enabled:=true;
  if gold>=9 then Button9.Enabled:=true;
  if gold>=9 then Button17.Enabled:=true;
  if gold<7 then Button10.Enabled:=false;
  if gold<7 then Button15.Enabled:=false;
  if gold<2 then Button16.Enabled:=false;
  if gold<7 then Button6.Enabled:=false;
  if gold<9 then Button9.Enabled:=false;
  if gold<9 then Button17.Enabled:=false;
  if torch<1 then Button16.Enabled:=false;
  if bulb<1 then Button16.Enabled:=false;
end;

function thing(xpoint,ypoint:integer):string;
begin
  case a[xpoint,ypoint] of
    0:thing:='空地';1:thing:='墙';2:thing:='终点';3:thing:='陷阱';4:thing:='绳子';
    5:thing:='钥匙';6:thing:='门';7:thing:='命';9:thing:='急救箱';10:thing:='地雷';
    11:thing:='路牌';12:thing:='君子';13:thing:='小人';14:thing:='手电筒';15:thing:='灯泡';
    16:thing:='怪物';17:thing:='金币';18:thing:='僧人';19:thing:='石头';20:thing:='手枪';
    21:thing:='毒针';22:thing:='商人';23:thing:='进阶怪物';24:thing:='BOSS！';
  else
    begin
      if wineinfer[xpoint,ypoint]=1 then thing:='好酒'
      else thing:='毒酒';
    end;
  end;
end;

procedure TForm1.N05Click(Sender: TObject);
begin
  Label2.Caption:='你使用了一瓶酒!';
  if random(winem)+1>dbad then
    begin
      hitpoints:=hitpoints+10;
      Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'恭喜你，这是一瓶好酒！'+chr(13)+chr(10)+'获得10点生命值！';
      Label7.Caption:='生命值：'+inttostr(hitpoints);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      dec(dgood);p:=2;
    end
    else
      begin
        hitpoints:=hitpoints-10;
        Label2.Caption:=Label2.Caption+chr(13)+chr(10)+'噢，这是一瓶毒酒！'+chr(13)+chr(10)+'失去10点生命值！';
        if hitpoints<=0 then
          begin
            life:=life-1;
            Label6.Caption:='※：'+inttostr(life);
            if life=0 then
             die(true);
            if life>0 then
             begin
              a[x,y]:=0;
              die(false);
             end;
          end;
        if hitpoints>0 then
          begin
            p:=2;
            Label7.Caption:='生命值：'+inttostr(hitpoints);
            Button5.Enabled:=true;
          end;
        Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
        dec(dbad);p:=2;
      end;
  dec(winem);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;y:=y+1;
  Label8.Caption:='你的位置：（'+inttostr(x)+','+inttostr(y)+'）  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
  begin
   if a[x,y]<>8 then
    button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;x:=x-1;
  Label8.Caption:='你的位置：（'+inttostr(x)+','+inttostr(y)+'）  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
  begin
   if a[x,y]<>8 then
    button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;y:=y-1;
  Label8.Caption:='你的位置：（'+inttostr(x)+','+inttostr(y)+'）  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
  begin            
   if a[x,y]<>8 then
    button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
  xyuan:=x;yyuan:=y;x:=x+1;
  Label8.Caption:='你的位置：（'+inttostr(x)+','+inttostr(y)+'）  ';
  p:=1;
  button5.Click;
  if a[x,y]=0 then
    begin
      p:=2;
      button5.Click;
    end;
 if b[a[x,y]] then
  begin
   if a[x,y]<>8 then
    button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  change,i1,i2:integer;
begin
  Image1.Picture.Bitmap:=s0;
  light(1);
  GroupBox6.Visible:=false;
  if p=1 then
    begin
      change:=2;
      sb[x,y].Flat:=false;
      sb[x,y].Tag:=1;
      sb[x,y].Down:=true;
      if a[x,y]>0 then light(0);
      case a[x,y] of
        2:begin
            change:=0;win:=1;
            Image1.Picture.Bitmap:=s2;
            Label2.Caption:='祝贺你！你走到了终点！';
            if not fteach then
             label2.Caption:=label2.Caption+#13#10+'你获得了'+inttostr(jiang)+'张奖票！'+#13#10+'凭此页面获得奖票。';
            Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=false;
            Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
            n2.Enabled:=false;
            for i1:=1 to size do
             for i2:=1 to size do
              sb[i1,i2].Enabled:=false;
          end;
        3:begin
            image1.Picture.Bitmap:=s3;
            Label2.Caption:='哎呀！'+chr(13)+chr(10)+'不小心踩到陷阱了！'+chr(13)+chr(10)+'要使用绳子吗？';
            Button7.Visible:=true;Button8.Visible:=true;Button8.Enabled:=true;button8.SetFocus;
            if ropes>0 then
              begin
                Button7.Enabled:=true;Button7.SetFocus;
              end;
            Button5.Visible:=false;
            k:=1;
          end;
        4:begin
            image1.Picture.Bitmap:=s4;
            Label2.Caption:='嗯...不错！你捡到了一条绳子';
            ropes:=ropes+1;
            Label5.Caption:='绳子：'+inttostr(ropes);
            Button5.Visible:=true;
            Button5.SetFocus;
          end;
        5:begin
            Image1.Picture.Bitmap:=s5;
            Label2.Caption:='很好！你捡到了一把钥匙！'+chr(13)+chr(10)+'钥匙可是很稀有的哦！';
            keys:=keys+1;
            Label9.Caption:='钥匙：'+inttostr(keys);
            Button5.Visible:=true;
            Button5.SetFocus;
          end;
        6:begin
            Image1.Picture.Bitmap:=s6;
            Label2.Caption:='你遇到了一扇门！'+chr(13)+chr(10)+'你要使用钥匙吗？';
            Button7.Visible:=true;Button8.Visible:=true;Button8.Enabled:=true;button8.SetFocus;
            if keys>0 then
              begin
                Button7.Enabled:=true;button7.SetFocus;
              end;
            Button5.Visible:=false;
            k:=2;
          end;
        7:begin
            Image1.Picture.Bitmap:=s7;
            Label2.Caption:='恭喜你！你捡到了一条命！';
            life:=life+1;Label6.Caption:='※：'+inttostr(life);
            Button5.Visible:=true;
            Button5.SetFocus;
          end;
        8:begin
            Image1.Picture.Bitmap:=s8;
            if pa=true then
             begin
              Label2.Caption:='你捡到了一瓶酒！';
              winem:=winem+1;
              if wineinfer[x,y]=1 then
               inc(dgood) else inc(dbad);
              Button5.Visible:=true;
              Button5.SetFocus;
             end;
            if pa=false then
             begin
              Label2.Caption:='你捡到了一瓶酒！'+chr(13)+chr(10)+'你要使用它吗？';
              Button7.Visible:=true;Button8.Visible:=true;Button7.Enabled:=true;Button8.Enabled:=true;
              Button7.SetFocus;
              Button5.Visible:=false;
              randomize;
              k:=3;
             end;
          end;
        9:begin
           image1.Picture.Bitmap:=s9;
           if pa=true then
            begin
             Label2.Caption:='你捡到了一个急救箱！';
             curem:=curem+1;
             Button5.Visible:=true;
             Button5.SetFocus;
            end;
           if pa=false then
            begin
             Label2.Caption:='你捡到了一个急救箱！'+chr(13)+chr(10)+'获得15点生命值！';
             hitpoints:=hitpoints+15;
             Label7.Caption:='生命值：'+inttostr(hitpoints);
             Button5.Visible:=true;
             Button5.SetFocus;
            end;
          end;
        10:begin
           image1.Picture.Bitmap:=s10;
             if pb=true then
              begin
               Label2.Caption:='你捡到了一个地雷！坑不到你，唉...';
               Button5.Visible:=true;
               minem:=minem+1;
              end;
             if pb=false then
              begin
               Label2.Caption:='bomb！恭喜你！你捡到了一个地雷！'+chr(13)+chr(10)+'扣除一半的生命值！';
               hitpoints:=(hitpoints+1) div 2;Label7.Caption:='生命值：'+inttostr(hitpoints);
               Button5.Visible:=true;
               Button5.SetFocus;
              end;
           end;
        11:if cansay[x,y] then
            begin
              Image1.Picture.Bitmap:=s11;
              Label2.Caption:='你遇到了一个路牌';
              memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):路牌:'+hints[x,y]+chr(13)+chr(10));
              cansay[x,y]:=false;
              button5.Visible:=true;
              button5.SetFocus;
            end
            else
              begin
                p:=2;
                button5.Click;
              end;
        12,13:if cansay[x,y] then
               begin
                image1.Picture.Bitmap:=s12;
                 Label2.Caption:='你遇到了一个人';
                 memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):人:'+hints[x,y]+chr(13)+chr(10));
                 cansay[x,y]:=false;
                 button5.Visible:=true;
                 button5.SetFocus;
               end
               else
                begin
                 p:=2;
                 button5.Click;
                end;
        14:begin
             Image1.Picture.Bitmap:=s14;
             Label2.Caption:='你捡到了一个手电筒';
             inc(torch);label11.Caption:='手电筒：'+inttostr(torch)+'  ';
             button11.Enabled:=true;button5.Visible:=true;
           end;
        15:begin
             Image1.Picture.Bitmap:=s15;
             Label2.Caption:='你捡到了一个灯泡';
             inc(bulb);label3.Caption:='灯泡：'+inttostr(bulb)+'  ';
             button14.Enabled:=true;button5.Visible:=true;
           end;
        16:begin
             Image1.Picture.Bitmap:=s16;
             groupbox5.Visible:=true;
             Button13.SetFocus;
             Label2.Caption:='你撞上了一个怪物'+chr(13)+chr(10)+'开始战斗!';
             monsterlife:=random(5)+18;randomize;
             minmonsterattack:=random(2)+1;randomize;
             maxmonsterattack:=random(2)+2;randomize;
             Label16.Caption:='生命值：'+inttostr(monsterlife);
             Label17.Caption:='攻击力：'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
             fight:=true;
           end;
        17:begin
            Image1.Picture.Bitmap:=s17;
            repeat
             getgold:=random(3)+2;
            until getgold in goldnumber;
            goldnumber:=goldnumber-[getgold];
            gold:=gold+getgold;
            Label2.Caption:='你捡到了'+inttostr(getgold)+'个金币';
            label10.Caption:='金币：'+inttostr(gold);
            if goldnumber=[] then goldnumber:=[2,3,4];
            button5.Visible:=true;
            Button5.SetFocus;
           end;
        18:begin
             Image1.Picture.Bitmap:=s18;
             Label2.Caption:='你遇到了一个僧人！';
             change:=4;
             Button5.Visible:=true;
             Button5.SetFocus;
           end;
        19:begin
             Image1.Picture.Bitmap:=s19;
             Label2.Caption:='你捡到一块石头！'+chr(13)+chr(10)+'石头威力较大，请注意！';
             rocks:=rocks+1;
             Button5.Visible:=true;
             Button5.SetFocus;
           end;
        20:begin
             Image1.Picture.Bitmap:=s20;
             Label2.Caption:='你捡到一把手枪！'+chr(13)+chr(10)+'手枪威力不稳定，请慎重使用！';
             guns:=guns+1;
             Button5.Visible:=true;
             Button5.SetFocus;
           end;
        21:begin
             Image1.Picture.Bitmap:=s21;
             Label2.Caption:='你捡到一根毒针！'+chr(13)+chr(10)+'针上有剧毒！要小心！';
             dz:=dz+1;
             Button5.Visible:=true;
           end;
        22:begin
             Image1.Picture.Bitmap:=s22;
             Label2.Caption:='你遇到了一个商人！';
             GroupBox6.Visible:=true;
             Button5.Visible:=true;
             Button5.SetFocus;
             swift;
           end;
        23:begin                       
             Image1.Picture.Bitmap:=s16;
             groupbox5.Visible:=true;
             Button13.SetFocus;
             Label2.Caption:='你遇到了一个进阶怪物'+chr(13)+chr(10)+'开始战斗!';
             monsterlife:=random(6)+27;randomize;
             minmonsterattack:=random(2)+2;randomize;
             maxmonsterattack:=random(2)+3;randomize;
             Label16.Caption:='生命值：'+inttostr(monsterlife);
             Label17.Caption:='攻击力：'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
             fight:=true;
           end;
        24:begin
             Image1.Picture.Bitmap:=s16;
             groupbox5.Visible:=true;
             Button13.SetFocus;
             Label2.Caption:='你遇到了BOSS!';
             monsterlife:=45;
             minmonsterattack:=5;
             maxmonsterattack:=8;
             Label16.Caption:='生命值：'+inttostr(monsterlife);
             Label17.Caption:='攻击力：'+inttostr(minmonsterattack)+'~'+inttostr(maxmonsterattack);
             fight:=true;
           end;
        end;
    end;
  if p=2 then
    begin
      if a[x,y]<>22 then
       a[x,y]:=0;
      change:=0;
      Label2.Caption:='这是一块空地...'+chr(13)+chr(10)+'继续...你想往哪个方向走？';
      if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
      if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
      if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
      if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
      Button5.Visible:=false;
    end;
  if p=3 then
    begin
      Label2.Caption:='回到出发点...你想往哪个方向走？';
      Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;
      if (a[2,1]<>1) then Button4.Enabled:=true;
      if (a[1,2]<>1) then Button1.Enabled:=true;
      Button5.Visible:=false;
    end;
  if p=4 then
    begin
      Label2.Caption:='僧人说："施主这么有缘，教你一种武功吧！"'+chr(13)+chr(10)+'你学会了罗汉拳！提升2点普通攻击伤害...'+chr(13)+chr(10)+'僧人消失了...';
      lh:=true;change:=2;
      Button5.Visible:=true;Button5.SetFocus;
      a[x,y]:=0;
    end;
  if p=5 then
   begin
    winexec(pchar(ExtractFilePath(application.ExeName)+'Project1.exe'),sw_show);
    cq:=true;
    close;
   end;
  p:=change;
end;

procedure TForm1.FormCreate(Sender: TObject);
var s:string;
begin
  Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=false;
  Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
  Label2.Caption:='本游戏版权所有！'+chr(13)+chr(10)+'未经作者允许不得翻录！';
  fillchar(b,sizeof(b),0);
  b[4]:=true;b[5]:=true;b[7]:=true;b[8]:=true;b[9]:=true;b[10]:=true;
  b[14]:=true;b[15]:=true;b[17]:=true;b[19]:=true;b[20]:=true;b[21]:=true;
  fillchar(cansay,sizeof(cansay),true);
  s:=extractfilepath(application.ExeName);
  wall:=Tbitmap.Create;
  s0:=Tbitmap.Create;s2:=Tbitmap.Create;s3:=Tbitmap.Create;s4:=Tbitmap.Create;s5:=Tbitmap.Create;
  s6:=Tbitmap.Create;s7:=Tbitmap.Create;s8:=Tbitmap.Create;s9:=Tbitmap.Create;s10:=Tbitmap.Create;
  s11:=Tbitmap.Create;s12:=Tbitmap.Create;s14:=Tbitmap.Create;s15:=Tbitmap.Create;s16:=Tbitmap.Create;
  s17:=Tbitmap.Create;s18:=Tbitmap.Create;s19:=Tbitmap.Create;s20:=Tbitmap.Create;s21:=Tbitmap.Create;
  s22:=Tbitmap.Create;
  wall.LoadFromFile(s+'icon/wall.bmp');
  s0.LoadFromFile(s+'icon/s0.bmp');s2.LoadFromFile(s+'icon/s2.bmp');s3.LoadFromFile(s+'icon/s3.bmp');
  s4.LoadFromFile(s+'icon/s4.bmp');s5.LoadFromFile(s+'icon/s5.bmp');s6.LoadFromFile(s+'icon/s6.bmp');
  s7.LoadFromFile(s+'icon/s7.bmp');s8.LoadFromFile(s+'icon/s8.bmp');s9.LoadFromFile(s+'icon/s9.bmp');
  s10.LoadFromFile(s+'icon/s10.bmp');s11.LoadFromFile(s+'icon/s11.bmp');s12.LoadFromFile(s+'icon/s12.bmp');
  s14.LoadFromFile(s+'icon/s14.bmp');s15.LoadFromFile(s+'icon/s15.bmp');s16.LoadFromFile(s+'icon/s16.bmp');
  s17.LoadFromFile(s+'icon/s17.bmp');s18.LoadFromFile(s+'icon/s18.bmp');s19.LoadFromFile(s+'icon/s19.bmp');
  s20.LoadFromFile(s+'icon/s20.bmp');s21.LoadFromFile(s+'icon/s21.bmp');s22.LoadFromFile(s+'icon/s22.bmp');
  opendialog1.InitialDir:=s+'地图';savedialog1.InitialDir:=s+'进度';
  fj:=false;start:=false;cq:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i1,i2:integer;
begin
  if k=1 then
    begin
      ropes:=ropes-1;Label5.Caption:='绳子：'+inttostr(ropes);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Label2.Caption:='你使用了一条绳子，从陷阱里爬了出来'+chr(13)+chr(10)+'下次小心一点吧...';
      Button5.Visible:=true;
      p:=2;a[x,y]:=0;
    end;
  if k=2 then
    begin
      keys:=keys-1;Label9.Caption:='钥匙：'+inttostr(keys);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Label2.Caption:='你用钥匙开了这扇门！';
      Button5.Visible:=true;
      p:=2;a[x,y]:=0;
    end;
  if k=3 then
    begin
      button5.Visible:=true;
      drink;
    end;
  if (button5.Enabled)and(button5.Visible) then button5.SetFocus;
end;

procedure TForm1.Button8Click(Sender: TObject);
var i1,i2:integer;
begin
  if k=1 then
    begin
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      life:=life-1;Label6.Caption:='※：'+inttostr(life);
      if life=0 then
       die(true);
      if life>0 then
       die(false);
    end;
  if k=2 then
    begin
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Label2.Caption:='你未能成功打开这扇门！'+chr(13)+chr(10)+'退回原来一格！按确定键继续...';
      x:=xyuan;y:=yyuan;
      sb[xyuan,yyuan].Down:=true;
      Label8.Caption:='你的位置：（'+inttostr(x)+','+inttostr(y)+'）';
      Button5.Visible:=true;
      p:=2;
    end;
  if k=3 then
    begin
      Label2.Caption:='你摔碎了酒瓶...'+chr(13)+chr(10)+'作为惩罚扣除2金币！';
      gold:=gold-2;if gold<0 then gold:=0;
      Label10.Caption:='金币：'+inttostr(gold);
      Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
      Button5.Visible:=true;
      p:=2;a[x,y]:=0;
    end;
  if (button5.Enabled)and(button5.Visible) then button5.SetFocus;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=vk_up)and(button1.Enabled) then button1.Click;
 if (key=vk_down)and(button2.Enabled) then button2.Click;
 if (key=vk_left)and(button3.Enabled) then button3.Click;
 if (key=vk_right)and(button4.Enabled) then button4.Click;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 groupbox4.Visible:=true;
 dec(torch);label11.Caption:='手电筒：'+inttostr(torch)+'  ';
 button1.Enabled:=false;button2.Enabled:=false;button3.Enabled:=false;button4.Enabled:=false;
 light(0);
 label2.Caption:='请选择手电筒照射方向';
end;

procedure TForm1.Button12Click(Sender: TObject);
var i:integer;
begin
 if radiobutton3.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if y+i<=size then memo1.Lines.Add('北边第'+inttostr(i)+'格是'+thing(x,y+i));
   radiobutton3.Checked:=false;groupbox4.Visible:=false;
  end;
 if radiobutton4.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if y-i>=1 then memo1.Lines.Add('南边第'+inttostr(i)+'格是'+thing(x,y-i));
   radiobutton4.Checked:=false;groupbox4.Visible:=false;
  end;
 if radiobutton5.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if x-i>=1 then memo1.Lines.Add('西边第'+inttostr(i)+'格是'+thing(x-i,y));
   radiobutton5.Checked:=false;groupbox4.Visible:=false;
  end;
 if radiobutton6.Checked then
  begin
   memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
   for i:=1 to 3 do
    if x+i<=size then memo1.Lines.Add('东边第'+inttostr(i)+'格是'+thing(x+i,y));
   radiobutton6.Checked:=false;groupbox4.Visible:=false;
  end;
 memo1.Lines.Add(chr(13)+chr(10));
 if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
 if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
 if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
 if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
 light(1);
 Label2.Caption:='这是一块空地...'+chr(13)+chr(10)+'继续...你想往哪个方向走？';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if not lh then
    begin
      randomize;at:=random(2)+1;
    end;
  if lh then
    begin
      randomize;at:=random(2)+3;
    end;
  if pd then inc(at);
  fight_;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 dec(bulb);label3.Caption:='灯泡：'+inttostr(bulb)+'  ';
 if bulb=0 then button14.Enabled:=false;
 memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
 if y<=size-1 then memo1.Lines.Add('北边第1格是'+thing(x,y+1));
 if y>=2 then memo1.Lines.Add('南边第1格是'+thing(x,y-1));
 if x>=2 then memo1.Lines.Add('西边第1格是'+thing(x-1,y));
 if x<=size-1 then memo1.Lines.Add('东边第1格是'+thing(x+1,y));
 memo1.Lines.Add(chr(13)+chr(10));
end;

procedure TForm1.sbclick(Sender: TObject);
var i1,i2:integer;
    f:boolean;
begin
 if button5.Visible or button7.Visible or groupbox4.Visible or groupbox5.Visible or groupbox6.Visible then
  begin
   sb[x,y].Down:=true;
   exit;
  end;
 f:=false;
 for i1:=1 to size do
  begin
   for i2:=1 to size do
    if sender=sb[i1,i2] then begin f:=true; break; end;
   if f then break;
  end;
 i1:=(Tspeedbutton(sender).Left-257) div 20;
 i2:=(size*20+9-Tspeedbutton(sender).Top) div 20;
 if sb[i1,i2].Tag=0 then begin sb[x,y].Down:=true;exit; end;
 Button1.Enabled:=False;Button2.Enabled:=False;Button3.Enabled:=False;Button4.Enabled:=False;
 xyuan:=x;yyuan:=y;x:=i1;y:=i2;
 Label8.Caption:='你的位置：（'+inttostr(x)+','+inttostr(y)+'）  ';
 p:=1;
 button5.Click;
 if a[x,y]=0 then
  begin
   p:=2;
   button5.Click;
  end;
 if b[a[x,y]] then
  begin
   button5.SetFocus;
   a[x,y]:=0;fish:=false;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if cq then
  begin
   canclose:=true;
   exit;
  end;
 if messagebox(form1.Handle,'你确定要关闭本游戏吗？','询问',mb_yesno+mb_iconquestion)=7 then
  canclose:=false;
end;

procedure TForm1.N3Click(s:string);
var f:textfile;
    i,j,xp,yp:integer;
begin
 try
  assignfile(f,s);reset(f);
  readln(f,size);
  for i:=size downto 1 do
   begin
    for j:=1 to size do
     begin
      read(f,a[j,i]);
      randomize;
      if a[j,i]=8 then wineinfer[j,i]:=random(2);
     end;
    readln(f);
   end;
  for i:=1 to size do
   for j:=1 to size do
    showsb[i,j]:=0;
  while not eof(f) do
   begin
    readln(f,xp,yp,hints[xp,yp]);
    cansay[xp,yp]:=true;
   end;
  pon:=false;fight:=false;lh:=false;life:=3;maxhitpoints:=60;hitpoints:=60;
  ropes:=0;keys:=0;gold:=0;torch:=0;bulb:=0;x:=1;y:=1;win:=0;
  pa:=false;pb:=false;pc:=false;pd:=false;dgood:=0;dbad:=0;
  rocks:=0;guns:=0;dz:=0;winem:=0;curem:=0;minem:=0;lightm:=0;
  closefile(f);
 except
  closefile(f);
  showmessage('读取失败!');
  exit;
 end;
 //  N9.Enabled:=true;
 n9click;
end;

{procedure TForm1.N4Click(Sender: TObject);
var f:textfile;
    isend:boolean;
    i,j,xp,yp:integer;
    str:string;
    fcansay:byte;
begin
 if opendialog1.Execute() then
  begin
   try
    assignfile(f,opendialog1.FileName);reset(f);
    readln(f,size);
    for i:=size downto 1 do
     begin
      for j:=1 to size do
       begin
        read(f,a[j,i]);
        randomize;
        if a[j,i]=8 then wineinfer[j,i]:=random(2);
       end;
      readln(f);
     end;
    for i:=size downto 1 do
     for j:=1 to size do
      read(f,showsb[j,i]);
    isend:=true;
    while isend do
     begin
      readln(f,str);
      if str<>'-1' then memo1.Lines.Add(str)
       else isend:=false;
     end;
    readln(f,life,hitpoints,maxhitpoints,ropes,keys,gold,torch,bulb,rocks,guns,dz,winem,curem,minem,lightm,lt,win,pat,pbt,pct,pdt);
    if lt=1 then lh:=true else lh:=false;
    if pat=1 then pa:=true else pa:=false;
    if pbt=1 then pb:=true else pb:=false;
    if pct=1 then pc:=true else pc:=false;
    if pdt=1 then pd:=true else pd:=false;
    readln(f,x,y);
    while not eof(f) do
     begin
      read(f,xp,yp,fcansay,hints[xp,yp]);
      if fcansay=0 then cansay[xp,yp]:=false else cansay[xp,yp]:=true;
     end;
    closefile(f);
   except
    showmessage('读取失败!');
    exit;
   end;
   showmessage('读取成功!');
 //  N9.Enabled:=true;
  end;
end; }

{procedure TForm1.N5Click(Sender: TObject);
var f:textfile;
    i,j:integer;
begin
 if savedialog1.Execute then
  try
   assignfile(f,savedialog1.FileName);rewrite(f);
   writeln(f,size);
   for i:=size downto 1 do
    begin
     for j:=1 to size do write(f,a[j,i],' ');
     writeln(f);
    end;
   for i:=size downto 1 do
    begin
     for j:=1 to size do if not(sb[j,i].Flat) then write(f,1,' ') else if sb[j,i].Glyph.Empty then write(f,0,' ') else write(f,2,' ');
     writeln(f);
    end;
   i:=0;
   while memo1.Lines[i]<>'' do
    begin
     writeln(f,memo1.lines[i]);
     inc(i);
    end;
   writeln(f,-1);
   if lh=true then lt:=1 else lt:=0;
   if pa=true then pat:=1 else pat:=0;
   if pb=true then pbt:=1 else pbt:=0;
   if pc=true then pct:=1 else pct:=0;
   if pd=true then pdt:=1 else pdt:=0;
   writeln(f,life,' ',hitpoints,' ',maxhitpoints,' ',ropes,' ',keys,' ',gold,' ',torch,' ',bulb,' ',rocks,' ',guns,' ',dz,' ',winem,' ',curem,' ',minem,' ',lightm,' ',lt,' ',win,' ',pat,' ',pbt,' ',pct,' ',pdt);
   writeln(f,x,' ',y);
   for i:=1 to size do
    for j:=1 to size do
     if hints[i,j]<>'' then
      writeln(f,i,' ',j,' ',byte(cansay[i,j]),hints[i,j]);
   closefile(f);
   showmessage('保存成功!');
  except
   showmessage('保存失败!');
  end;
end;}

procedure TForm1.N9Click;
var i1,i2:integer;
begin
 if start then
  begin
   if messagebox(form1.Handle,'确定要放弃本局游戏吗?','询问',mb_yesno+mb_iconquestion)=7 then exit;
   image1.Picture:=nil;
   Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;Button5.Visible:=false;
 //  N9.Caption:='开始游戏';N9.Enabled:=false;
   Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
 //  N3.Enabled:=true;N4.Enabled:=true;
   n11.Enabled:=true;groupbox2.Visible:=false;
   groupbox3.Visible:=false;groupbox4.Visible:=false;groupbox5.Visible:=false;
   label8.Visible:=false;//N5.Enabled:=false;
   button11.Enabled:=false;button14.Enabled:=false;
   Label2.Caption:='本游戏版权所有！'+chr(13)+chr(10)+'未经作者允许不得翻录！';
   memo1.Clear;
   for i1:=1 to size do
    for i2:=1 to size do
     sb[i1,i2].Destroy;
   image2.Canvas.FillRect(image2.Canvas.ClipRect);
   image2.Picture:=nil;
   start:=false;exit;
  end;
 Label5.Caption:='绳子：'+inttostr(ropes);Label6.Caption:='※：'+inttostr(life);
 Label7.Caption:='生命值：'+inttostr(hitpoints);Label8.Caption:='你的位置：（'+inttostr(x)+','+inttostr(y)+'）';
 Label9.Caption:='钥匙：'+inttostr(keys);Label10.Caption:='金币：'+inttostr(gold);
 label11.Caption:='手电筒：'+inttostr(torch)+'  ';if torch>0 then button11.Enabled:=true;
 label3.Caption:='灯泡：'+inttostr(bulb)+'  ';if bulb>0 then button14.Enabled:=true;
 label8.Visible:=true;groupbox2.Visible:=true;groupbox3.Visible:=true;
 Button7.Enabled:=false;Button8.Enabled:=false;Button7.Visible:=false;Button8.Visible:=false;
// N9.Caption:='放弃游戏';
 fish:=true;find:=false;goldnumber:=[2,3,4];
// N9.Enabled:=true;N5.Enabled:=true;N3.Enabled:=false;N4.Enabled:=false;
 n11.Enabled:=false;
 for i1:=1 to size do
  for i2:=1 to size do
   begin
    sb[i1,i2]:=Tspeedbutton.create(form1);
    with sb[i1,i2] do
     begin
      parent:=form1;name:='sb'+inttostr(i1*size+i2-size);
      left:=269+20*i1;top:=size*20-i2*20+9;width:=20;height:=20;
      onclick:=sbclick;groupindex:=1;
     end;
    if showsb[i1,i2]=1 then begin sb[i1,i2].Flat:=false; sb[i1,i2].tag:=1; end
     else
      begin
       sb[i1,i2].Flat:=true;sb[i1,i2].Tag:=0;
       if showsb[i1,i2]=2 then sb[i1,i2].Glyph:=wall;
      end;
   end;
 image2.Height:=size*20+10;
 image2.Width:=size*20+10;
 with image2.Canvas do
  begin
   pen.Width:=5;moveto(3,3);
   lineto(size*20+8,3);lineto(size*20+8,size*20+8);lineto(3,size*20+8);lineto(3,3);
  end;
 if win=0 then
  begin
   sb[x,y].Flat:=false;sb[x,y].Down:=true;sb[x,y].Tag:=1;
   if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
   if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
   if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
   if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
   n2.Enabled:=true;
   Image1.Picture.Bitmap:=s0;
   label2.Caption:='开始游戏，祝你好运！';
  end
  else
   begin
    Label2.Caption:='祝贺你！你走到了终点！';
    Button1.Enabled:=false;Button2.Enabled:=false;Button3.Enabled:=false;Button4.Enabled:=false;
    button11.Enabled:=false;button14.Enabled:=false;
    n2.Enabled:=false;
    for i1:=1 to size do
     for i2:=1 to size do
      sb[i1,i2].Enabled:=false;
   end;
 button5.Visible:=true;button5.SetFocus;button5.Visible:=false;start:=true;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 form2.Show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if fight=false then
    begin
      N01.Enabled:=false;
      N02.Enabled:=false;
      N03.Enabled:=false;
      N04.Enabled:=false;
      N07.Enabled:=false;
    end;
  if fight=true then
    begin
      N01.Enabled:=true;
      N02.Enabled:=true;
      N03.Enabled:=true;
      N04.Enabled:=true;
      N07.Enabled:=true;
    end;
  if rocks=0 then N01.Enabled:=false;
  if guns=0 then N03.Enabled:=false;
  if dz=0 then N04.Enabled:=false;
  if winem=0 then N05.Enabled:=false;
  if curem=0 then N06.Enabled:=false;
  if minem=0 then N07.Enabled:=false;
  if lightm=0 then N02.Enabled:=false;
  if winem>0 then N05.Enabled:=true;
  if curem>0 then N06.Enabled:=true;
  if minem>0 then N07.Enabled:=true;
  if lightm>0 then N02.Enabled:=true;
  if pa=true then begin N05.Visible:=true;N06.Visible:=true;end;
  if pb=true then begin N07.Visible:=true;end;
  if pc=true then begin N02.Visible:=true;end;
  if pa=false then begin N05.Visible:=false;N06.Visible:=false;end;
  if pb=false then begin N07.Visible:=false;end;
  if pc=false then begin N02.Visible:=false;end;
  N01.Caption:='石头（'+inttostr(rocks)+'）';
  N02.Caption:='闪光灯（'+inttostr(lightm)+'）';
  N03.Caption:='手枪（'+inttostr(guns)+'）';
  N04.Caption:='毒针（'+inttostr(dz)+'）';
  N05.Caption:='酒（'+inttostr(winem)+'）';
  N06.Caption:='急救箱（'+inttostr(curem)+'）';
  N07.Caption:='地雷（'+inttostr(minem)+'）';
end;

procedure TForm1.N01Click(Sender: TObject);
begin
  rocks:=rocks-1;
  randomize;
  at:=random(3)+4;
  fight_;
end;

procedure TForm1.N03Click(Sender: TObject);
begin
  guns:=guns-1;
  randomize;
  at:=random(10);
  fight_;
end;

procedure TForm1.N04Click(Sender: TObject);
begin
  dz:=dz-1;
  at:=1;
  pon:=true;
  fight_;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 winexec(pchar(ExtractFilePath(application.ExeName)+'Project1.exe'),sw_show);
 cq:=true;
 close;
end;

procedure TForm1.N06Click(Sender: TObject);
begin
  curem:=curem-1;
  Label2.Caption:='你使用了一个急救箱！';
  hitpoints:=hitpoints+15;
  Label7.Caption:='生命值：'+inttostr(hitpoints);
end;

procedure TForm1.N07Click(Sender: TObject);
begin
  minem:=minem-1;
  N2.Click;
  Label2.Caption:='轰...怪兽失去了一半的生命值！';
  monsterlife:=(monsterlife+1) div 2;
  Label16.Caption:='生命值：'+inttostr(monsterlife);
end;

procedure TForm1.N02Click(Sender: TObject);
var i:integer;
begin
  lightm:=lightm-1;
  memo1.Lines.Add('('+inttostr(x)+','+inttostr(y)+'):');
  for i:=1 to 3 do
  if y+i<=size then memo1.Lines.Add('北边第'+inttostr(i)+'格是'+thing(x,y+i));
  radiobutton3.Checked:=false;groupbox4.Visible:=false;
  for i:=1 to 3 do
  if y-i>=1 then memo1.Lines.Add('南边第'+inttostr(i)+'格是'+thing(x,y-i));
  radiobutton4.Checked:=false;groupbox4.Visible:=false;
  for i:=1 to 3 do
  if x-i>=1 then memo1.Lines.Add('西边第'+inttostr(i)+'格是'+thing(x-i,y));
  radiobutton5.Checked:=false;groupbox4.Visible:=false;
  for i:=1 to 3 do
  if x+i<=size then memo1.Lines.Add('东边第'+inttostr(i)+'格是'+thing(x+i,y));
  radiobutton6.Checked:=false;groupbox4.Visible:=false;
  if x+1<=size then if a[x+1,y]<>1 then Button4.Enabled:=true else sb[x+1,y].Glyph:=wall;
  if x-1>0 then if a[x-1,y]<>1 then Button3.Enabled:=true else sb[x-1,y].Glyph:=wall;
  if y+1<=size then if a[x,y+1]<>1 then Button1.Enabled:=true else sb[x,y+1].Glyph:=wall;
  if y-1>0 then if a[x,y-1]<>1 then Button2.Enabled:=true else sb[x,y-1].Glyph:=wall;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  pa:=true;
  Button10.Visible:=false;
  gold:=gold-7;
  Label10.Caption:='金币：'+inttostr(gold);         
  button5.SetFocus;
  swift;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  pb:=true;
  Button15.Visible:=false;
  gold:=gold-7;
  Label10.Caption:='金币：'+inttostr(gold);            
  button5.SetFocus;
  swift;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  pc:=true;
  gold:=gold-2;torch:=torch-1;bulb:=bulb-1;lightm:=lightm+1;
  Label10.Caption:='金币：'+inttostr(gold);
  label11.Caption:='手电筒：'+inttostr(torch)+'  ';if torch>0 then button11.Enabled:=true;
  label3.Caption:='灯泡：'+inttostr(bulb)+'  ';if bulb>0 then button14.Enabled:=true;
  button5.SetFocus;
  swift;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin          
  pd:=true;
  gold:=gold-7;
  Button6.Visible:=false;
  Label10.Caption:='金币：'+inttostr(gold);
  button5.SetFocus;
  swift;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 form3.Show;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
 fj:=true;
 //n3.Click;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 form4.Show;
end;

procedure TForm1.get;
var tf:textfile;
begin
 if (form1.Tag=1)or(form1.Tag=3) then
  begin
   assignfile(tf,'C:\WINDOWS\teach.txt');
   rewrite(tf);
   write(tf,0);
   closefile(tf);
  end;
 if form1.Tag>=2 then
  N11.Click;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
 if combobox1.ItemIndex=-1 then exit;
 label4.Visible:=true;
 memo1.Visible:=true;
 image1.Visible:=true;
 image2.Visible:=true;
 label1.Visible:=true;
 label2.Visible:=true;
 button1.Visible:=true;
 button2.Visible:=true;
 button3.Visible:=true;
 button4.Visible:=true;
 n1.Visible:=true;
 combobox1.Visible:=false;
 button18.Visible:=false;
 button19.Visible:=false;
 randomize;
 case combobox1.ItemIndex of
  0:begin
     jiang:=2;
     n3click(extractfilepath(application.ExeName)+'地图/a'+inttostr(random(3)+1)+'.txt');
    end;
  1:begin
     n3click(extractfilepath(application.ExeName)+'地图/b'+inttostr(random(3)+1)+'.txt');
     jiang:=4;
    end;
  2:begin
     n3click(extractfilepath(application.ExeName)+'地图/c'+inttostr(random(3)+1)+'.txt');
     jiang:=6;
    end;
 end;
 fteach:=false;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
 label4.Visible:=true;
 memo1.Visible:=true;
 image1.Visible:=true;
 image2.Visible:=true;
 label1.Visible:=true;
 label2.Visible:=true;
 button1.Visible:=true;
 button2.Visible:=true;
 button3.Visible:=true;
 button4.Visible:=true;
 n1.Visible:=true;
 combobox1.Visible:=false;
 button18.Visible:=false;
 button19.Visible:=false;
 n3click(extractfilepath(application.ExeName)+'地图/教程.txt');
 fteach:=true;
end;

end.
