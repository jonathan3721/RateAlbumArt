//
//  RecordTests.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/31/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//


#import <SenTestingKit/SenTestingKit.h>
#import "Record.h"

@interface RecordTests : SenTestCase

@end
@implementation RecordTests

-(void)setUp
{
    [super setUp];
}

-(void)tearDown
{
    [super tearDown];
}

-(void)testRecordWithTitleImageURLStringArtistNameTitleSet
{
    Record* newRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    
    STAssertTrue([newRecord.title isEqualToString:@"A"], @"Title not set correctly. Expecting A Actual %@",newRecord.title);
}

-(void)testRecordWithTitleImageURLStringArtistNameImageURLSet
{
    Record* newRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    
    STAssertNil(newRecord.albumArt, @"Album art was not set correctly. Album Art should not be nil.");
//    STAssertTrue([newRecord.albumArt isEqualToString:@"www.helloworld.com"], @"ImageURL not set correctly. Expecting www.helloworld.com Actual %@",newRecord.albumArt);
}

-(void)testRecordWithTitleImageURLStringArtistNameArtistNameSet
{
    Record* newRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    
    STAssertTrue([newRecord.artistName isEqualToString:@"Van Halen"], @"Artist Name not set correctly. Expecting Van Halen Actual %@",newRecord.artistName);
}


-(void)testRecordWithTitleImageURLStringArtistNameExistingRecordReturnsTheExistingRecord
{
    Record* newRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    Record* sameRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    
    STAssertTrue(newRecord == sameRecord, @"Creating a record with the same title and artistName should return the existing record");
}

-(void)testRecordWithTitleImageURLStringArtistNameExistingRecordReturnsTheExistingRecordDifferentURL
{
    Record* newRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    Record* sameRecord = [Record recordWithTitle:@"A" imageURLString:@"www.foobar.net" artistName:@"Van Halen"];
    
    STAssertTrue(newRecord == sameRecord, @"Creating a record with the same title and artistName should return the existing record");
}

-(void)testRecordWithTitleImageURLStringArtistNameExistingRecordCreatesNewRecordForDifferentTitleAndArtist
{
    Record* newRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    Record* sameRecord = [Record recordWithTitle:@"B" imageURLString:@"www.foobar.net" artistName:@"Lil Wayne"];
    
    STAssertFalse(newRecord == sameRecord, @"Creating a record with the same title and artistName should return the existing record");
}

-(void)testRecordWithTitleImageURLStringArtistNameExistingRecordCreatesNewRecordForDifferentTitle
{
    Record* newRecord = [Record recordWithTitle:@"A" imageURLString:@"www.helloworld.com" artistName:@"Van Halen"];
    Record* sameRecord = [Record recordWithTitle:@"B" imageURLString:@"www.foobar.net" artistName:@"Van Halen"];
    
    STAssertFalse(newRecord == sameRecord, @"Creating a record with the same title and artistName should return the existing record");
}

-(void)testIsEqualToRecordNODifferentImageURL
{
    Record* a = [Record recordWithTitle:@"a" imageURLString:@"aa" artistName:@"A"];
    Record* b = [Record recordWithTitle:@"b" imageURLString:@"bb" artistName:@"B"];
    
    STAssertFalse([a isEqualToRecord:b], @"a should not be equal to b");
    
}

-(void)testIsEqualToRecordNOSameImageURL
{
    Record* a = [Record recordWithTitle:@"a" imageURLString:@"aa" artistName:@"A"];
    Record* b = [Record recordWithTitle:@"b" imageURLString:@"aa" artistName:@"B"];
    
    STAssertFalse([a isEqualToRecord:b], @"a should not be equal to b");
    
}

-(void)testIsEqualToRecordYESDifferentImageURL
{
    Record* a = [Record recordWithTitle:@"a" imageURLString:@"aa" artistName:@"A"];
    Record* b = [Record recordWithTitle:@"a" imageURLString:@"bb" artistName:@"A"];
    
    STAssertTrue([a isEqualToRecord:b], @"a should be equal to b");
    
}

-(void)testIsEqualToRecordYESSameImageURL
{
    Record* a = [Record recordWithTitle:@"a" imageURLString:@"aa" artistName:@"A"];
    Record* b = [Record recordWithTitle:@"a" imageURLString:@"aa" artistName:@"A"];
    
    STAssertTrue([a isEqualToRecord:b], @"a should be equal to b");
    
}
@end
