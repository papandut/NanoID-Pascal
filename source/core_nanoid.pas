unit core_nanoid;

{$mode objfpc}{$H+}
{
 type INumGen as a interface
}
interface

uses
  Classes,SysUtils;

const
  SAFE_SYMBOLS = '_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  MASKS: array[0..4] of Byte = (15, 31, 63, 127, 255);

type
  INumGen = interface
  ['{4BCD6B1F-8A69-49A9-A33D-C2FFDF4A9D03}']
  function RandomNumber(size: Integer):TBytes;
  function RandomGenerator(size: Integer; alphabet: string = SAFE_SYMBOLS): string;
  end;

  {ICoreInterface = interface
  ['{30D84A99-C11D-4B2D-A36E-8DDC276DCEFF}']
  function RandomNumber(generator: INumGen; size: Integer; alphabet: string = SAFE_SYMBOLS): string;
  end;}

implementation

end.

