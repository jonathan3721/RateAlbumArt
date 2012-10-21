//
//  AlbumArtCell.h
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/27/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatedImageView.h"

typedef enum{
    AlbumArtTypePNG,
    AlbumArtTypeJPG,
    AlbumArtTypeURL
} AlbumArtType;

@interface AlbumArtCell : UITableViewCell
@property (strong, nonatomic) RatedImageView *leftAlbumArtImageView;
@property (strong, nonatomic) RatedImageView *centerAlbumArtImageView;
@property (strong, nonatomic) RatedImageView *rightAlbumArtImageView;

-(void)setLeftImageNamed:(NSString*)imageString withImageType:(AlbumArtType)type title:(NSString*)title rating:(NSNumber*)number;
-(void)setCenterImageNamed:(NSString*)imageString withImageType:(AlbumArtType)type title:(NSString*)title rating:(NSNumber*)number;
-(void)setRightImageNamed:(NSString*)imageString withImageType:(AlbumArtType)type title:(NSString*)title rating:(NSNumber*)number;

-(void)setCenterImage:(UIImage*)image withTitle:(NSString*)title rating:(NSNumber*)number;
-(void)setRightImage:(UIImage*)image withTitle:(NSString*)title rating:(NSNumber*)number;
-(void)setLeftImage:(UIImage*)image withTitle:(NSString*)title rating:(NSNumber*)number;
@end
