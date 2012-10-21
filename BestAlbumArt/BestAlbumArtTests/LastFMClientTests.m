//
//  LastFMClientTests.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/31/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "LastFMClient.h"
#import <SenTestingKit/SenTestingKit.h>

@interface LastFMClientTests : SenTestCase
@property (strong, nonatomic) LastFMClient* client;

@end


@implementation LastFMClientTests

- (void)setUp
{
    [super setUp];
    self.client = [LastFMClient sharedFMClient];
}

- (void)tearDown
{
    self.client = nil;
    [super tearDown];
}

- (void)testSharedFMClientReturnsSingleton
{
    LastFMClient* duplicate = [LastFMClient sharedFMClient];
    
    STAssertTrue(duplicate == self.client, @"Shared FM Client should only return a single instance of LastFMClient.");
}

-(void)testBaseURLIsCorrect
{
    NSURL* base =  [self.client baseURL];
    NSString* baseAbsoluteString = base.absoluteString;
    STAssertTrue([baseAbsoluteString isEqualToString:@"http://ws.audioscrobbler.com/2.0/"] , @"Base URL should be equal to http://ws.audioscrobbler.com/2.0/ but it was %@", baseAbsoluteString);
}

//-(void)testRequestWithMethodPathParameters
//{
//    NSDictionary* dictionary =@{ @"format":@"json", @"method" : @"album.search", @"album" : @"black" };
//    NSMutableURLRequest* request = [self.client requestWithMethod:@"GET" path:@"" parameters:dictionary];
//    NSURL* requestURL = request.URL;
//    NSString* stringURL = requestURL.absoluteString;
//    
//    STAssertTrue([stringURL isEqualToString:@"http://ws.audioscrobbler.com/2.0/?format=json&method=album.search&album=black&api_key=709c7a566a2225cf0049c61ab419a97b"],
//                 @"Expected URL http://ws.audioscrobbler.com/2.0/?format=json&method=album.search&album=black&api_key=709c7a566a2225cf0049c61ab419a97b , Actual URL %@", stringURL);
//}


@end
