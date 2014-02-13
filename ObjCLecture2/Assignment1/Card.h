//
//  Card.h
//  Assignment1
//
//  Created by Jacob Prather on 1/24/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {Clubs, Diamonds, Hearts, Spades} Suit;

@interface Card : NSObject
//by having nonatomic, we don't worry about multi-threading
//strong & weak are other attributes, only used for objects
@property(nonatomic) int value;
@property(nonatomic) Suit suit;

@end
