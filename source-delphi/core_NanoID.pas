unit core_NanoID;

interface
{
type InumGen as a Interface
}

uses
Classes,SysUtils;

Const
SAFE_SYMBOLS = '_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
MASKS: array[0..4] of Byte = (15, 31, 63, 127, 255);

type
  INumGen = interface
  ['{4BCD6B1F-8A69-49A9-A33D-C2FFDF4A9D03}']
  function RandomNumber(size: Integer):TBytes;
  function RandomGenerator(size: Integer; alphabet: string = SAFE_SYMBOLS): string;
  end;

implementation

end.
