//
//  Player.h
//  Ratings
//
//  Created by Michael Dodd on 4/7/13.
//  Copyright (c) 2013 Michael Dodd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *game;
@property (nonatomic,assign) int rating;

@end
