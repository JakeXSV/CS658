//
//  Player.h
//  Assignment1
//
//  Created by Jacob Prather on 1/24/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Player : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSMutableArray *hand;

-(void)addCard:(Card*)card;
-(Card*)getNextCard;
-(BOOL)hasCards;
-(int)numCards;

@end
