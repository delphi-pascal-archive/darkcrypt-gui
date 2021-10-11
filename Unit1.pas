unit Unit1;

interface

uses
  FileCtrl,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ShellApi,wrxdcwcx, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Openfile1: TMenuItem;
    About1: TMenuItem;
    Seeinfo1: TMenuItem;
    pb: TProgressBar;
    Settings1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Seeinfo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Openfile1Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
procedure  processfile(fn: string);
    protected
  procedure WMDropFiles (var Msg: TMessage); message wm_DropFiles;


  end;




function Process(FileName: PChar; Size: longint): longint; stdcall;

var
  Form1: TForm1;

implementation


function FileSizeByName(const AFilename: string): int64;
begin
  with TFileStream.Create(AFilename, fmOpenRead or fmShareDenyNone) do
    try
      Result := Size;
    finally
      Free;
      end;
end;


function process(FileName: PChar; Size: longint): longint;
begin
application.ProcessMessages;
if size=-101 then begin form1.pb.Max:=datasize;
form1.pb.Position:=0;
end else begin
if size<0  then begin
form1.pb.Position:=Trunc(datasize*(abs(size)/100));
end else begin
form1.pb.Position:=form1.pb.Position+Size;
end;
end;

end;


procedure TForm1.processfile(fn: string);
var todir: string;sd: TSaveDialog;
begin
form1.pb.Position:=0;


if (ansilowercase(extractfileext(fn)) = '.xdc') then
    begin
label1.Caption:='unpacking...';
    todir:='';
    SelectDirectory('Select target directory','',todir);
    if wrxdcwcx.unpackthisfileto(fn, todir)='' then begin
    ShowMessage('I can''t decrypt this file:'+#13+'Maybe, wrong password or corrupted data.');
    end;
    end else begin
    sd:=TSaveDialog.Create(nil);
    sd.Filter:='Encrypted XDC (*.xdc)|*.xdc';
    sd.Title:='Where to store encrypted file';
    sd.DefaultExt:='xdc';
    if sd.Execute then begin
label1.Caption:='packing...';
    datasize:=FileSizeByName(fn);
    SetProcessDataProc(1, pdpwrap);
    process('',-101);
    wrxdcwcx.PackFiles(pchar(sd.FileName),nil,pchar(extractfilepath(fn)),pchar(extractfilename(fn)+#0#0),0);
    end;
    sd.Free;
    end;
label1.Caption:='waiting...';
end;


procedure TForm1.WMDROPFILES(var Msg: TMessage);
var
  i, amount, size: integer;
  Filename: PChar;
begin
  inherited;
  Amount := DragQueryFile(Msg.WParam, $FFFFFFFF, Filename, 255);
if amount>0 then
  begin
    size := DragQueryFile(Msg.WParam, 0, nil, 0) + 1;
    Filename := StrAlloc(size);
    DragQueryFile(Msg.WParam, 0, Filename, size);
    ProcessFile(FileName);
    StrDispose(Filename);
  end;
  DragFinish(Msg.WParam);
end;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
DragAcceptFiles(Handle, true);
pp:=process;
end;

procedure TForm1.Settings1Click(Sender: TObject);
begin
ConfigurePacker(handle,0);
end;

procedure TForm1.Seeinfo1Click(Sender: TObject);
begin
shellapi.ShellAbout(handle,'DarkCrypt-GUI',Pchar('Simple GUI for DarkCryptTC'+#13+'Web: www.darksoftware.narod.ru'),application.Icon.Handle)

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
onactivate:=nil;
if fileexists(paramstr(1)) then begin
processfile(paramstr(1));
end;
end;

procedure TForm1.Openfile1Click(Sender: TObject);
var od: TOpenDialog;
begin
od:=TOpenDialog.Create(nil);
od.Title:='Select file for encryption or decryption';
od.Filter:='Any RAW file (*.*)|*|Encrypted XDC (*.xdc)|*.xdc';
if od.Execute then begin
processfile(od.FileName);
end;
od.Free;
end;

procedure TForm1.Label2MouseEnter(Sender: TObject);
begin
(Sender as TLabel).Font.Color:=clRed;
end;

procedure TForm1.Label2MouseLeave(Sender: TObject);
begin
(Sender as TLabel).Font.Color:=clBlack;
end;

end.
