//
//  BestAlbumArtAppDelegate.h
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/27/12.
//  Copyright (c) 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BestAlbumArtViewController;

@interface BestAlbumArtAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet BestAlbumArtViewController *viewController;

@end
