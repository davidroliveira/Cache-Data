unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    CacheImages: TDictionary<Int64, TStrings>;
    GarbageCollectionObjectList: TObjectList<TStrings>;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  CacheImages := TDictionary<Int64, TStrings>.Create;
  GarbageCollectionObjectList := TObjectList<TStrings>.Create;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CacheImages.Free;
  GarbageCollectionObjectList.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  var Stringona := TStringList.Create;
  Stringona.Text := DateTimeToStr(now);
  CacheImages.AddOrSetValue(CacheImages.Count + 1, Stringona);
  CacheImages.TrimExcess;
  GarbageCollectionObjectList.Add(Stringona);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  var Chave := Random(CacheImages.Count)+1;
  try
    var Conteudo := CacheImages.ExtractPair(Chave).Value.Text;
    ShowMessage(chave.ToString + ': ' + Conteudo);
  except
    ShowMessage(chave.ToString + ': NÃO EXISTE!');
  end;
end;

end.
