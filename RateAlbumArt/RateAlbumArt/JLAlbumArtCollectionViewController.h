//
//  JLAlbumArtCollectionViewController.h
//  RateAlbumArt
//
//  Created by Jonathan Long on 10/20/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLAlbumArtCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
