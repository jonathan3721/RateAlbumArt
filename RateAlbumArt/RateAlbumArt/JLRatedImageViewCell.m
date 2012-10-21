//
//  JLRatedImageViewCell.m
//  RateAlbumArt
//
//  Created by Jonathan Long on 10/20/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import "JLRatedImageViewCell.h"
#define APPLE_BUTTON_WIDTH 35.0f
#define APPLE_BUTTON_HEIGHT 37.0f
#define DEFAULT_TITLE_COLOR [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f]
@interface JLRatedImageViewCell ()
@property (strong, nonatomic) IBOutlet UIButton *oneAppleButton;
@property (strong, nonatomic) IBOutlet UIButton *twoAppleButton;
@property (strong, nonatomic) IBOutlet UIButton *threeAppleButton;
@property (strong, nonatomic) IBOutlet UIButton *fourAppleButton;
@property (strong, nonatomic) IBOutlet UIButton *fiveAppleButton;
-(IBAction)ratingGiven:(id)sender;
@end

@implementation JLRatedImageViewCell



-(void)awakeFromNib
{
    [self initialize];
    
}

#pragma mark - Initializers
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    self.ratingNumber = @0;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(18.0f, 0.0f, 175.0f, 175.0f)];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(18.0f, 173.0f, 192.0f, 35.0f)];
    self.titleLabel.textColor = DEFAULT_TITLE_COLOR;
    self.titleLabel.font = [UIFont fontWithName:@"Copperplate-Bold" size:20.0f];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.oneAppleButton = [[UIButton alloc] initWithFrame:CGRectMake(21.0f, 200.0f, APPLE_BUTTON_WIDTH, APPLE_BUTTON_WIDTH)];
    self.twoAppleButton = [[UIButton alloc] initWithFrame:CGRectMake(54.0f, 200.0f, APPLE_BUTTON_WIDTH, APPLE_BUTTON_WIDTH)];
    self.threeAppleButton = [[UIButton alloc] initWithFrame:CGRectMake(88.0f, 200.0f, APPLE_BUTTON_WIDTH, APPLE_BUTTON_WIDTH)];
    self.fourAppleButton = [[UIButton alloc] initWithFrame:CGRectMake(121.0f, 200.0f, APPLE_BUTTON_WIDTH, APPLE_BUTTON_WIDTH)];
    self.fiveAppleButton = [[UIButton alloc] initWithFrame:CGRectMake(155.0f, 200.0f, APPLE_BUTTON_WIDTH, APPLE_BUTTON_WIDTH)];
    
    [self.oneAppleButton setBackgroundImage:self.ratedImage forState:UIControlStateSelected];
    [self.twoAppleButton setBackgroundImage:self.ratedImage forState:UIControlStateSelected];
    [self.threeAppleButton setBackgroundImage:self.ratedImage forState:UIControlStateSelected];
    [self.fourAppleButton setBackgroundImage:self.ratedImage forState:UIControlStateSelected];
    [self.fiveAppleButton setBackgroundImage:self.ratedImage forState:UIControlStateSelected];
    
    [self.oneAppleButton setBackgroundImage:self.unratedImage forState:UIControlStateNormal];
    [self.twoAppleButton setBackgroundImage:self.unratedImage forState:UIControlStateNormal];
    [self.threeAppleButton setBackgroundImage:self.unratedImage forState:UIControlStateNormal];
    [self.fourAppleButton setBackgroundImage:self.unratedImage forState:UIControlStateNormal];
    [self.fiveAppleButton setBackgroundImage:self.unratedImage forState:UIControlStateNormal];
    
    [self.oneAppleButton addTarget:self action:@selector(ratingGiven:) forControlEvents:UIControlEventTouchUpInside];
    [self.twoAppleButton addTarget:self action:@selector(ratingGiven:) forControlEvents:UIControlEventTouchUpInside];
    [self.threeAppleButton addTarget:self action:@selector(ratingGiven:) forControlEvents:UIControlEventTouchUpInside];
    [self.fourAppleButton addTarget:self action:@selector(ratingGiven:) forControlEvents:UIControlEventTouchUpInside];
    [self.fiveAppleButton addTarget:self action:@selector(ratingGiven:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.oneAppleButton];
    [self addSubview:self.twoAppleButton];
    [self addSubview:self.threeAppleButton];
    [self addSubview:self.fourAppleButton];
    [self addSubview:self.fiveAppleButton];
    
}

#pragma mark - IBActions
-(IBAction)ratingGiven:(id)sender
{
    UIButton* appleButton = nil;
    if ([sender isKindOfClass:[UIButton class]]) {
        appleButton = (UIButton*)sender;
    }
    
    
    if (appleButton != nil) {
        if (appleButton == self.oneAppleButton) {
            self.ratingNumber = @1;
        }
        else if (appleButton == self.twoAppleButton)
        {
            self.ratingNumber = @2;
        }
        else if (appleButton == self.threeAppleButton)
        {
            self.ratingNumber = @3;
        }
        else if (appleButton == self.fourAppleButton)
        {
            self.ratingNumber = @4;
        }
        else
        {
            self.ratingNumber = @5;
        }
        
        if (self.oneAppleButton.selected) {
            NSLog(@"YES");
        }
        [self.delegate didRateImage:self withNumber:self.ratingNumber];
    }
    
}

#pragma mark - Setters

-(void)setRatingNumber:(NSNumber *)ratingNumber
{
    if ([_ratingNumber intValue] != [ratingNumber intValue] ) {
        _ratingNumber = ratingNumber;
        
        BOOL selected = YES;
        
        int ratingAbsoluteValue = abs([ratingNumber intValue]);
        
        switch (ratingAbsoluteValue) {
            case 5:
                self.fiveAppleButton.selected = selected;
                self.fourAppleButton.selected = selected;
                self.threeAppleButton.selected = selected;
                self.twoAppleButton.selected = selected;
                self.oneAppleButton.selected = selected;
                break;
            case 4:
                self.fiveAppleButton.selected = !selected;
                self.fourAppleButton.selected = selected;
                self.threeAppleButton.selected = selected;
                self.twoAppleButton.selected = selected;
                self.oneAppleButton.selected = selected;
                break;
            case 3:
                self.fiveAppleButton.selected = !selected;
                self.fourAppleButton.selected = !selected;
                self.threeAppleButton.selected = selected;
                self.twoAppleButton.selected = selected;
                self.oneAppleButton.selected = selected;
                break;
            case 2:
                self.fiveAppleButton.selected = !selected;
                self.fourAppleButton.selected = !selected;
                self.threeAppleButton.selected = !selected;
                self.twoAppleButton.selected = selected;
                self.oneAppleButton.selected = selected;
                break;
            case 1:
                self.fiveAppleButton.selected = !selected;
                self.fourAppleButton.selected = !selected;
                self.threeAppleButton.selected = !selected;
                self.twoAppleButton.selected = !selected;
                self.oneAppleButton.selected = selected;
                break;
            case 0:
                self.fiveAppleButton.selected = NO;
                self.fourAppleButton.selected = NO;
                self.threeAppleButton.selected = NO;
                self.twoAppleButton.selected = NO;
                self.oneAppleButton.selected = NO;
                break;
            default:
                break;
        }
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
