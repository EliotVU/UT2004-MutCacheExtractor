# Cache Extractor Mutator for Unreal Tournament 2004

Cache Extractor is a mutator for Unreal Tournament 2004 that provides a user friendly in-game menu allowing you to easily extract files from your cache(downloaded files) folder to their corresponding folder e.g. Textures will go into \Textures\FILENAME.utx, so that you can easily play using the files you have downloaded from an online server.

![image](https://github.com/user-attachments/assets/9977d3f9-c6a3-4f45-a54c-dd490129233d)

The menu provides a list of all the cache files found in your \Cache\ folder and their GUID. You can simply select a file and then click the Extract File button to automatically extract the selected file.$teaser
Notes

If the selected file to extract turns black/dark then this means the file was not successfully extracted possibly the file didn't exist anymore, but was still present in the \UT2004\Cache\cache.inifile. Beware of files that are in-use, attempting to extract those may result in a game crash!
Install

For players: Just extract the files to \System\ along with the .ucl file.
For admins: Either add MutCacheExtractor.CacheServerActor to the ServerActors list in your UT2004.ini file; or add MutCacheExtractor.MutCacheExtractor to your server launching parameters and mutators list.
