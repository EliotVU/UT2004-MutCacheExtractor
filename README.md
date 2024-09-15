# Cache Extractor Mutator for Unreal Tournament 2004

Cache Extractor is a mutator for Unreal Tournament 2004 that brings the ability to extract cache files right from within the game itself. Even during online-play!

![image](https://github.com/user-attachments/assets/9977d3f9-c6a3-4f45-a54c-dd490129233d)

The mutator adds a new tab page to the "mid game menu" labeled as "Cache Manager"

The new page provides a list of all the cache files that can be found in the `/UT2004Root/Cache/` directory.
In this menu you will be given the option to extract any file of choice, upon extraction the selected will be moved to its appropriate directory.

## Usage

Install by placing `MutCacheExtractor.u` and `MutCacheExtractor.ucl` in your `/UT2004Root/System/` directory.

The mutator should appear in the mutators menu as "Cache Extractor"

Server admins can do the following:

Enable the mutator by appending `MutCacheExtractor` to your server's mutator option e.g.
```bat
?Mutator=MutCacheExtractor.MutCacheExtractor
```

Or alternatively add the following line `ServerActors=MutCacheExtractor.CacheServerActor` under section `[Engine.GameEngine]` of your `UT2004.ini` file.


## Caveats

1. If the row becomes darkened then the extraction failed, possibly the file may no longer exist in the `/UT2004Root/Cache/` directory.
2. The game crashed upon extraction then the attempted package may possibly have still been in-use.
