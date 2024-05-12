unit example;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, nanoID, System.DateUtils;

type
  TForm1 = class(TForm)
    NanoID1: TNanoID;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Edit2: TEdit;
    Memo2: TMemo;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function formatelapsed(miliseken : int64): string;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   i,j,Asize,LoopSize : integer;
   id: String;
   idSet : array of String;
   idgenerateds : boolean;
   startTime,endTime : TDateTime;
   elapsed : int64;
begin
     if edit1.Text <> '' then
     begin
     Asize := StrToInt(edit1.Text);
     LoopSize := ASize -1;
     setlength(idSet,Asize);

     //nanoid.Create;

         try

           memo1.Clear;
           edit2.Clear;
           edit2.Text:= NanoID1.GeneratedRandom;

           startTime := now;

           for i:= 0 to LoopSize do
            begin
              repeat
                id := nanoid1.GeneratedRandom;
                idgenerateds := false;
                for j:= 0 to i - 1 Do
                 begin
                   if pos(id,idSet[j]) > 0 then
                   begin
                        idgenerateds := true;
                        break;
                   end;
                 end;
              until not idgenerateds and (id <>'');

              if id <>'' then
              begin
                idSet[i] := id;
                memo1.lines.add(id);
              end;
              endTime:= now;
              elapsed := MilliSecondsBetween(endTime, startTime);
//              Memo2.Lines.Add(IntToStr(elapsed div 1000));
            end;
           elapsed := MilliSecondsBetween(endTime, startTime);
           Memo2.Text:= formatelapsed(elapsed);
           finally
           //nanoid.Free;
        end;

     end else
     begin
          exit;
     end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      Edit1.Clear;
      Edit2.Clear;
      Memo1.Clear;
      Memo2.Clear;
      Button1.Caption:='Generate';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     edit2.Text := NanoId1.GeneratedRandom;
end;

function TForm1.formatelapsed(miliseken: int64): String;
var
   jam, menit,detik : integer;
begin
     jam := miliseken div 3600000;
     miliseken:= miliseken mod 3600000;

     menit := miliseken div 60000;
     miliseken := miliseken mod 60000;

     detik := miliseken div 1000;

     result:='';

     if jam > 0 then
     Result := IntToStr(jam) + ' Jam ';

     if (menit > 0) or (jam > 0) then
     Result := Result + IntToStr(menit) + ' Menit ';

     Result := Result + IntToStr(detik) + ' Detik';

end;

end.
