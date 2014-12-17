unit gdc_dlgUserSimpleDocument_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  gdc_dlgTR_unit, IBDatabase, Db, ActnList, StdCtrls, at_Container, at_Classes,
  Menus, gsIBLookupComboBox, ExtCtrls;

type
  Tgdc_dlgUserSimpleDocument = class(Tgdc_dlgTR)
    atContainer: TatContainer;
    pnlHolding: TPanel;
    lblCompany: TLabel;
    iblkCompany: TgsIBLookupComboBox;
    procedure atContainerRelationNames(Sender: TObject; Relations,
      FieldAliases: TStringList);
    procedure FormCreate(Sender: TObject);

  public
    procedure SetupDialog; override;

    procedure SaveSettings; override;
    procedure LoadSettingsAfterCreate; override;
  end;

var
  gdc_dlgUserSimpleDocument: Tgdc_dlgUserSimpleDocument;

implementation

{$R *.DFM}

uses
  gdcClasses, Storages, gd_ClassList, gd_security, IBSQL, gdcBaseInterface,
  gdcBase;

{ Tgdc_dlgUserSimpleDocument }

procedure Tgdc_dlgUserSimpleDocument.atContainerRelationNames(
  Sender: TObject; Relations, FieldAliases: TStringList);
var
  i: Integer;
  F: TatRelationField;
begin
  inherited;

  FieldAliases.Add('NUMBER');
  FieldAliases.Add('DOCUMENTDATE');

  for I := 0 to gdcObject.FieldCount - 1 do
    if ((AnsiCompareText(gdcObject.RelationByAliasName(gdcObject.Fields[I].FieldName),
      (gdcObject as TgdcUserBaseDocument).Relation) = 0) or
      (AnsiCompareText(gdcObject.RelationByAliasName(gdcObject.Fields[I].FieldName),
      'GD_DOCUMENT') = 0))
       then
    begin
      F := atDatabase.FindRelationField((gdcObject as TgdcUserBaseDocument).Relation,
        gdcObject.FieldNameByAliasName(gdcObject.Fields[I].FieldName));

      if not Assigned(F) then
        F := atDatabase.FindRelationField('GD_DOCUMENT',
          gdcObject.FieldNameByAliasName(gdcObject.Fields[I].FieldName));

      if Assigned(F) and F.IsUserDefined then
        FieldAliases.Add(gdcObject.Fields[I].FieldName);
    end;

end;

procedure Tgdc_dlgUserSimpleDocument.SaveSettings;
  {@UNFOLD MACRO INH_CRFORM_PARAMS(VAR)}
  {M}VAR
  {M}  Params, LResult: Variant;
  {M}  tmpStrings: TStackStrings;
  {END MACRO}
begin
  {@UNFOLD MACRO INH_CRFORM_WITHOUTPARAMS('TGDC_DLGUSERSIMPLEDOCUMENT', 'SAVESETTINGS', KEYSAVESETTINGS)}
  {M}  try
  {M}    if Assigned(gdcMethodControl) and Assigned(ClassMethodAssoc) then
  {M}    begin
  {M}      SetFirstMethodAssoc('TGDC_DLGUSERSIMPLEDOCUMENT', KEYSAVESETTINGS);
  {M}      tmpStrings := TStackStrings(ClassMethodAssoc.IntByKey[KEYSAVESETTINGS]);
  {M}      if (tmpStrings = nil) or (tmpStrings.IndexOf('TGDC_DLGUSERSIMPLEDOCUMENT') = -1) then
  {M}      begin
  {M}        Params := VarArrayOf([GetGdcInterface(Self)]);
  {M}        if gdcMethodControl.ExecuteMethodNew(ClassMethodAssoc, Self, 'TGDC_DLGUSERSIMPLEDOCUMENT',
  {M}          'SAVESETTINGS', KEYSAVESETTINGS, Params, LResult) then exit;
  {M}      end else
  {M}        if tmpStrings.LastClass.gdClassName <> 'TGDC_DLGUSERSIMPLEDOCUMENT' then
  {M}        begin
  {M}          Inherited;
  {M}          Exit;
  {M}        end;
  {M}    end;
  {END MACRO}
  inherited;

{ if Assigned(UserStorage) then
    UserStorage.SaveComponent(atContainer, atContainer.SaveToStream,
      FSubType);}

  {@UNFOLD MACRO INH_CRFORM_FINALLY('TGDC_DLGUSERSIMPLEDOCUMENT', 'SAVESETTINGS', KEYSAVESETTINGS)}
  {M}finally
  {M}  if Assigned(gdcMethodControl) and Assigned(ClassMethodAssoc) then
  {M}    ClearMacrosStack('TGDC_DLGUSERSIMPLEDOCUMENT', 'SAVESETTINGS', KEYSAVESETTINGS);
  {M}end;
  {END MACRO}
end;

procedure Tgdc_dlgUserSimpleDocument.LoadSettingsAfterCreate;
  {@UNFOLD MACRO INH_CRFORM_PARAMS(VAR)}
  {M}VAR
  {M}  Params, LResult: Variant;
  {M}  tmpStrings: TStackStrings;
  {END MACRO}
