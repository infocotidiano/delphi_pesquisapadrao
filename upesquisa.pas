unit upesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisa = class(TForm)
    Conexao: TFDConnection;
    drvMysql: TFDPhysMySQLDriverLink;
    qrSQL: TFDQuery;
    dsSQL: TDataSource;
    DBGrid1: TDBGrid;
    cbCAMPOS: TComboBox;
    cbFiltro: TComboBox;
    edtBusca: TEdit;
    btnPesquisa: TButton;
    edtRetorno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    cCampos, cCampoRetorno, cTabela : string;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; par_lstCampos : Array of string;par_cTabela, par_cCampoResult :string);
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

{ TfrmPesquisa }

procedure TfrmPesquisa.btnPesquisaClick(Sender: TObject);
begin
  if qrSQL.Active then
     qrSQL.Close;
  with qrSQL.SQL do
      begin
        Clear;
        add('Select '+cCampos);
        add('from '+cTabela);
        add('where '+trim(cbCAMPOS.Text)+' like :cParametro');
      end;
  if cbFiltro.Text = 'parte' then
     qrSQL.ParamByName('cParametro').AsString := '%'+trim(edtBusca.Text)+'%'
  else if cbFiltro.Text = 'inicio' then
     qrSQL.ParamByName('cParametro').AsString := trim(edtBusca.Text)+'%'
  else if cbFiltro.Text = 'igual' then
     qrSQL.ParamByName('cParametro').AsString := trim(edtBusca.Text) ;
  qrSQL.Open;

end;

constructor TfrmPesquisa.Create(AOwner: TComponent;
  par_lstCampos: array of string; par_cTabela, par_cCampoResult: string);
var
 n : Integer;
begin
  inherited Create(AOwner);
  Conexao.Open;
  cCampoRetorno := par_cCampoResult;
  cCampos:='';
  cbCAMPOS.Clear;
  cTabela := par_cTabela;
  for n := 0 to Length(par_lstCampos) -1 do
     begin
       cbCAMPOS.Items.Add(par_lstCampos[n]) ;
       if n = 0 then
         cCampos := par_lstCampos[n]
       else
         cCampos := cCampos +','+ par_lstCampos[n]  ;
     end;
     cbCAMPOS.ItemIndex := 1;
  if qrSQL.Active then
     qrSQL.Close;
  with qrSQL.SQL do
      begin
        Clear;
        add('Select '+cCampos);
        add('from '+cTabela)
      end;
  qrSQL.Open;

end;

procedure TfrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  edtRetorno.Clear;
  edtRetorno.Text := qrSQL.FieldByName(cCampoRetorno).AsVariant;
  qrSQL.Close;
  Conexao.Close;
  frmPesquisa.ModalResult := mrYes;
end;

end.
