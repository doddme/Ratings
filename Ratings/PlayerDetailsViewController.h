//
//  PlayerDetailsViewController.h
//  Ratings
//
//  Created by Michael Dodd on 4/8/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePickerViewController.h"

@class Player;
@class PlayerDetailsViewController;
@protocol PlayerDetailsViewControllerDelegate <NSObject>

-(void) playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *) controller;
//-(void) playerDetailsViewControllerDidSave:(PlayerDetailsViewController *) controller;
-(void) playerDetailsViewController:(PlayerDetailsViewController *) controller didAddPlayer:(Player *)player;
-(void) playerDetailsViewController:(PlayerDetailsViewController *) controller didEditPlayer:(Player *)player;
@end

@interface PlayerDetailsViewController : UITableViewController <GamePickerViewControllerDelegate>
@property (nonatomic,weak) id <PlayerDetailsViewControllerDelegate> delegate;
-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *Stupidname;
@property (strong, nonatomic) Player *playerToEdit;

@end
