//
//  GamePickerViewController.m
//  Ratings
//
//  Created by Michael Dodd on 4/9/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import "GamePickerViewController.h"

@interface GamePickerViewController ()

@end

@implementation GamePickerViewController
{
    NSArray *_games;
    NSUInteger _selectedIndex;
}

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
    _games = @[
               @"Angry Birds",
               @"Chess",
               @"Trivial Pursuit",
               @"Spin the Bottle",
               @"Texas Hold'em Poker",
               @"Tic-Tac-Toe"
               ];
    _selectedIndex = [_games indexOfObject:self.game];
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_games count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GameCell";  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _games[indexPath.row];
    if (indexPath.row == _selectedIndex)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_selectedIndex != NSNotFound)
    {
        UITableViewCell *cell =  [tableView cellForRowAtIndexPath:[NSIndexPath
                                                                   indexPathForRow:_selectedIndex inSection:0]]; cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    _selectedIndex = indexPath.row; UITableViewCell *cell = [tableView
                                                             cellForRowAtIndexPath:indexPath]; cell.accessoryType = UITableViewCellAccessoryCheckmark;
    NSString *game = _games[indexPath.row]; [self.delegate gamePickerViewController:self
                                                                                                                                                didSelectGame:game];
    
}

@end
