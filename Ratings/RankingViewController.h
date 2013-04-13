//
//  RankingViewController.h
//  Ratings
//
//  Created by Michael Dodd on 4/13/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *rankedPlayers;
- (IBAction)done:(id)sender;

@end
