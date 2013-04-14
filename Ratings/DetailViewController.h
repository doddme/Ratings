//
//  DetailViewController.h
//  Ratings
//
//  Created by Michael Dodd on 4/13/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate , UIPopoverControllerDelegate>

@property (nonatomic,weak) IBOutlet UIToolbar *toolbar;

@end
