//==============================================================================
//	CacheInteraction.uc (C) 2009 Eliot All Rights Reserved
//
//	Coded by Eliot Van Uytfanghe
//	Updated @ 23/11/2009
//==============================================================================
Class CacheInteraction Extends Interaction;

var bool bMenuModified;

Event NotifyLevelChange()
{
	Master.RemoveInteraction( Self );
}

//	Note:	If you use this method, credit me!
Final Function ModifyMenu()
{
	local UT2K4PlayerLoginMenu Menu;
	local GUITabPanel Panel;

	Menu = UT2K4PlayerLoginMenu(GUIController(ViewportOwner.Actor.Player.GUIController).FindPersistentMenuByName( UnrealPlayer(ViewportOwner.Actor).LoginMenuClass ));
	if( Menu != None )
	{
		Panel = Menu.c_Main.AddTab( "Cache Manager", string( Class'CacheMenu' ), ,"Extract cache files" );
		bMenuModified = True;

		//Disable( 'Tick' );
		//bRequiresTick = False;
		Master.RemoveInteraction( Self );
	}
}

Function Tick( float DeltaTime )
{
	if( !bMenuModified )
		ModifyMenu();
}

DefaultProperties
{
	bRequiresTick=True
}