//
//  PlayersViewController.m
//  Ratings
//
//  Created by Michael Dodd on 4/7/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCell.h"
@interface PlayersViewController ()

@end

@implementation PlayersViewController

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
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    Player *player = (self.players) [[indexPath row]];
    
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingsImageView .image =  [self imageForRating:player.rating];
    
//    cell.textLabel.text = player.name;
//    cell.detailTextLabel.text   = player.game;
//    
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(UIImage *)imageForRating:(int)rating
{
    switch (rating) {
        case 1:
            return [UIImage imageNamed:@"1StarSmall"];
            break;
        case 2:
            return [UIImage imageNamed:@"2StarsSmall"];
            break;
        case 3:
            return [UIImage imageNamed:@"3StarsSmall"];
            break;
        case 4:
            return [UIImage imageNamed:@"4StarsSmall"];
            break;
        case 5:
            return [UIImage imageNamed:@"5StarsSmall"];
            break;
        default:
            return nil;
    }
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPlayer"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        PlayerDetailsViewController *playerDetailsViewController = [navigationController viewControllers][0];
        playerDetailsViewController.delegate = self;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


#pragma mark - PlayerDetailsViewControllerDelegate
-(void)playerDetailsViewControllerDidCancel : (PlayerDetailsViewController *) controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)playerDetailsViewController : (PlayerDetailsViewController *) controller didAddPlayer:(Player *)player
{
    [self.players addObject:player];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] -1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
