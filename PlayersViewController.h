//
//  PlayersViewController.h
//  Ratings
//
//  Created by Michael Dodd on 4/7/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray *players;
@end
