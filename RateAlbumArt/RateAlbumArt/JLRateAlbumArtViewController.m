//
//  JLRateAlbumArtViewController.m
//  RateAlbumArt
//
//  Created by Jonathan Long on 10/21/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "JLRateAlbumArtViewController.h"
#import "JLRatedImageViewCell.h"
#import "LastFMClient.h"
#import "JLAlbum.h"


@interface JLRateAlbumArtViewController ()
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UICollectionView *albumArtCollectionView;
@property (strong, nonatomic) NSNumber* currentFMPage;
@property (strong, nonatomic) LastFMClient* FMClient;
@property (strong, nonatomic) NSArray* albumData;

@end

@implementation JLRateAlbumArtViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupLastFMClient];
    [self setDelegates];
    [self setDataSource];
}


-(void)setDelegates
{
    [self.searchTextField setDelegate:self];
    [self.albumArtCollectionView setDelegate:self];
}

-(void)setDataSource
{
    [self.albumArtCollectionView setDataSource:self];
}

-(void)setupLastFMClient
{
    self.FMClient = [LastFMClient sharedFMClient];
}

-(void)setupCollectionView
{
    [self.albumArtCollectionView registerClass:[JLRatedImageViewCell class] forCellWithReuseIdentifier:@"albumArtCell"];
    
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.searchTextField) {
        [self searchForAlbumsWithString:textField.text];
        [self.searchTextField resignFirstResponder];
    }
    
    return YES;
}

#pragma mark - API search methods

-(void)searchForAlbumsWithString:(NSString*)searchString
{
    UIActivityIndicatorView* activityIndicator = [self activityIndicatorView];
    activityIndicator.color = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.5f];
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    NSNumber* pageNumber = self.currentFMPage == nil ? @0 : @([self.currentFMPage intValue] +1);
    NSString* page = [pageNumber stringValue];
    NSDictionary* dictionary = @{@"format" : @"json", @"method" : @"album.search", @"album" : searchString, @"page":page};
    NSMutableURLRequest* request =  [self.FMClient requestWithMethod:@"GET" path:@"" parameters:dictionary];
    AFHTTPRequestOperation* requestOp = [self.FMClient
                                         HTTPRequestOperationWithRequest:request
                                         success:^(AFHTTPRequestOperation *operation, id responseObject)
                                         {
                                             if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                                 self.albumData = [self parseResponseObjectDictionary:(NSDictionary*)responseObject
                                                                                        fromOperation:operation];
                                             }
                                             NSLog(@"%@",responseObject);
                                             [self.albumArtCollectionView reloadData];
                                             [activityIndicator stopAnimating];
                                             [activityIndicator removeFromSuperview];
                                             
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError* error)
                                         {
                                             NSLog(@"Failed request.");
                                             [activityIndicator stopAnimating];
                                             [activityIndicator removeFromSuperview];
                                         }];
    
    [self.FMClient enqueueHTTPRequestOperation:requestOp];
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
        JLAlbum* newRecord = [JLAlbum albumWithTitle:title imageURLString:imageURL artistName:artistName];
        [recordObjects addObject:newRecord];
    }
    [[NSManagedObjectContext defaultContext] save];
    return recordObjects;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.albumData count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JLRatedImageViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"albumArtCell" forIndexPath:indexPath];
    
    cell.im
}

@end
