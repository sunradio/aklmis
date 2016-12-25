unit Returnlog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, PSQLDbTables, DB, Mask, DBCtrls,
  ToolWin, Grids, DBGrids, DBGridPlus,StrUtils, frxClass, frxDBSet,
  frxExportPDF, frxExportRTF;

type
  TSVR002 = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    DataSource1: TDataSource;
    PSQLQuery1: TPSQLQuery;
    PSQLUpdateSQL1: TPSQLUpdateSQL;
    DBEdit1: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBMemo1: TDBMemo;
    DBComboBox3: TDBComboBox;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    Label12: TLabel;
    Label19: TLabel;
    DBComboBox4: TDBComboBox;
    Label8: TLabel;
    DBCheckBox1: TDBCheckBox;
    PSQLQuery2: TPSQLQuery;
    DataSource2: TDataSource;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBText3: TDBText;
    Button4: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    PSQLQuery2ab02: TStringField;
    PSQLQuery2ab06: TStringField;
    PSQLQuery2ab08: TBooleanField;
    PSQLQuery2ab01: TStringField;
    ToolBar2: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    DBComboBox5: TDBComboBox;
    Label10: TLabel;
    Button1: TButton;
    TabSheet2: TTabSheet;
    DBGridPlus1: TDBGridPlus;
    Button2: TButton;
    GroupBox2: TGroupBox;
    DBText4: TDBText;
    Button3: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ToolButton1: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1StateChange(Sender: TObject);
    procedure PSQLQuery1AfterScroll(DataSet: TDataSet);
    procedure PSQLQuery1BeforeDelete(DataSet: TDataSet);
    procedure PSQLQuery1BeforeCancel(DataSet: TDataSet);
    procedure PSQLQuery1AfterOpen(DataSet: TDataSet);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure PSQLQuery1NewRecord(DataSet: TDataSet);
    procedure ToolButton15Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure PSQLQuery1AfterEdit(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure DBGridPlus1MouseWheel(Sender: TObject;
      const Difference: Integer);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure PSQLQuery1BeforePost(DataSet: TDataSet);
    procedure PSQLQuery1BeforeEdit(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SVR002: TSVR002;

Const
  DeleteCfm = '%s, 确认要删除 %S 记录？';
  IfmCaption= '提示';
  ExitMsg   = '%S, 资料未保存无法退出。';
  CancelMsg = '%s, 资料未保存确认放弃？';

  FormCaption = '选择日期';

  strEdit    = '编辑';
  strInsert  = '新增';
  strBrowse  = '浏览';
  strOpening = '打开中...';
  strInactive= '关闭';
  
implementation
Uses DataModule,Common,GetDateP,DialogSvr002,DialogASVR002;
{$R *.dfm}

procedure TSVR002.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  SVR002:=NIL;
end;

procedure TSVR002.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if PSQLQuery1.State in [ dsEdit, dsInsert] then begin
   Application.MessageBox(PChar(Format(ExitMsg,[CurrentUName])),
                          PChar(IfmCaption),
                          MB_ICONEXCLAMATION+MB_OK);
   CanClose:=False;
 end;
end;

procedure TSVR002.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then  begin
     Key := #0; 
     Perform(WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure TSVR002.DataSource1StateChange(Sender: TObject);
Var
  DataState:String;
begin
  case PSQLQuery1.State  of
    dsInactive:DataState:=strInactive;
    dsEdit:DataState:=strEdit;
    dsInsert:DataState:=strInsert;
    dsBrowse:DataState:=strBrowse;
    dsOpening:DataState:=strOpening;
  end;
  StatusBar1.Panels[1].Text:=DataState;

end;

procedure TSVR002.PSQLQuery1AfterScroll(DataSet: TDataSet);
begin
  ViewRecNo(StatusBar1,0,Dataset.RecNo,Dataset.RecordCount);
end;

procedure TSVR002.PSQLQuery1BeforeDelete(DataSet: TDataSet);
var
  FormName,TDAction:String;
  ABlValue:Boolean;
begin
  FormName:='SVR002';
  TDAction:='D';

  if not ChkUserGrant(CurrentUID,FormName,TDAction) then begin
    ShowNoGrantMsg(CurrentUName,FormName,TDAction);
    Abort;
  end else begin
   ABLValue:=DBCheckBox1.Checked;
   if  not ABlValue then begin
     if Application.MessageBox(PCHAR(Format(DeleteCfm,[CurrentUName,Dataset.Fields[2].AsString ])),
                            PCHAR(IfmCaption),
                            MB_ICONQUESTION+MB_YESNO)=ID_NO then
     Abort;
   end else begin
     abort;
   end;
  end;    
end;

procedure TSVR002.PSQLQuery1BeforeCancel(DataSet: TDataSet);
begin
  if Application.MessageBox(PCHAR(Format(CancelMsg,[CurrentUName,Dataset.Fields[2].AsString ])),
                            PCHAR(IfmCaption),
                            MB_ICONQUESTION+MB_YESNO)=ID_NO then begin
     Abort;
  end;
end;

procedure TSVR002.PSQLQuery1AfterOpen(DataSet: TDataSet);
begin
  if Not PSQLQuery2.Active then  PSQLQuery2.Open;
  Dataset.FieldByName('log14').DisplayLabel:='年月';
  Dataset.FieldByName('log03').DisplayLabel:='品号';
  Dataset.FieldByName('log031').DisplayLabel:='品名';
  Dataset.FieldByName('log04').DisplayLabel:='来源';
  Dataset.FieldByName('log10').DisplayLabel:='原因';
  Dataset.FieldByName('log05').DisplayLabel:='类别';
  Dataset.FieldByName('log11').DisplayLabel:='编号';
  Dataset.FieldByName('log06').DisplayLabel:='备注';

  Dataset.FieldByName('log03').DisplayWidth:=12;
  Dataset.FieldByName('log031').DisplayWidth:=10;
  Dataset.FieldByName('log04').DisplayWidth:=10;
  Dataset.FieldByName('log10').DisplayWidth:=10;
  Dataset.FieldByName('log05').DisplayWidth:=10;
  Dataset.FieldByName('log11').DisplayWidth:=10;
  Dataset.FieldByName('log06').DisplayWidth:=30;

  with DBGridPlus1 do
  begin
    Columns[0].FieldName:='LOG14';
    Columns[1].FieldName:='LOG03';
    Columns[2].FieldName:='LOG031';
    Columns[7].FieldName:='LOG04';
    Columns[6].FieldName:='LOG10';
    Columns[5].FieldName:='LOG05';
    Columns[3].FieldName:='LOG11';
    Columns[4].FieldName:='LOG06';
  end;

end;

procedure TSVR002.DBLookupComboBox1DropDown(Sender: TObject);
begin
  if Not PSQLQuery2.Active then  PSQLQuery2.Open;
end;

procedure TSVR002.ToolButton14Click(Sender: TObject);
begin
  Close;
end;

procedure TSVR002.PSQLQuery1NewRecord(DataSet: TDataSet);
var
  AIntRec,i:Integer;
  AStrSQL,AYearMonth,AStrRec:String;
begin
  AYearMonth:=GetYearMonthEx;
  AStrSQL:=Format('SELECT COUNT(*) FROM MFLOG WHERE LOG14=''%S''',[AYearMonth]);
  i:=DM.GetQueryValue(AStrSQL);
  if  i > 0 then begin
     AStrSQL:=Format('SELECT MAX(CAST(RIGHT(LOG11,3) AS INTEGER))+1 FROM MFLOG WHERE LOG14=''%S''',[AYearMonth]);
     AIntRec:=DM.GetQueryValue(AStrSQL);
  end else begin
     AIntRec:=1
  end;

  AStrRec:=RightStr(AYearMonth,4)+'-'+FillLeftStr(3,IntToStr(AIntRec),'0');
  Dataset.FieldByName('log09').AsString:='退货';
  Dataset.FieldByName('log11').AsString:=AStrRec;
  Dataset.FieldByName('log13').AsBoolean:=False;
  Dataset.FieldByName('log14').AsString:=AYearMonth;
  Dataset.FieldByName('loguser').AsString:=CurrentUName;
  Dataset.FieldByName('logdate').AsDateTime:=Now;
end;

procedure TSVR002.ToolButton15Click(Sender: TObject);
begin
  if Not PSQLQuery1.Active then  PSQLQuery1.Open;
  PSQLQuery1.Insert;
end;

procedure TSVR002.Button4Click(Sender: TObject);
var
  AStrSQL,AYearMonth,AModeDesc,ACtnNo:String;
begin


 if GetReturnQuery(AYearMonth,AModeDesc,ACtnNo) then begin
   if ACtnNo<>'' then begin
    AStrSQL:='SELECT *                 '+
          '  FROM MFlog                '+
          ' WHERE LOG14  LIKE ''%S%S'' '+
          '   AND LOG031 LIKE ''%S%S'' '+
          '   AND LOG11  = ''%S''      '+
          ' ORDER BY LOG01 DESC';
   end else begin
    AStrSQL:='SELECT *                 '+
          '  FROM MFlog                '+
          ' WHERE LOG14  LIKE ''%S%S'' '+
          '   AND LOG031 LIKE ''%S%S'' '+
          ' ORDER BY LOG01 DESC';

   end;

 if (AYearMonth<>'') or  (AModeDesc<>'') or (ACtnNo<>'')  then begin
 if PSQLQuery1.Active then  PSQLQuery1.Close;
 with PSQLQuery1 do
 begin
   SQL.Clear;
    if ACtnNo<>'' then begin
     SQL.Add(Format(AStrSQL,[AYearMonth,'%',AModeDesc,'%',ACtnNo]));
    end else begin
     SQL.Add(Format(AStrSQL,[AYearMonth,'%',AModeDesc,'%']));
    end;
   Open;
 end;
 end;

 end;
end;

procedure TSVR002.PSQLQuery1AfterEdit(DataSet: TDataSet);
begin
  Dataset.FieldByName('loguser').AsString:=CurrentUName;
  Dataset.FieldByName('logdate').AsDateTime:=Now;
  DBText3.Caption:=PSQLQuery2.fieldbyName('AB02').AsString+' '+PSQLQuery2.fieldbyName('AB06').AsString;
end;

procedure TSVR002.Button1Click(Sender: TObject);
var
  AStrSQL,AStart,Aend:String;
begin

 if   Getdate(FormCaption,AStart,Aend) then begin
 AStrSQL:='SELECT * FROM MFlog WHERE LOGDATE BETWEEN ''%S'' AND ''%S'' ORDER BY LOG01 DESC';
 if PSQLQuery1.Active then  PSQLQuery1.Close;
 with PSQLQuery1 do
 begin
   SQL.Clear;
   SQL.Add(Format(AStrSQL,[AStart,Aend]));
   Open;
 end;

 end;
end;

procedure TSVR002.DBGridPlus1MouseWheel(Sender: TObject;
  const Difference: Integer);
begin
 case Difference  of
  1: if not DBGridPlus1.DataSource.DataSet.Eof then DBGridPlus1.DataSource.DataSet.Next;
  -1: if not DBGridPlus1.DataSource.DataSet.Bof then DBGridPlus1.DataSource.DataSet.Prior;
 end;
end;

procedure TSVR002.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBText3.Caption:=PSQLQuery2.fieldbyName('AB02').AsString+' '+PSQLQuery2.fieldbyName('AB06').AsString;

end;

procedure TSVR002.PSQLQuery1BeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('LOG031').AsString:=DBText3.Caption;
end;

procedure TSVR002.PSQLQuery1BeforeEdit(DataSet: TDataSet);
var
  FormName,TDAction:String;
  ABlValue:Boolean;
begin
  FormName:='SVR002';
  TDAction:='E';

  if not ChkUserGrant(CurrentUID,FormName,TDAction) then begin
    ShowNoGrantMsg(CurrentUName,FormName,TDAction);
    Abort;
  end else begin
   ABLValue:=DBCheckBox1.Checked;
   if ABlValue then begin
     Abort;
   end;
  end;

end;

procedure TSVR002.Button2Click(Sender: TObject);
var
  ABLValue:Boolean;
  AStrSQL,AStrValue:String;
  ARecNo:Integer;
begin
  if PSQLQuery1.Active then begin
  ARecNo:=PSQLQuery1.FieldByName('LOG01').AsInteger;
  ABLValue:=DBCheckBox1.Checked;
  
  AStrSQL:='UPDATE MFLOG SET LOG13=''%S'',LOG15=''%S'' WHERE LOG01=%D';
  if Not ABLValue then begin
    if GetReturnMemo(AStrValue) then begin
      Dm.PSQLDatabase.Execute(Format(AStrSQL,['True',AStrValue,ARecNo]));
      DBText4.Caption:=AStrValue;
      DBCheckBox1.Checked:=True;
    end;
  end;

  end;
end;

procedure TSVR002.Button3Click(Sender: TObject);
begin
  if PSQLQuery1.Active then begin
    if PSQLQuery1.RecordCount>0 then begin
      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Report\'+'SVR002.fr3',True);
      frxReport1.ShowReport(True);
    end;
  end;
end;

procedure TSVR002.FormCreate(Sender: TObject);
begin
  PSQLQuery1.Open;
end;

procedure TSVR002.ToolButton1Click(Sender: TObject);
begin
  DataToCSVDialog(PSQLQuery1);
end;

end.
