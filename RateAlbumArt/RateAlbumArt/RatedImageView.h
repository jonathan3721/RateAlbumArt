//
//  RatedImageView.h
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/28/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RatedImageViewDelegate <NSObject>

-(void)didRateImage:(UIView*)albumArt withNumber:(NSNumber*)rating;

@end
@interface RatedImageView : UIView
#pragma mark - subviews
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) id <RatedImageViewDelegate> delegate;
@property (strong, nonatomic) NSNumber* ratingNumber;
@property (strong, nonatomic) UIImage* ratedImage;
@property (strong, nonatomic) UIImage* unratedImage;





@end
