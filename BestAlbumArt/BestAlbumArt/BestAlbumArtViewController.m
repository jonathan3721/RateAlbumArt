//
//  BestAlbumArtViewController.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/27/12.
//  Copyright 2012 Jonathan Long. All rights reserved.
//

#import "BestAlbumArtViewController.h"
#import "Record.h"

@interface BestAlbumArtViewController ()
@property (nonatomic, strong) NSArray* albumData;
@property (nonatomic, strong) NSFetchedResultsController* albumFetchedResultsController;
@property (nonatomic, strong) NSString* searchString;
@property (nonatomic, strong) NSNumber* currentFMPage;
@property (strong, nonatomic) IBOutlet UIButton *nextPageButton;

-(IBAction)nextPagePressed:(id)sender;
@end
@implementation BestAlbumArtViewController
@synthesize nextPageButton = _nextPageButton;
@synthesize searchTextField;
@synthesize artTableView;
@synthesize albumArtCell;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.artTableView.delegate = self;
    self.artTableView.dataSource = self;
    self.albumData = [[NSArray alloc] init];
    
    self.searchTextField.delegate = self;
    
    NSError* error;
    BOOL success = [self.albumFetchedResultsController performFetch:&error];
    if (success == NO) {
        NSLog(@"FAILED TO FETCH ALBUMS");
    }
 
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.searchTextField) {
        self.searchString = self.searchTextField.text;
        [self search];
    }
    return YES;
}

#pragma mark - Configuring Cells

-(void)addRatingViewsForImageView:(UIImageView*)imageView
{
    UIButton* button = nil;
    CGFloat buttonX = 0.0f;
    CGFloat imageViewMaxY = CGRectGetMaxY(imageView.frame);
    CGFloat buttonHeight = 64.0f;
    CGFloat imageViewWidth = imageView.frame.size.width;
    CGFloat buttonWidth = 0.0f;
    while (buttonX < imageView.frame.size.width) {
        buttonWidth = imageViewWidth/5.0f - 10.0f;
        button = [[UIButton alloc] initWithFrame:CGRectMake(buttonX + 10.0f, imageViewMaxY - buttonHeight, buttonWidth, buttonHeight)];
        buttonX += imageViewWidth/5.f;
        [self configureRatingButton:button];
        [imageView addSubview:button];
    }
    
}

-(void)configureRatingButton:(UIButton*)button
{
    UIImage* goodApple = [UIImage imageNamed:@"goodapple.png"];
    UIImage* badApple = [UIImage imageNamed:@"badApple.png"];
    
    [button setBackgroundImage:goodApple forState:UIControlStateSelected];
    [button setBackgroundImage:badApple forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(albumRated) forControlEvents:UIControlEventTouchDown];
}

#pragma mark - UITableView Datasource/Delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumArtCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"AlbumArtCell" owner:self options:nil];
    }
    
    cell = self.albumArtCell;
    self.albumArtCell = nil;
    Record* leftRecord = nil;
    Record* centerRecord = nil;
    Record* rightRecord = nil;
    NSInteger index = indexPath.row * 3;
    NSArray* fetchedObjects = self.albumData;
    leftRecord = index < fetchedObjects.count ? [fetchedObjects objectAtIndex:index] : [NSNull null];
    centerRecord = index + 1 < fetchedObjects.count ? [fetchedObjects objectAtIndex:index + 1] : [NSNull null];
    rightRecord = index + 2 < fetchedObjects.count ? [fetchedObjects objectAtIndex:index + 2] : [NSNull null];
    NSArray* data = @[ leftRecord, centerRecord, rightRecord ];
    
    [self configureAlbumArtCell:cell withData:data];

    return cell;
    
    
}

-(void)configureAlbumArtCell:(AlbumArtCell*)cell withData:(NSArray*)data
{
    NSAssert(data.count == 3, @"Album Art cells require 3 records per cell. Null is an acceptable record to include in the data array.");
    Record* leftRecord = [data objectAtIndex:0];
    Record* centerRecord = [data objectAtIndex:1];
    Record* rightRecord = [data objectAtIndex:2];
    if ([leftRecord isEqual:[NSNull null]]) {
        cell.leftAlbumArtImageView.hidden = YES;
    }
    else {
        [cell setLeftImage:leftRecord.albumArt withTitle:leftRecord.title rating:leftRecord.rating];
    }
    if ([centerRecord isEqual:[NSNull null]]) {
        cell.centerAlbumArtImageView.hidden = YES;
    }
    else {
        [cell setCenterImage:centerRecord.albumArt withTitle:centerRecord.title rating:centerRecord.rating];
    }
    if ([rightRecord isEqual:[NSNull null]]) {
        cell.rightAlbumArtImageView.hidden = YES;
    }
    else {
        [cell setRightImage:rightRecord.albumArt withTitle:rightRecord.title rating:rightRecord.rating];
    }
    cell.centerAlbumArtImageView.delegate = self;
    cell.leftAlbumArtImageView.delegate = self;
    cell.leftAlbumArtImageView.delegate = self;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.albumData.count / 3;
}

