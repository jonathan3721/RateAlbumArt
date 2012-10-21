//
//  AlbumArtCellTests.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/27/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SenTestingKit/SenTestingKit.h>
#import <OCMock.h>
#import "AlbumArtCell.h"
#import "RatedImageView.h"

@interface AlbumArtCellTests : SenTestCase
@property (strong, nonatomic) AlbumArtCell* albumArtCell;
@end

@implementation AlbumArtCellTests

- (void)setUp
{
    [super setUp];
    self.albumArtCell = [[AlbumArtCell alloc] init];
    self.albumArtCell.leftAlbumArtImageView = [[RatedImageView alloc] init];
}

- (void)tearDown
{
    self.albumArtCell = nil;
    [super tearDown];
}

-(void)testSetLeftImageStringWithImageTypeTitleNumberImageNotNil
{
    [self.albumArtCell.leftAlbumArtImageView performSelector:@selector(initialize)];
    [self.albumArtCell setLeftImageNamed:@"goodapple" withImageType:AlbumArtTypePNG title:@"Apple" rating:@2];
    
    STAssertNotNil(self.albumArtCell.leftAlbumArtImageView.imageView.image, @"Image was not set.");
}

-(void)testSetLeftImageStringWithImageTypeTitleNumberTitleNotNil
{
    [self.albumArtCell.leftAlbumArtImageView performSelector:@selector(initialize)];
    [self.albumArtCell setLeftImageNamed:@"goodapple" withImageType:AlbumArtTypePNG title:@"Apple" rating:@2];
    
    STAssertTrue(self.albumArtCell.leftAlbumArtImageView.titleLabel.text == @"Apple", @"Expectd title: Apple Actual tite: %@",self.albumArtCell.leftAlbumArtImageView.titleLabel.text);
}

-(void)testSetLeftImageStringWithImageTypeTitleNumberNotNil
{
    [self.albumArtCell.leftAlbumArtImageView performSelector:@selector(initialize)];
    [self.albumArtCell setLeftImageNamed:@"goodapple" withImageType:AlbumArtTypePNG title:@"Apple" rating:@2];
    
    STAssertTrue([self.albumArtCell.leftAlbumArtImageView.ratingNumber intValue] == 2, @"Expected rating number: 2 Actual Rating Numbe: %@",self.albumArtCell.leftAlbumArtImageView.ratingNumber);
}

-(void)testimageFromStringOfTypeReturnsImage
{
    UIImage* image = [self.albumArtCell performSelector:@selector(imageFromString:ofNumber:) withObject:@"badapple" withObject:@(AlbumArtTypePNG)];
    STAssertNotNil(image, @"The image was not created properly, image should not be nil.");
}

-(void)testSetLeftImageWithImageTypeTitleNumberImageNotNil
{
    UIImage* goodAppleImage = [UIImage imageNamed:@"goodApple.png"];
    [self.albumArtCell.leftAlbumArtImageView performSelector:@selector(initialize)];
    [self.albumArtCell setLeftImage:goodAppleImage withTitle:@"Good Apple" rating:@3];
    
    STAssertNotNil(self.albumArtCell.leftAlbumArtImageView.imageView.image, @"Image was not set.");
}

-(void)testSetLeftImageWithImageTypeTitleNumberTitleNotNil
{
    UIImage* goodAppleImage = [UIImage imageNamed:@"goodApple.png"];
    [self.albumArtCell.leftAlbumArtImageView performSelector:@selector(initialize)];
    [self.albumArtCell setLeftImage:goodAppleImage withTitle:@"Good Apple" rating:@3];
    STAssertTrue(self.albumArtCell.leftAlbumArtImageView.titleLabel.text == @"Good Apple", @"Expectd title: Good Apple Actual tite: %@",self.albumArtCell.leftAlbumArtImageView.titleLabel.text);
}

-(void)testSetLeftImageWithImageTypeTitleNumberNotNil
{
    UIImage* goodAppleImage = [UIImage imageNamed:@"goodApple.png"];
    [self.albumArtCell.leftAlbumArtImageView performSelector:@selector(initialize)];
    [self.albumArtCell setLeftImage:goodAppleImage withTitle:@"Good Apple" rating:@2];
    STAssertTrue([self.albumArtCell.leftAlbumArtImageView.ratingNumber intValue] == 2, @"Expected rating number: 2 Actual Rating Numbe: %@",self.albumArtCell.leftAlbumArtImageView.ratingNumber);
}













@end
