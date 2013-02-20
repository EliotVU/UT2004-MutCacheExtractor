//==============================================================================
//	MutCacheExtractor.uc (C) 2009 Eliot All Rights Reserved
//
//	Coded by Eliot Van Uytfanghe
//	Updated @ 23/11/2009
//==============================================================================
Class MutCacheExtractor Extends Mutator;

Simulated Function Tick( float DeltaTime )
{
    local PlayerController PC;

    if( Level.NetMode == NM_DedicatedServer )
    {
    	Disable('Tick');
    	return;
    }

	PC = Level.GetLocalPlayerController();
	if( PC != None && PC.Player != None && PC.Player.InteractionMaster != None )
	{
		PC.Player.InteractionMaster.AddInteraction( string( Class'CacheInteraction' ), PC.Player );
		Disable('Tick');
		return;
    }
}

DefaultProperties
{
	bAddToServerPackages=True

	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True

	FriendlyName="Cache Extractor"
	Description="This mutator lets you extract cache files from within the game even online!, Created by Eliot Van Uytfanghe @ 2009"
	RulesGroup="MutCacheExtractor"
	Group="CacheExtractor"
}