- (void)viewDidUnload
{
    [self setArtTableView:nil];
    [self setAlbumArtCell:nil];
    [self setSearchTextField:nil];
    [self setNextPageButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - RatedImageViewDelegate
-(void)didRateImage:(UIView*)albumArt withNumber:(NSNumber *)rating
{
    RatedImageView* albumArtImage = nil;
    
    if ([albumArt isKindOfClass:[RatedImageView class]])
    {
        albumArtImage = (RatedImageView*)albumArt;
    }
    
    NSString* name = nil;
    if (albumArtImage != nil)
    {
        name = albumArtImage.titleLabel.text;
    }
    
    Record* thisRecord = [Record findFirstWithPredicate:[NSPredicate predicateWithFormat:@"title == %@", name]];
    thisRecord.rating = rating;
    NSManagedObjectContext* context = [NSManagedObjectContext defaultContext];
    [context save];
}

#pragma mark - Getters
-(NSFetchedResultsController*)albumFetchedResultsController
{
    NSFetchedResultsController* controller = _albumFetchedResultsController;
    if (_albumFetchedResultsController == nil) {
        controller = [Record fetchAllSortedBy:@"title" ascending:YES withPredicate:nil groupBy:nil delegate:self inContext:[NSManagedObjectContext defaultContext]];
    }
    
    return controller;
}

-(void)search
{
    UIActivityIndicatorView* activityIndicator = [self activityIndicatorView];
    activityIndicator.color = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.5f];
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    NSNumber* pageNumber = self.currentFMPage == nil ? @0 : @([self.currentFMPage intValue] +1);
    NSString* page = [pageNumber stringValue];
    NSDictionary* dictionary = @{@"format" : @"json", @"method" : @"album.search", @"album" : self.searchString, @"page":page};
    NSMutableURLRequest* request =  [self.FMClient requestWithMethod:@"GET" path:@"" parameters:dictionary];
    AFHTTPRequestOperation* requestOp = [self.FMClient HTTPRequestOperationWithRequest:request
                                           success:^(AFHTTPRequestOperation *operation, id responseObject){
                                               if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                                   self.albumData = [self parseResponseObjectDictionary:(NSDictionary*)responseObject
                                                                         fromOperation:operation];
                                               }
                                               NSLog(@"%@",responseObject);
                                               [self.artTableView reloadData];
                                               [activityIndicator stopAnimating];
                                               [activityIndicator removeFromSuperview];
                                           
                                           }
                                           failure:^(AFHTTPRequestOperation *operation, NSError* error){
                                               NSLog(@"Failed request.");
                                               [activityIndicator stopAnimating];
                                               [activityIndicator removeFromSuperview];
                                           }];
    
    [self.FMClient enqueueHTTPRequestOperation:requestOp];
    [self findAndResignFirstResponder];
    
}

-(NSArray*)parseResponseObjectDictionary:(NSDictionary*)responseDictionary fromOperation:(AFHTTPRequestOperation*)operation
{
    NSMutableArray* recordObjects = [[NSMutableArray alloc] init];
    NSDictionary* resultsDictionary = [responseDictionary objectForKey:@"results"];
    NSString* startPage = [[resultsDictionary objectForKey:@"opensearch:Query"] objectForKey:@"startPage"];
    self.currentFMPage = @([startPage intValue]);
    NSDictionary* albumMatchesDictionary = [resultsDictionary objectForKey:@"albummatches"];
    NSArray* album = [albumMatchesDictionary objectForKey:@"album"];
    
    for (int i = 0; i < album.count; i++) {
        NSDictionary* nextAlbum = [album objectAtIndex:i];
        NSString* title = [nextAlbum objectForKey:@"name"];
        NSString* artistName = [nextAlbum objectForKey:@"artist"];
        NSString* imageURL = [[[nextAlbum objectForKey:@"image"] objectAtIndex:3] objectForKey:@"#text"];
        Record* newRecord = [Record recordWithTitle:title imageURLString:imageURL artistName:artistName];
        [recordObjects addObject:newRecord];
    }
    [[NSManagedObjectContext defaultContext] save];
    return recordObjects;
}

-(void)findAndResignFirstResponder
{
    NSArray* subviews = [self.view subviews];
    
    for (UIView* view in subviews) {
        if ([view isFirstResponder]) {
            [view resignFirstResponder];
        }
    }
}

-(UIActivityIndicatorView*)activityIndicatorView
{
    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat activityIndicatorX = screenBounds.origin.x + screenBounds.size.width/2.f;
    CGFloat activityIndicatorY = screenBounds.origin.y + screenBounds.size.height/2.f - 0.5f;
    CGPoint activityIndicatorCenter = CGPointMake(activityIndicatorX, activityIndicatorY);
    activityIndicator.center = activityIndicatorCenter;
    
    return activityIndicator;
}

-(IBAction)nextPagePressed:(id)sender
{
    NSLog(@"Working");
    [self search];
}



@end
