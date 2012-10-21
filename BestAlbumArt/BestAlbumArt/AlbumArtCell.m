//
//  AlbumArtCell.m
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/27/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "AlbumArtCell.h"
@interface AlbumArtCell ()


@end

@implementation AlbumArtCell

-(void)awakeFromNib
{
    [self setRatingViewImages];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setRatingViewImages
{
    UIImage* ratedImage = [UIImage imageNamed:@"goodapple.png"];
    UIImage* unratedImage = [UIImage imageNamed:@"badapple.png"];
    self.leftAlbumArtImageView.ratedImage = ratedImage;
    self.leftAlbumArtImageView.unratedImage = unratedImage;
    self.centerAlbumArtImageView.ratedImage = ratedImage;
    self.centerAlbumArtImageView.unratedImage = unratedImage;
    self.rightAlbumArtImageView.ratedImage = ratedImage;
    self.rightAlbumArtImageView.unratedImage = unratedImage;
}

-(void)setCenterImageNamed:(NSString*)imageString withImageType:(AlbumArtType)type title:(NSString*)title rating:(NSNumber*)number
{
    title = title == nil ? @"" : title;
    self.centerAlbumArtImageView.imageView.image = [self imageFromString:imageString ofType:type];
    self.centerAlbumArtImageView.titleLabel.text = title;
    self.centerAlbumArtImageView.ratingNumber = number;
}

-(void)setRightImageNamed:(NSString*)imageString withImageType:(AlbumArtType)type title:(NSString*)title rating:(NSNumber*)number
{
    title = title == nil ? @"" : title;
    self.rightAlbumArtImageView.imageView.image = [self imageFromString:imageString ofType:type];
    self.rightAlbumArtImageView.titleLabel.text = title;
    self.rightAlbumArtImageView.ratingNumber = number;
}

-(void)setLeftImageNamed:(NSString*)imageString withImageType:(AlbumArtType)type title:(NSString*)title rating:(NSNumber*)number
{
    title = title == nil ? @"" : title;
    self.leftAlbumArtImageView.imageView.image = [self imageFromString:imageString ofType:type];
    self.leftAlbumArtImageView.titleLabel.text = title;
    self.leftAlbumArtImageView.ratingNumber = number;
}

-(UIImage*)imageFromString:(NSString*)imageString ofType:(AlbumArtType)type
{
    NSString* imageType = nil;
    NSURL* url = nil;
    UIImage* image = nil;
    switch (type) {
        case AlbumArtTypePNG:
        {
            imageType = @"png";
            image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageString ofType:@"png"]];
            break;
        }
        case AlbumArtTypeJPG:
        {
            imageType = @"jpg";
            image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageString ofType:@"jpg"]];
            break;
        }
        case AlbumArtTypeURL:
        {
            url = [NSURL URLWithString:imageString];
            NSData* data = [NSData dataWithContentsOfURL:url];
            image = [UIImage imageWithData:data];
            break;
        }
        default:
            break;
    }
    return image;
}

-(UIImage*)imageFromString:(NSString*)imageString ofNumber:(NSNumber*)type
{
    return [self imageFromString:imageString ofType:[type intValue]];
}

-(void)setCenterImage:(UIImage*)image withTitle:(NSString*)title rating:(NSNumber*)number
{
    title = title == nil ? @"" : title;
    self.centerAlbumArtImageView.imageView.image = image;
    self.centerAlbumArtImageView.titleLabel.text = title;
    self.centerAlbumArtImageView.ratingNumber = number;
}

-(void)setRightImage:(UIImage*)image withTitle:(NSString*)title rating:(NSNumber*)number
{
    title = title == nil ? @"" : title;
    self.rightAlbumArtImageView.imageView.image = image;
    self.rightAlbumArtImageView.titleLabel.text = title;
    self.rightAlbumArtImageView.ratingNumber = number;
}

-(void)setLeftImage:(UIImage*)image withTitle:(NSString*)title rating:(NSNumber*)number
{
    title = title == nil ? @"" : title;
    self.leftAlbumArtImageView.imageView.image = image;
    self.leftAlbumArtImageView.titleLabel.text = title;
    self.leftAlbumArtImageView.ratingNumber = number;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



























@end
