//
//  GamePickerViewController.h
//  Ratings
//
//  Created by Michael Dodd on 4/9/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GamePickerViewController;
@protocol GamePickerViewControllerDelegate <NSObject>
    -(void) gamePickerViewController: (GamePickerViewController *)controller didSelectGame: game;
@end

@interface GamePickerViewController : UITableViewController
@property (nonatomic,weak) id <GamePickerViewControllerDelegate> delegate;
@property (nonatomic,weak) NSString *game;

@end
