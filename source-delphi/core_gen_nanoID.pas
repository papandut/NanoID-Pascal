unit core_gen_nanoID;

interface

uses
Classes,SysUtils,core_NanoID,Math;

type
  TNumGen = class(TInterfacedObject,INumGen)
    public
      function RandomNumber(size: Integer ):TBytes;
      function RandomGenerator(size: Integer; alphabet: string = SAFE_SYMBOLS): string;
end;

implementation

function TNumGen.RandomNumber(size: Integer): TBytes;
var
    i : Integer;
    randomBytes : TBytes;
begin
     SetLength(RandomBytes, size);
     randomize;

     for i := 0 to size - 1 do
     begin
          RandomBytes[i] := Byte(Random(256));
     end;

     Result := RandomBytes;
end;

function TNumGen.RandomGenerator(size: Integer; alphabet: string = SAFE_SYMBOLS): string;
var
    len, mask, step, maxIterasi, charIndex, j,i: Integer;
    bytes: TBytes;
    id: string;
begin
    len := Length(alphabet);
    mask := (2 shl Trunc(Ln(len - 1) / Ln(2))) - 1;
    step := Ceil(1.6 * mask * size / len);
    maxIterasi := size * 5;
    id := '';

    for i:= 0 to maxIterasi do
    begin
      bytes := RandomNumber(step);

      for j := 0 to High(bytes) do
      begin

        charIndex:= bytes[j] and mask;
        if charIndex < len then;
        begin
           id := id + alphabet[charIndex];
           if Length(id) = size then
           result := id;
           exit;
            end;
        end;
    end;

    Result := '';
end;
end.