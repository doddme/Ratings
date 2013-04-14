//
//  DetailViewController.m
//  Ratings
//
//  Created by Michael Dodd on 4/13/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import "DetailViewController.h"
@implementation DetailViewController
{
    UIPopoverController *_masterPopoverController;
    UIPopoverController *_menuPopoverController;
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark  UISplitViewControllerDelegate Info

- (void)splitViewController: (UISplitViewController *)splitViewController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = @"Master";
    NSMutableArray *items = [[self.toolbar items] mutableCopy]; [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES]; _masterPopoverController = popoverController;
}

- (void)splitViewController:
(UISplitViewController *)splitController
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy]; [items removeObject:barButtonItem];
    [self.toolbar setItems:items animated:YES]; _masterPopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowPopover"])
    {
        if (_menuPopoverController != nil &&  _menuPopoverController .popoverVisible )
        {
            [_menuPopoverController dismissPopoverAnimated:NO];
        }
        _menuPopoverController =    ((UIStoryboardPopoverSegue *)segue).popoverController;
        _menuPopoverController.delegate = self;
    }
}
#pragma mark - PopOver delegate functions
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    _menuPopoverController.delegate = nil;
    _menuPopoverController = nil;
}
-(void)willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)Duration
{
    if (_menuPopoverController != nil && _menuPopoverController.popoverVisible)
    {
        [_menuPopoverController dismissPopoverAnimated:YES];
        _menuPopoverController = nil;
    }
}

@end