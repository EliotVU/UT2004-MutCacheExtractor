//==============================================================================
//	CacheMenu.uc (C) 2009 Eliot All Rights Reserved
//
//	Coded by Eliot Van Uytfanghe
//	Updated @ 23/11/2009
//==============================================================================
Class CacheMenu Extends MidGamePanel;

//var automated GUISectionBackground sb_List;
var automated CacheMultiColumnListBox lb_CacheList;
var automated GUIButton b_Extract;
var automated GUIButton b_Refresh;

struct sCacheFiles
{
	var string FileName;
	var string FileGUID;
//	var bool bLoaded;
	var bool bExtractFailed;
};

var array<sCacheFiles> CacheFiles;

var CacheLoader CL;

Function InitComponent( GUIController InController, GUIComponent InOwner )
{
	//Log( "InitComponent", Name );

	Super.InitComponent(InController,InOwner);
	CacheMultiColumnList(lb_CacheList.List).CM = Self;

//	sb_List.ManageComponent( lb_CacheList );
}

Function InitPanel()
{
	//Log( "InitPanel", Name );

	Super.InitPanel();
	InitializeCacheFiles();
}

Function bool OnClick( GUIComponent Sender )
{
	if( Sender == b_Extract )
	{
		//Log( "b_Extract", Name );
		Extract();
		return True;
	}
	else if( Sender == b_Refresh )
	{
		//Log( "b_Refresh", Name );
		RefreshCacheList();
		return True;
	}
	return False;
}

Final Function InitializeCacheFiles()
{
	Log( "InitializeCacheFiles", Name );
	CL = PlayerOwner().Spawn( Class'CacheLoader', PlayerOwner() );
	CL.CM = Self;
}

Final Function bool Extract()
{
	local int Index;

	Index = lb_CacheList.List.CurrentListId();
	if( Index == -1 )
		return False;

	if( PlayerOwner().MoveCacheEntry( CacheFiles[Index].FileGUID ) )
	{
		Log( "Extracting cache file"@CacheFiles[Index].FileGUID, Name );
		/*if( Mid( CacheFiles[Index].FileName, InStr( CacheFiles[Index].FileName, "." ) ) == ".u" )
		{
			GenerateUCL( CacheFiles[Index].FileName );
		}*/
		CacheFiles.Remove( Index, 1 );
		lb_CacheList.List.RemovedCurrent();
		return True;
	}
	else
	{
		CacheFiles[Index].bExtractFailed = True;
		return False;
	}
	return False;
}

// Crashes!
Final Function GenerateUCL( string FileName )
{
	local DumpIntCommandlet CreateINT;
	local ExportCacheCommandlet CreateUCL;

	CreateINT = new(None) Class'DumpIntCommandlet';
	CreateINT.Main( FileName );

	CreateUCL = new(None) Class'ExportCacheCommandlet';
	CreateUCL.Main( FileName );
}

Final Function RefreshCacheList()
{
	//Log( "RefreshCacheList", Name );

	if( CL != None )
		CL.Destroy();

	lb_CacheList.List.Clear();
	CacheFiles.Length = 0;
	InitializeCacheFiles();
}

DefaultProperties
{
	/*WinWidth	=	0.600000
	WinHeight	=	1.000000
	WinLeft		=	0.100000
	WinTop		=	0.100000*/

	/*Begin Object Class=AltSectionBackground Name=ListBackground
		Caption="Cache List"
		WinTop		=	0.025000
		WinLeft		=	0.025000
		WinWidth	=	0.950000
		WinHeight	=	0.880000
		bBoundToParent=True
		bScaleToParent=True
	End Object
	sb_List=ListBackground*/

    Begin Object Class=CacheMultiColumnListBox Name=CacheList
		WinTop		=	0.025000
		WinLeft		=	0.025000
		WinWidth	=	0.950000
		WinHeight	=	0.880000
		bBoundToParent=True
		bScaleToParent=True
    End Object
    lb_CacheList=CacheList

	Begin Object Class=GUIButton Name=ExtractButton
		Hint="Extracts the selected file to the correct directory"
		Caption="Extract File"
		WinWidth	=	0.152500
		WinHeight	=	0.040000
		WinLeft		=	0.822500
		WinTop		=	0.910000
		OnClick=OnClick
		bBoundToParent=False
		bScaleToParent=False
	End Object
	b_Extract=ExtractButton

	Begin Object class=GUIButton Name=RefreshButton
		Hint="Clear the list and rescan the cache folder"
		Caption="Refresh List"
		WinWidth	=	0.152500
		WinHeight	=	0.040000
		WinLeft		=	0.025000
		WinTop		=	0.910000
		OnClick=OnClick
		bBoundToParent=False
		bScaleToParent=False
	End Object
	b_Refresh=RefreshButton
}