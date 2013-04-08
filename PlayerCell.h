//
//  PlayerCell.h
//  Ratings
//
//  Created by Michael Dodd on 4/8/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *gameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingsImageView;

@end
