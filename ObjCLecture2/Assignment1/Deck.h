//
//  Deck.h
//  Assignment1
//
//  Created by Jacob Prather on 1/24/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card; // This tells obj-c that the Card class exists. Use this when you don't use internal functions from a class.

@interface Deck : NSObject

//read only - cannot mutate, not sure why prof doesn't just use NSArray w/o readonly attribute
@property(nonatomic, strong, readonly) NSMutableArray *cards;

-(Card*)dealCard;
-(BOOL)hasCards;

@end
