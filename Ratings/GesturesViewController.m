//
//  ViewController.m
//  Ratings
//
//  Created by Michael Dodd on 4/6/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import "GesturesViewController.h"
#import "RankingViewController.h"
#import "Player.h"

@interface GesturesViewController ()

@end

@implementation GesturesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"BestPlayers"])
        {
        UINavigationController *navigationController = segue.destinationViewController;
        RankingViewController *rankingViewController = [navigationController viewControllers][0];
        rankingViewController.rankedPlayers =
        [self playersWithRating:5];
        rankingViewController.title = @"Best Players";
        }
    else if ([segue.identifier isEqualToString:@"WorstPlayers"])
        {
        UINavigationController *navigationController = segue.destinationViewController;
        RankingViewController *rankingViewController = [navigationController viewControllers][0];
        rankingViewController.rankedPlayers =
        [self playersWithRating:1];
        rankingViewController.title = @"Worst Players";
        }
}

- (NSMutableArray *)playersWithRating:(int)rating
{
    NSMutableArray *rankedPlayers = [NSMutableArray arrayWithCapacity:[self.players count]];
    for (Player *player in self.players) {
        if (player.rating == rating) [rankedPlayers addObject:player];
    }
    return rankedPlayers;
}
@end
