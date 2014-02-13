//
//  Player.m
//  Assignment1
//
//  Created by Jacob Prather on 1/24/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id)init{
    self = [super init];
    if(self){
        _hand = [[NSMutableArray alloc] init]; // Pass alloc message to NSMutableArray, that returns allocated memory, then pass init message to allocated memory to init.
        // [self setHand: [[NSMutableArray alloc] init]; another way
    }
    return self;
}

-(void)addCard:(Card*)card{
    [_hand addObject:(card)];
}

-(Card*)getNextCard{
    Card *nextCard = [_hand objectAtIndex:(0)];
    [_hand removeObjectAtIndex:0];
    return nextCard;
}

-(BOOL)hasCards{
    return ([_hand count]>0);
}

-(int)numCards{
    return ((int)[_hand count]);
}

-(NSString*) description{ // description is similar to java's toString(), its inherited from super
    return _name;
}

@end
