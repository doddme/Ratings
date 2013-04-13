//
//  RatePlayerViewController.m
//  Ratings
//
//  Created by Michael Dodd on 4/12/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import "RatePlayerViewController.h"
#import "Player.h"

@interface RatePlayerViewController ()

@end

@implementation RatePlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.player.name;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rateAction:(UIButton *)sender {
    self.player.rating = sender.tag;
    [self.delegate ratePlayerViewController:self
                                                      didPickRatingForPlayer:self.player];
}

@end



