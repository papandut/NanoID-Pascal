{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit nanoID_pascal;

{$warn 5023 off : no warning about unused units}
interface

uses
  NanoID, core_nanoid, core_gen_nanoid, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('NanoID', @NanoID.Register);
end;

initialization
  RegisterPackage('nanoID_pascal', @Register);
end.
