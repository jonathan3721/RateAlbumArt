//
//  BestAlbumArtTests.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/27/12.
//  Copyright 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SenTestingKit/SenTestingKit.h>
#import <OCMock.h>
#import "BestAlbumArtViewController.h"
#import "Record.h"
#import "RatedImageView.h"
//#import "application_headers" as required

@interface BestAlbumArtTests : SenTestCase {

}
@property (strong,nonatomic) BestAlbumArtViewController* bestAlbumArtViewController;

@end

@implementation BestAlbumArtTests

- (void)setUp {
    // Run before each test method.
    // For example, instantiate an instance of the class under test.
    // You can delete this if not needed.
    self.bestAlbumArtViewController = [[BestAlbumArtViewController alloc] init];
    
    
}

- (void)tearDown {
    // Run after each test method
    // For example, release any objects instantiated in the setUp method above.
    // You can delete this if not needed.
    self.bestAlbumArtViewController = nil;
    [super tearDown];
}

- (void)testViewDidLoadCallsSetDelegateAndSetDatasource
{
    id mock = (id)[OCMockObject mockForClass:[UITableView class]];
    [[mock expect] setDelegate:self.bestAlbumArtViewController];
    [[mock expect] setDataSource:self.bestAlbumArtViewController];
    self.bestAlbumArtViewController.artTableView = mock;
    [self.bestAlbumArtViewController viewDidLoad];
    [mock verify];
}

- (void)testAddPhoneRatingsViewsForImageViewsAddsSubviews
{
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.0f, 100.0f)];
    [self.bestAlbumArtViewController performSelector:@selector(addRatingViewsForImageView:) withObject:imageView];
    
    STAssertTrue(imageView.subviews.count == 5, @"Wrong Number of buttons added to imageView expected 5 got %i", imageView.subviews.count);
}

-(void)testAlbumFetchedResultsControllerNotNil
{
    id fetcher = [self.bestAlbumArtViewController performSelector:@selector(albumFetchedResultsController)];
    
    STAssertNotNil(fetcher, @"Fetched Results Controller returned nil.");
}


//-(void)testSearchCallsRequestWithMethodPathParameters
//{
//    id mock = (id)[OCMockObject mockForClass:[LastFMClient class]];
//    NSDictionary* dictionary =@{ @"format":@"json", @"method" : @"album.search", @"album" : @"black" };
//    self.bestAlbumArtViewController.FMClient = mock;
//    [self.bestAlbumArtViewController performSelector:@selector(setSearchString:) withObject:@"black"];
//    [[mock expect] requestWithMethod:@"GET" path:@"" parameters:dictionary];
//    [self.bestAlbumArtViewController performSelector:@selector(search)];
//    [mock verify];
//}

-(void)testParseResponseObjectDictionaryFromOperationReturnsCorrectly
{
    Record* A = [Record recordWithTitle:@"A" imageURLString:@"www.a.com" artistName:@"AA"];
    Record* B = [Record recordWithTitle:@"B" imageURLString:@"www.b.com" artistName:@"BB"];
    Record* C = [Record recordWithTitle:@"C" imageURLString:@"www.c.com" artistName:@"CC"];
    NSArray* recordsArray = [[NSArray alloc] initWithObjects:A, B, C, nil];
    NSDictionary* imageDictionaryA = @{@"#text":@"www.a.com"};
    NSDictionary* imageDictionaryB = @{@"#text":@"www.b.com"};
    NSDictionary* imageDictionaryC = @{@"#text":@"www.c.com"};
    
    NSArray* imageArrayA = [NSArray arrayWithObjects:@"",@"",@"",imageDictionaryA,nil];
    NSArray* imageArrayB = [NSArray arrayWithObjects:@"",@"",@"",imageDictionaryB,nil];
    NSArray* imageArrayC = [NSArray arrayWithObjects:@"",@"",@"",imageDictionaryC,nil];
    
    NSDictionary* ADictionary = @{@"name":@"A", @"artist":@"AA",@"image":imageArrayA};
    NSDictionary* BDictionary = @{@"name":@"B", @"artist":@"BB",@"image":imageArrayB};
    NSDictionary* CDictionary = @{@"name":@"C", @"artist":@"CC",@"image":imageArrayC};
    
    NSArray* albumsArray = [NSArray arrayWithObjects:ADictionary,BDictionary,CDictionary, nil];
    
    NSDictionary* albumDictionary = @{ @"album" : albumsArray };
    NSDictionary* albumMatchesDictionary = @{@"albummatches":albumDictionary};
    NSDictionary* resultsDictionary = @{ @"results" : albumMatchesDictionary};
    
    NSArray* answer = [self.bestAlbumArtViewController performSelector:@selector(parseResponseObjectDictionary:fromOperation:) withObject:resultsDictionary withObject:nil];
    BOOL correct = YES;
    for (int i = 0; i < answer.count; i++) {
        correct = [[answer objectAtIndex:i] isEqualToRecord:[recordsArray objectAtIndex:i]] && correct;
    }
    
    STAssertTrue(correct, @"Dictionary was parsed incorrectly expeceted [A, B, C] got %@", answer);
}

-(void)testFindAndResignFirstResponder
{
    UITextField* textField = [[UITextField alloc] init];
    [textField becomeFirstResponder];
    self.bestAlbumArtViewController.searchTextField = textField;
    [self.bestAlbumArtViewController performSelector:@selector(findAndResignFirstResponder)];
    
    STAssertFalse(textField.isFirstResponder, @"The textField should no longer be the first responder.");
}

-(void)testAddActivityIndicatorViewNotNil
{
    UIActivityIndicatorView* activityIndicator = [self.bestAlbumArtViewController performSelector:@selector(activityIndicatorView)];
    
    STAssertNotNil(activityIndicator, @"The Activity Indicator returned was nil.");

}

//-(void)testNextPagePressed
//{
//    [self.bestAlbumArtViewController performSelector:@selector(setCurrentFMPage:) withObject:@0];
//    NSNumber* currentPage = [self.bestAlbumArtViewController performSelector:@selector(currentFMPage)];
//    id button = [OCMockObject mockForClass:[UIButton class]];
//    [self.bestAlbumArtViewController performSelector:@selector(setNextPageButton:) withObject:button];
//    [self.bestAlbumArtViewController performSelector:@selector(nextPagePressed:) withObject:button];
//    
//    NSNumber* nextPage = [self.bestAlbumArtViewController performSelector:@selector(currentFMPage)];
//    STAssertNotNil(currentPage, @"currentPage is nil");
//    STAssertNotNil(nextPage, @"nextPage is nil");
//    STAssertTrue([nextPage intValue] != [currentPage intValue], @"The next page should be a different page than the current one.");
//
//}




@end