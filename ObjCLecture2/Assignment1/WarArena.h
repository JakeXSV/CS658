//
//  WarArena.h
//  Assignment1
//
//  Created by Jacob Prather on 1/28/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Player.h"

@interface WarArena : NSObject

@property(nonatomic, strong) NSMutableArray *warTreasure;

-(Player*)play:(Player*)playerA player2:(Player*)playerB;

@end
