//
//  Deck.m
//  Assignment1
//
//  Created by Jacob Prather on 1/24/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@implementation Deck

-(id)init{
    self = [super init];
    if(self){
        _cards = [[NSMutableArray alloc] init];
        [self initializeCards];
        [self shuffleCards];
    }
    return self;
}

-(Card*)dealCard{
    if([self hasCards]){
        Card *dealtCard = [_cards objectAtIndex:(0)];
        [_cards removeObjectAtIndex:(0)];
        return dealtCard;
    }else{
        return nil;
    }
}

-(BOOL)hasCards{
    return ([_cards count] > 0);
}

-(void)initializeCards // not declared
{
    Card* card;
    for(int i=1;i<14;++i){
        for(int z=0;z<4;++z){
            card = [[Card alloc] init];
            [card setValue:i];
            [card setSuit:z];
            [_cards addObject:card];
        }
    }
}

-(void)shuffleCards
{
    for(int i=0;i<1000;++i){
        NSInteger a = arc4random_uniform((int)[_cards count]);
        NSInteger b = arc4random_uniform((int)[_cards count]);
        while(a==b){ // Handle collision
            b = arc4random_uniform((int)[_cards count]);
        }
        [self swapTwoCardsInDeck:((int)a) andParam2:((int)b)];
    }
}

-(void)swapTwoCardsInDeck:(int)e andParam2:(int)n{
    Card *temp;
    temp = [_cards objectAtIndex:e];
    [_cards setObject:([_cards objectAtIndex:(n)]) atIndexedSubscript:(e)]; //put n in e's spot
    [_cards setObject:(temp) atIndexedSubscript:(n)]; //put e in n's spot.
    return;
}

@end
