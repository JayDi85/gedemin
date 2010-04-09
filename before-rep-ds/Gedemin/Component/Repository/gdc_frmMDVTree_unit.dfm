inherited gdc_frmMDVTree: Tgdc_frmMDVTree
  Left = 468
  Top = 158
  Width = 812
  Height = 612
  Caption = 'gdc_frmMDVTree'
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbMain: TStatusBar
    Top = 566
    Width = 804
  end
  inherited TBDockTop: TTBDock
    Width = 804
    inherited tbMainToolbar: TTBToolbar
      Visible = False
    end
    inherited tbMainMenu: TTBToolbar
      DockPos = 136
      inherited tbsiMainMenuObject: TTBSubmenuItem
        object tbi_mm_ShowSubGroups: TTBItem [16]
          Action = actShowSubGroups
        end
        object tbi_mm_AllowDragnDrop: TTBItem [17]
          Action = actAllowDragnDrop
        end
        object tbi_mm_sep5: TTBSeparatorItem [18]
        end
      end
    end
    inherited tbMainInvariant: TTBToolbar
      Left = 280
    end
  end
  inherited TBDockLeft: TTBDock
    Height = 508
  end
  inherited TBDockRight: TTBDock
    Left = 795
    Height = 508
  end
  inherited TBDockBottom: TTBDock
    Top = 557
    Width = 804
  end
  inherited pnlWorkArea: TPanel
    Width = 786
    Height = 508
    inherited sMasterDetail: TSplitter
      Left = 166
      Height = 405
      Beveled = False
    end
    inherited spChoose: TSplitter
      Top = 405
      Width = 786
    end
    inherited pnlMain: TPanel
      Width = 166
      Height = 405
      inherited pnlSearchMain: TPanel
        Height = 405
        inherited sbSearchMain: TScrollBox
          Height = 367
        end
        inherited pnlSearchMainButton: TPanel
          Top = 367
        end
      end
      object tvGroup: TgsDBTreeView
        Left = 160
        Top = 0
        Width = 6
        Height = 405
        DataSource = dsMain
        KeyField = 'ID'
        ParentField = 'PARENT'
        DisplayField = 'NAME'
        ImageValueList.Strings = (
          '')
        Align = alClient
        DragMode = dmAutomatic
        HideSelection = False
        Indent = 19
        PopupMenu = pmMain
        RightClickSelect = True
        SortType = stText
        TabOrder = 1
        OnDblClick = tvGroupDblClick
        OnDragDrop = tvGroupDragDrop
        OnDragOver = tvGroupDragOver
        OnEnter = tvGroupEnter
        OnStartDrag = tvGroupStartDrag
        MainFolderHead = True
        MainFolder = True
        MainFolderCaption = '���'
        WithCheckBox = True
        OnClickedCheck = tvGroupClickedCheck
      end
    end
    inherited pnChoose: TPanel
      Top = 409
      Width = 786
      inherited pnButtonChoose: TPanel
        Left = 681
      end
      inherited ibgrChoose: TgsIBGrid
        Width = 681
      end
      inherited pnlChooseCaption: TPanel
        Width = 786
      end
    end
    inherited pnlDetail: TPanel
      Left = 170
      Width = 616
      Height = 405
      BevelOuter = bvNone
      inherited TBDockDetail: TTBDock
        Left = 0
        Top = 0
        Width = 616
        inherited tbDetailCustom: TTBToolbar
          Left = 275
        end
      end
      inherited pnlSearchDetail: TPanel
        Left = 0
        Top = 26
        Height = 379
        TabOrder = 2
        inherited sbSearchDetail: TScrollBox
          Height = 341
        end
        inherited pnlSearchDetailButton: TPanel
          Top = 341
        end
      end
      object ibgrDetail: TgsIBGrid
        Left = 160
        Top = 26
        Width = 456
        Height = 379
        HelpContext = 3
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = True
        DataSource = dsDetail
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        PopupMenu = pmDetail
        TabOrder = 1
        OnDblClick = ibgrDetailDblClick
        OnDragDrop = ibgrDetailDragDrop
        OnDragOver = ibgrDetailDragOver
        OnEnter = ibgrDetailEnter
        OnKeyDown = ibgrDetailKeyDown
        OnMouseMove = ibgrDetailMouseMove
        OnStartDrag = ibgrDetailStartDrag
        InternalMenuKind = imkWithSeparator
        Expands = <>
        ExpandsActive = False
        ExpandsSeparate = False
        TitlesExpanding = False
        Conditions = <>
        ConditionsActive = False
        CheckBox.Visible = False
        CheckBox.CheckBoxEvent = ibgrDetailClickCheck
        CheckBox.FirstColumn = False
        MinColWidth = 40
        ColumnEditors = <>
        Aliases = <>
        OnClickCheck = ibgrDetailClickCheck
      end
    end
  end
  inherited alMain: TActionList
    inherited actFind: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchDetail: TAction [40]
    end
    inherited actSearchdetailClose: TAction [41]
    end
    inherited actDetailAddToSelected: TAction [42]
    end
    inherited actDetailRemoveFromSelected: TAction [43]
    end
    inherited actDetailOnlySelected: TAction [44]
    end
    inherited actDetailQExport: TAction [45]
    end
    object actShowSubGroups: TAction [46]
      Category = 'Main'
      Caption = '��������� ������'
      Checked = True
      OnExecute = actShowSubGroupsExecute
      OnUpdate = actShowSubGroupsUpdate
    end
    inherited actSelectAll: TAction [47]
    end
    inherited actUnSelectAll: TAction [48]
    end
    inherited actDetailToSetting: TAction [49]
    end
    inherited actDetailSaveToFile: TAction [50]
    end
    inherited actClearSelection: TAction [51]
    end
    inherited actDetailLoadFromFile: TAction [52]
    end
    inherited actDetailEditInGrid: TAction
      Visible = True
      OnExecute = actDetailEditInGridExecute
      OnUpdate = actDetailEditInGridUpdate
    end
    object actAllowDragnDrop: TAction
      Category = 'Main'
      Caption = '��������� ��������������'
      Checked = True
      OnExecute = actAllowDragnDropExecute
    end
  end
end
