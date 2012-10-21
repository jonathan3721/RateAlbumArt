//
//  RatedImageViewTests.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/28/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "RatedImageView.h"
#import <SenTestingKit/SenTestingKit.h>

@interface RatedImageViewTests : SenTestCase
@property (strong, nonatomic) RatedImageView* albumArtImageView;
@end
@implementation RatedImageViewTests

-(void)setUp{
    [super setUp];
    self.albumArtImageView = [[RatedImageView alloc] init];
}

-(void)tearDown{
    
    self.albumArtImageView = nil;
    [super tearDown];
}

-(void)testInitializeRatingZero
{
    [self.albumArtImageView performSelector:@selector(initialize)];
    STAssertTrue([self.albumArtImageView.ratingNumber intValue] == 0, @"Rating Number should be initialized to 0, Rating Number was initialized to %@", [self.albumArtImageView.ratingNumber stringValue]);
}
-(void)testInitializeImageViewNotNil
{
    [self.albumArtImageView performSelector:@selector(initialize)];
    STAssertNotNil(self.albumArtImageView.imageView, @"The Image View was not initialized.");
}

-(void)testInitializeTitleLabelNotNil
{
    [self.albumArtImageView performSelector:@selector(initialize)];
    STAssertNotNil(self.albumArtImageView.titleLabel, @"The Title Label was not initialized.");
}


-(void)testRatingGivenWithOneAppleButtonSelectedNo
{
    UIButton* button = [[UIButton alloc] init];
    [self.albumArtImageView performSelector:@selector(setOneAppleButton:) withObject:button];
    UIButton* oneAppleButton = [self.albumArtImageView performSelector:@selector(oneAppleButton)];
    oneAppleButton.selected = NO;
    [self.albumArtImageView performSelector:@selector(ratingGiven:)withObject:oneAppleButton];
    
    STAssertTrue([self.albumArtImageView.ratingNumber intValue] == 1, @"Expected ratingNumber to be 1, Actual rating number is %@", [self.albumArtImageView.ratingNumber stringValue]);
}


-(void)testRatingGivenWithFiveAppleButtonSelectedNo
{
    UIButton* button = [[UIButton alloc] init];
    [self.albumArtImageView performSelector:@selector(setFiveAppleButton:) withObject:button];
    UIButton* fiveAppleButton = [self.albumArtImageView performSelector:@selector(fiveAppleButton)];
    fiveAppleButton.selected = NO;
    [self.albumArtImageView performSelector:@selector(ratingGiven:)withObject:fiveAppleButton];
    
    STAssertTrue([self.albumArtImageView.ratingNumber intValue] == 5, @"Expected ratingNumber to be 5, Actual rating number is %@", [self.albumArtImageView.ratingNumber stringValue]);
}


-(void)testSetRatingNumberPositive
{
    UIButton* button = [[UIButton alloc] init];
    [self.albumArtImageView performSelector:@selector(setOneAppleButton:) withObject:button];
    UIButton* oneAppleButton = [self.albumArtImageView performSelector:@selector(oneAppleButton)];
    self.albumArtImageView.ratingNumber = @1;
    
    STAssertTrue(oneAppleButton.selected, @"Rating Number Equal to 1 should result in the first button being selected.");
}


-(void)testSetRatingNumberSomeSelectedAlready
{
    [self.albumArtImageView performSelector:@selector(initialize)];
    self.albumArtImageView.ratingNumber = @3;
    self.albumArtImageView.ratingNumber = @(-2);
    UIButton* thirdButton = [self.albumArtImageView performSelector:@selector(threeAppleButton)];
    
    
    STAssertFalse(thirdButton.selected, @"Third button should not be selected.");
}

@end
