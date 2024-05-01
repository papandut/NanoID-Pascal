unit NanoID;

{$mode ObjFPC}{$H+}

{
 Impelmentation of nanoid used in node.js into Pascal language
 original project on https://github.com/ai/nanoid

 code by Erwin Siregar
 17042024
}

interface

uses
  Classes,SysUtils,core_gen_nanoid,core_nanoid,Dialogs;

type

  TNanoIDMode = (MODE_NORMAL,MODE_DYNAMIC);
  TNanoID = class(TComponent)
  private
    FSize : integer;
    FDefaultSize : Integer;
    FAlphabet : string;
    FDefaultAlphabet : String;
    FMode : TNanoIDMode;
    FName : string;
    procedure ModeChange;
    procedure SetMode(Const Value: TNanoIDMode);

  protected
    FVersion : string;

  public
    constructor Create(AOwner: TComponent); override;
    function GeneratedRandom: string;

  published
    property Name: String read FName write FName;
    property Size: Integer read FSize write FSize default 21;
    property Alphabet: string read FAlphabet write FAlphabet;
    property Mode: TNanoIDMode read FMode write SetMode default MODE_DYNAMIC;
    property Version : String read FVersion;

  end;

procedure Register;

implementation

constructor TNanoID.Create(AOwner : TComponent);
begin
     inherited create(AOwner);
     FSize := 21;
     FDefaultSize := 21;
     FDefaultAlphabet := core_nanoid.SAFE_SYMBOLS;
     FAlphabet := core_nanoid.SAFE_SYMBOLS;
     FMode := MODE_DYNAMIC;
     FName := 'NanoID';
     FVersion := '0.1';

end;

function TNanoID.GeneratedRandom: String;
var
   NumGen : TNumGen;
   NanoId : String;
begin
    NumGen := TNumGen.Create;

    try
    //change FMode
    case FMode of

    MODE_NORMAL: //MODE NORMAL Default FSize 21 and Alphabet;
    begin;
          NanoID := NumGen.RandomGenerator(FSize,FAlphabet);

          while length(NanoID) < Fsize do
          begin
               NanoId := NanoId + FAlphabet[Random(length(FAlphabet))+1];
          end;
          if length(NanoID) > FSize then
          begin
              NanoID := Copy(NanoID,1,FSize);
          end;
        //end case MODE NORMAL;

    end;

    MODE_DYNAMIC: //MODE DYNAMIC based on  Custom Fsize & FAlphabet
    begin
         NanoID := NumGen.RandomGenerator(Fsize,FAlphabet);

         while Length(NanoID) < FSize do
         begin
              NanoId := NanoId + FAlphabet[Random(length(FAlphabet))+1];
         end;

         if length(NanoId) > FSize then
         begin
              NanoID := Copy(NanoID,1,FSize);
         end;
    end;
    //end case MODE DYNAMIC

    end;
        Result := NanoID;

    except
      on E: Exception Do
      begin
           result :='';
           ShowMessage('Cannot generate NanoID or ID '+ E.Message);
           exit;
      end;
    end;
    numgen.Free;
end;

procedure TNanoID.ModeChange;
begin
      case FMode of
      MODE_NORMAL:
      begin
           FSize := FDefaultSize;
           FAlphabet:= FDefaultAlphabet;
           {if (csDesigning in ComponentState) and not(csLoading in ComponentState) then
           begin
                //MessageDlg('MODE NORMAL, you cannot change Size & Alphabet Value',MtInformation,[mbOK],1);
                Fsize
           end;}
      end;

      MODE_DYNAMIC:
      begin
           FSize:= FSize;
           FAlphabet:= FAlphabet;
      end;

      end;
end;

procedure TNanoID.SetMode(Const Value : TNanoIDMode);
begin
     if Value = MODE_NORMAL then
     begin
          FMODE := Value;
          ModeChange;
     end else
     begin
          FMode := MODE_DYNAMIC;
          ModeChange;
     end;
end;

procedure Register;
begin
  RegisterComponents('zaniDEV',[TNanoID]);
end;

end.
