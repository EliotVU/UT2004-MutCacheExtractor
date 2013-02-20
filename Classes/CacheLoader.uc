//==============================================================================
//	CacheLoader.uc (C) 2009 Eliot All Rights Reserved
//
//	Coded by Eliot Van Uytfanghe
//	Updated @ 23/11/2009
//==============================================================================
Class CacheLoader Extends Info;

var CacheMenu CM;

// State vars
var string FileGUID, FileName;
var int CurCacheItem;

Simulated Event SetInitialState()
{
	GotoState( 'LoadCache' );
}

State LoadCache
{
	Function BeginState();
Begin:
	//Log( "Load Cache", Name );
	FileGUID = "a";
	while( FileGUID != "" )
	{
		//Log( "Get CacheEntry"@CurCacheItem, Name );
		Sleep( 0.01 );
		if( GetCacheEntry( CurCacheItem, FileGUID, FileName ) )
		{
			//Log( "FileName:"@FileName, Name );
			CM.CacheFiles.Insert( CM.CacheFiles.Length, 1 );
			CM.CacheFiles[CM.CacheFiles.Length-1].FileName = FileName;
			CM.CacheFiles[CM.CacheFiles.Length-1].FileGUID = FileGUID;
			CM.lb_CacheList.List.AddedItem();
		}
		++ CurCacheItem;
	}

	Destroy();
}

DefaultProperties
{
}