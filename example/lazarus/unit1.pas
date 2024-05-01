unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, DateUtils,
  Dialogs, StdCtrls, ExtCtrls, NanoID;


type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    NanoID1: TNanoID;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function formatelapsed(miliseken : int64): string;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
      Edit1.Clear;
      edit2.Clear;
      Memo1.Clear;
      memo2.Clear;
      Button1.Caption:='Generate';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   i,j,Asize,LoopSize : integer;
   id: String;
   idSet : array of String;
   idgenerateds : boolean;
   startTime,endTime : TDateTime;
   elapsed : int64;
begin
     if edit2.Text <> '' then
     Asize := StrToInt(edit2.Text);
     LoopSize := ASize -1;
     setlength(idSet,Asize);

     //nanoid.Create;

     try

       memo1.Clear;
       edit1.Clear;
       edit1.Text:= NanoID1.GeneratedRandom;

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
          until not idgenerateds;

          idSet[i] := id;
          memo1.lines.add(id);

          endTime:= now;
          elapsed := MilliSecondsBetween(endTime, startTime);
          Memo2.Lines.Add(IntToStr(elapsed div 1000));
        end;
       //elapsed := MilliSecondsBetween(endTime, startTime);
       Memo2.Lines.Add(formatelapsed(elapsed));
       finally
       //nanoid.Free;
    end;
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

