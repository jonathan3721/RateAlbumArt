//
//  JLRatedImageViewCell.h
//  RateAlbumArt
//
//  Created by Jonathan Long on 10/20/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JLRatedImageViewCellDelegate <NSObject>

-(void)didRateImage:(UIView*)albumArt withNumber:(NSNumber*)rating;

@end
@interface JLRatedImageViewCell : UICollectionViewCell

#pragma mark - subviews
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) id <JLRatedImageViewCellDelegate> delegate;
@property (strong, nonatomic) NSNumber* ratingNumber;
@property (strong, nonatomic) UIImage* ratedImage;
@property (strong, nonatomic) UIImage* unratedImage;

@end
