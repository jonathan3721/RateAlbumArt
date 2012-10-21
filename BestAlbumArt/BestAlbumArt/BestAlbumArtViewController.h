//
//  BestAlbumArtViewController.h
//  BestAlbumArt
//
//  Created by Jonathan Long on 8/27/12.
//  Copyright 2012 Jonathan Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumArtCell.h"
#import "LastFMClient.h"

@interface BestAlbumArtViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, RatedImageViewDelegate, NSFetchedResultsControllerDelegate, UITextFieldDelegate> {
    
}
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UITableView *artTableView;
@property (strong, nonatomic) IBOutlet AlbumArtCell *albumArtCell;
@property (strong, nonatomic) LastFMClient* FMClient;

@end
