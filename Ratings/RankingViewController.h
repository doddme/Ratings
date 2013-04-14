//
//  RankingViewController.h
//  Ratings
//
//  Created by Michael Dodd on 4/13/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatePlayerViewController.h"
@interface RankingViewController : UITableViewController <RatePlayerViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *rankedPlayers;
- (IBAction)done:(id)sender;
@property (nonatomic, assign) int requiredRating;
@end
