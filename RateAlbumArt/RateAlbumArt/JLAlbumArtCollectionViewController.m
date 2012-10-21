//
//  JLAlbumArtCollectionViewController.m
//  RateAlbumArt
//
//  Created by Jonathan Long on 10/20/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "JLAlbumArtCollectionViewController.h"
#import "JLAlbum.h"
#import "JLRatedImageViewCell.h"

@interface JLAlbumArtCollectionViewController ()

@end

@implementation JLAlbumArtCollectionViewController

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
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[JLRatedImageViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JLRatedImageViewCell* cell = [self.collectionView
                                  dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell"
                                  forIndexPath:indexPath];
    
    cell.ratingNumber = @(indexPath.row % 5);
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegate




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
