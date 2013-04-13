//
//  PlayerDetailsViewController.m
//  Ratings
//
//  Created by Michael Dodd on 4/8/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//
#import "Player.h"
#import "PlayerDetailsViewController.h"

@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController
{
    NSString *_game;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init PlayerDetailsViewController");
        _game = @"Chess"; }
    return self; }


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.playerToEdit != nil)
    {
        self.title = @"Edit Player";
        self.nameTextField.text = self.playerToEdit.name;
        _game = self.playerToEdit.game;
    }
    
    self.detailLabel.text = _game;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}
-(IBAction)done:(id)sender
{
    if (self.playerToEdit != nil)
    {
        self.playerToEdit.name = self.nameTextField.text; self.playerToEdit.game = _game;
        [self.delegate playerDetailsViewController:self didEditPlayer:self.playerToEdit];
    }
    else
    {
        Player *player = [[Player alloc]init];
        player.name = self.nameTextField.text;
        player.game = _game;
        player.rating = 2;
        [self.delegate playerDetailsViewController:self didAddPlayer:player];
    }
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0)
    {
        [self.nameTextField becomeFirstResponder];
    }
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"])
         {
             GamePickerViewController *gamePickerViewController = segue.destinationViewController;
             gamePickerViewController.delegate = self;
             gamePickerViewController.game = _game;
         }
}

- (void)gamePickerViewController: (GamePickerViewController *)controller
                   didSelectGame:(NSString *)game {
    _game = game; self.detailLabel.text = _game;
    [self.navigationController popViewControllerAnimated:YES]; }


@end
