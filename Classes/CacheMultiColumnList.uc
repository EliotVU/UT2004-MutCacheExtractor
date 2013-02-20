//==============================================================================
//	CacheMultiColumnList.uc (C) 2009 Eliot All Rights Reserved
//
//	Coded by Eliot Van Uytfanghe
//	Updated @ 23/11/2009
//==============================================================================
Class CacheMultiColumnList Extends GUIMultiColumnList;

var CacheMenu CM;

Function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
//	Log( "InitComponent", Name );

    Super.Initcomponent(MyController,MyOwner);
    OnDrawItem = DrawItem;
}

Function DrawItem( Canvas C, int i, float X, float Y, float W, float H, bool bSelected, bool bPending )
{
    local float CellLeft, CellWidth;
    local GUIStyles DrawStyle;

    // Draw the selection border
    if( bSelected )
    {
        SelectedStyle.Draw( C, MenuState, X, Y-2, W, H+2 );
        DrawStyle = SelectedStyle;
    }
    else
	{
		DrawStyle = Style;
	}

	if( CM.CacheFiles[SortData[i].SortItem].bExtractFailed )
	{
		MenuState = MSAT_Disabled;
	}
	else
	{
		MenuState = MSAT_Blurry;
	}

	GetCellLeftWidth( 0, CellLeft, CellWidth );
	DrawStyle.DrawText( C, MenuState, CellLeft, Y, CellWidth, H, TXTA_Left, CM.CacheFiles[SortData[i].SortItem].FileName, FontScale );

//    GetCellLeftWidth( 1, CellLeft, CellWidth );
//    DrawStyle.DrawText( C, MenuState, CellLeft, Y, CellWidth, H, TXTA_Left, Eval( CM.CacheFiles[SortData[i].SortItem].bLoaded, "Loaded", "Not Loaded" ), FontScale );

	GetCellLeftWidth( 1, CellLeft, CellWidth );
	DrawStyle.DrawText( C, MenuState, CellLeft, Y, CellWidth, H, TXTA_Left, CM.CacheFiles[SortData[i].SortItem].FileGUID, FontScale );
}

Function Clear()
{
//	Log( "Clear", Name );
	ItemCount = 0;
	Super.Clear();
}

Function Free()
{
//	Log( "Free", Name );
	CM = None;
	Super.Free();
}

DefaultProperties
{
	OnClickSound=CS_Edit
	OnDrawItem=DrawItem

    ColumnHeadings(0)="File Name"
    //ColumnHeadings(1)="Loaded"
    ColumnHeadings(1)="File GUID"

    InitColumnPerc(0)=0.60
    //InitColumnPerc(1)=0.05
    InitColumnPerc(1)=0.40

    SortColumn=0
    SortDescending=False
    ExpandLastColumn=True
    bVisibleWhenEmpty=True
    bMultiSelect=False

	ColumnHeadingHints(0)="Name of the cache file"
//	ColumnHeadingHints(1)="Cache file loaded?"
	ColumnHeadingHints(1)="Guid of the cache file"

	StyleName="ServerBrowserGrid"
	SelectedStyleName="BrowserListSelection"
}