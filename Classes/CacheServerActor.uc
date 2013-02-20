//==============================================================================
//	CacheServerActor.uc (C) 2009 Eliot All Rights Reserved
//
//	Coded by Eliot Van Uytfanghe
//	Updated @ 23/11/2009
//==============================================================================
Class CacheServerActor Extends Info;

Function PreBeginPlay()
{
	local MutCacheExtractor CE;

	// Check if this mutator already was added!
	ForEach DynamicActors( Class'MutCacheExtractor', CE )
	{
		return;
	}

	Level.Game.AddMutator( string( Class'MutCacheExtractor' ), True );
	Destroy();
}
