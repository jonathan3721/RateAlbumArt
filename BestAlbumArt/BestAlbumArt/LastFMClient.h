//
//  LastFMClient.h
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/31/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "AFHTTPClient.h"

@interface LastFMClient : AFHTTPClient

+ (LastFMClient*)sharedFMClient;
+ (NSURL*)baseURL;

@end
