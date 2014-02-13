//
//  WarArena.m
//  Assignment1
//
//  Created by Jacob Prather on 1/28/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "WarArena.h"

@implementation WarArena

-(id)init{
    if(self){
        _warTreasure = [[NSMutableArray alloc]init];
    }
    return self;
}

-(Player*)play:(Player*)playerA player2:(Player*)playerB{
    
    while(true){
        
    // Check if either player is out of cards.
    if(![playerA hasCards] && ![playerB hasCards]){return nil;}
    if(![playerA hasCards]){return playerB;}
    if(![playerB hasCards]){return playerA;}
    
    // Print number of cards.
    NSLog(@"%@ has %d cards.",[playerA name],[playerA numCards]);
    NSLog(@"%@ has %d cards.",[playerB name],[playerB numCards]);
    
    // Get battle cards.
    Card *cardA = [playerA getNextCard];
    Card *cardB = [playerB getNextCard];
    
    // Add battle cards to treasure.
    [_warTreasure addObject:(cardA)];
    [_warTreasure addObject:(cardB)];
    
    // Print played cards.
    NSLog(@"%@ played %@", [playerA name], [cardA description]);
    NSLog(@"%@ played %@", [playerB name], [cardB description]);
    
    // Deal with scenarios
    if([cardA value] == [cardB value]){
        
        NSLog(@"------WAR------");
        
        // Check if players don't have enough cards for war
        if([playerA numCards] < 4){
            return playerB;
        }
        if([playerB numCards] < 4){
            return playerA;
        }
        
        // Add 3 cards
        for(int i=0;i<3;i++){
            NSLog(@"%@ is discarding...", [playerA name]);
            NSLog(@"%@ is discarding...", [playerB name]);
            [_warTreasure addObject:([playerA getNextCard])];
            [_warTreasure addObject:([playerB getNextCard])];
        }
    
    }else if([cardA value] > [cardB value]){
        // Player A wins the treasure
        while([_warTreasure count]){
            [playerA addCard:([_warTreasure objectAtIndex:(0)])];
            [_warTreasure removeObjectAtIndex:(0)];
        }
        
    }else if([cardA value] < [cardB value]){
        // Player B wins the treasure
        while([_warTreasure count]){
            [playerB addCard:([_warTreasure objectAtIndex:(0)])];
            [_warTreasure removeObjectAtIndex:(0)];
        }
        
    }
        NSLog(@" ");
    }

}

@end
