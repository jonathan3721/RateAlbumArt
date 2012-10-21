RateAlbumArt
============

This is an iPad app that allows you to rate album art.

This repository contains two projects.

One, BestAlbumArt is an iPad app that hits the LastFM server and searches for different albums, displays them in a tableView storing the data in coredata. 

The other RateAlbumArt is an iPad app that is going to do the same thing but is converting the old project to use CollectionViews and storyboards.

Minor Implementation Details:
Once an album has been rated the album art is stored in data as a UIImage to speed up the import process. If an album is already stored in data it is not stored again.