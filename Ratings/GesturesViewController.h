//
//  ViewController.h
//  Ratings
//
//  Created by Michael Dodd on 4/6/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GesturesViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizer;
@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) NSArray *players;
@end

