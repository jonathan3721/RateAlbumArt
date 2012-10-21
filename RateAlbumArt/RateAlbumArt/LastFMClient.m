//
//  LastFMClient.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/31/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "LastFMClient.h"
#import "AFJSONRequestOperation.h"

NSString* const LAST_FM_API_KEY = @"709c7a566a2225cf0049c61ab419a97b";
NSString* const LAST_FM_SECRET_KEY = @"29e28ebaeae2988609c32f8be0d851eb";
NSString* const LAST_FM_API_KEY_FIELD = @"api_key";

@interface LastFMClient ()
@property (strong, nonatomic) LastFMClient* sharedClient;
@end
@implementation LastFMClient

+ (LastFMClient*)sharedFMClient
{
    static LastFMClient* _sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[self baseURL]];
        [_sharedClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
    });
    
    return _sharedClient;
}

+ (NSURL*)baseURL
{
    NSString* URLString = @"http://ws.audioscrobbler.com/2.0/";
    NSURL* base = [NSURL URLWithString:URLString];
    return base;
}

- (NSMutableURLRequest*)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSMutableDictionary* parametersIncludingAPIKey = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [parametersIncludingAPIKey setObject:LAST_FM_API_KEY forKey:LAST_FM_API_KEY_FIELD];
    NSMutableURLRequest* request = [super requestWithMethod:method path:path parameters:parametersIncludingAPIKey];
    
    return request;
}

-(id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self setParameterEncoding:AFFormURLParameterEncoding];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}




@end