begin
  {@UNFOLD MACRO INH_CRFORM_WITHOUTPARAMS('TGDC_DLGUSERSIMPLEDOCUMENT', 'LOADSETTINGSAFTERCREATE', KEYLOADSETTINGSAFTERCREATE)}
  {M}  try
  {M}    if Assigned(gdcMethodControl) and Assigned(ClassMethodAssoc) then
  {M}    begin
  {M}      SetFirstMethodAssoc('TGDC_DLGUSERSIMPLEDOCUMENT', KEYLOADSETTINGSAFTERCREATE);
  {M}      tmpStrings := TStackStrings(ClassMethodAssoc.IntByKey[KEYLOADSETTINGSAFTERCREATE]);
  {M}      if (tmpStrings = nil) or (tmpStrings.IndexOf('TGDC_DLGUSERSIMPLEDOCUMENT') = -1) then
  {M}      begin
  {M}        Params := VarArrayOf([GetGdcInterface(Self)]);
  {M}        if gdcMethodControl.ExecuteMethodNew(ClassMethodAssoc, Self, 'TGDC_DLGUSERSIMPLEDOCUMENT',
  {M}          'LOADSETTINGSAFTERCREATE', KEYLOADSETTINGSAFTERCREATE, Params, LResult) then exit;
  {M}      end else
  {M}        if tmpStrings.LastClass.gdClassName <> 'TGDC_DLGUSERSIMPLEDOCUMENT' then
  {M}        begin
  {M}          Inherited;
  {M}          Exit;
  {M}        end;
  {M}    end;
  {END MACRO}
  inherited;

{ if Assigned(UserStorage) then
    UserStorage.LoadComponent(atContainer, atContainer.LoadFromStream,
      FSubType);}

  {@UNFOLD MACRO INH_CRFORM_FINALLY('TGDC_DLGUSERSIMPLEDOCUMENT', 'LOADSETTINGSAFTERCREATE', KEYLOADSETTINGSAFTERCREATE)}
  {M}finally
  {M}  if Assigned(gdcMethodControl) and Assigned(ClassMethodAssoc) then
  {M}    ClearMacrosStack('TGDC_DLGUSERSIMPLEDOCUMENT', 'LOADSETTINGSAFTERCREATE', KEYLOADSETTINGSAFTERCREATE);
  {M}end;
  {END MACRO}
end;

procedure Tgdc_dlgUserSimpleDocument.SetupDialog;
  {@UNFOLD MACRO INH_CRFORM_PARAMS(VAR)}
  {M}VAR
  {M}  Params, LResult: Variant;
  {M}  tmpStrings: TStackStrings;
  {END MACRO}
begin
  {@UNFOLD MACRO INH_CRFORM_WITHOUTPARAMS('TGDC_DLGUSERSIMPLEDOCUMENT', 'SETUPDIALOG', KEYSETUPDIALOG)}
  {M}  try
  {M}    if Assigned(gdcMethodControl) and Assigned(ClassMethodAssoc) then
  {M}    begin
  {M}      SetFirstMethodAssoc('TGDC_DLGUSERSIMPLEDOCUMENT', KEYSETUPDIALOG);
  {M}      tmpStrings := TStackStrings(ClassMethodAssoc.IntByKey[KEYSETUPDIALOG]);
  {M}      if (tmpStrings = nil) or (tmpStrings.IndexOf('TGDC_DLGUSERSIMPLEDOCUMENT') = -1) then
  {M}      begin
  {M}        Params := VarArrayOf([GetGdcInterface(Self)]);
  {M}        if gdcMethodControl.ExecuteMethodNew(ClassMethodAssoc, Self, 'TGDC_DLGUSERSIMPLEDOCUMENT',
  {M}          'SETUPDIALOG', KEYSETUPDIALOG, Params, LResult) then exit;
  {M}      end else
  {M}        if tmpStrings.LastClass.gdClassName <> 'TGDC_DLGUSERSIMPLEDOCUMENT' then
  {M}        begin
  {M}          Inherited;
  {M}          Exit;
  {M}        end;
  {M}    end;
  {END MACRO}

  inherited;

  pnlHolding.Visible := IBLogin.IsHolding;

  Caption := (gdcObject as TgdcUserBaseDocument).DocumentName[False];

  {@UNFOLD MACRO INH_CRFORM_FINALLY('TGDC_DLGUSERSIMPLEDOCUMENT', 'SETUPDIALOG', KEYSETUPDIALOG)}
  {M}finally
  {M}  if Assigned(gdcMethodControl) and Assigned(ClassMethodAssoc) then
  {M}    ClearMacrosStack('TGDC_DLGUSERSIMPLEDOCUMENT', 'SETUPDIALOG', KEYSETUPDIALOG);
  {M}end;
  {END MACRO}


end;

procedure Tgdc_dlgUserSimpleDocument.FormCreate(Sender: TObject);
begin
  inherited;
  Assert(IBLogin <> nil);
  pnlHolding.Enabled := IBLogin.IsHolding;
  if pnlHolding.Enabled then
  begin
    iblkCompany.Condition := 'gd_contact.id IN (' + IBLogin.HoldingList + ')';
  end;
end;

initialization
  RegisterFrmClass(Tgdc_dlgUserSimpleDocument, ctUserDocument);

finalization
  UnRegisterFrmClass(Tgdc_dlgUserSimpleDocument);

end.
