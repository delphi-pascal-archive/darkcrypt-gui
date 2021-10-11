unit wrxdcwcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wcxhead;

function unpackthisfileto(archive: string; todir: string): string;
function PackFiles(PackedFile_, SubPath_, SrcPath_, AddList_: PChar;
  Flags: integer): integer; stdcall;

function OpenArchive(var ArchiveData: TOpenArchiveData): integer;
  stdcall; external 'somelibs\darkcryptrtc.wcx';
function CloseArchive(hArcData: integer): integer; stdcall; external 'somelibs\darkcryptrtc.wcx';
function ReadHeader(hArcData: integer; var HeaderData: THeaderData): integer;
  stdcall; external 'somelibs\darkcryptrtc.wcx';
function ProcessFile(hArcData: integer; Operation: integer; DestPath: PChar;
  DestName: PChar): integer; stdcall; external 'somelibs\darkcryptrtc.wcx';
function PackFiles(PackedFile_, SubPath_, SrcPath_, AddList_: PChar;
  Flags: integer): integer; stdcall; external 'somelibs\darkcryptrtc.wcx';
procedure SetProcessDataProc(hArcData: integer; ProcessDataProc: TProcessDataProc);
  stdcall; external 'somelibs\darkcryptrtc.wcx';
procedure ConfigurePacker(Parent: HWND; DLLinstance: integer); stdcall;
  stdcall; external 'somelibs\darkcryptrtc.wcx';


function PDPWrap(FileName: PChar; Size: longint): longint; stdcall;

var pp: TProcessDataProc;
var datasize: integer;




implementation





function PDPWrap(FileName: PChar; Size: longint): longint; stdcall;
begin
pp(FileName, Size);
end;

function unpackthisfileto(archive: string; todir: string): string;
var
  ad: TOpenArchiveData;
  h:  longint;
  hd: THeaderData;
begin
  Result := '';
  FillChar(ad, sizeof(ad), 0);
  ad.OpenMode := PK_OM_EXTRACT;
  ad.ArcName := PChar(archive);
  h := openarchive(ad);
  if h <> 0 then
    begin
    SetProcessDataProc(h, pdpwrap);
    FillChar(hd, sizeof(hd), 0);
    if ReadHeader(h, hd) = 0 then
      begin
      datasize:=hd.UnpSize;
      PDPWrap('',-101);
      FileSetReadOnly(PChar(SysUtils.IncludeTrailingBackslash(todir) +
        hd.FileName), False);
      DeleteFile(PChar(SysUtils.IncludeTrailingBackslash(todir) + hd.FileName));
      if ProcessFile(h, PK_EXTRACT, nil, PChar(SysUtils.IncludeTrailingBackslash(
        todir) + hd.FileName)) = 0 then
        Result := hd.FileName;
      end;
    CloseArchive(h);
    end;
end;
initialization
    SetProcessDataProc(0, pdpwrap);
end.
