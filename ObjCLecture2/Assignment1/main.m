//
//  main.m
//  Assignment1
//
//  Created by Jacob Prather on 1/24/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Player.h"
#import "WarArena.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Initialize players, deck, arena
        
        Deck *mainDeck = [[Deck alloc] init];
        Player *a = [[Player alloc] init];
        [a setName:(@"Jake")];
        Player *b = [[Player alloc] init];
        [b setName:(@"Computer")];
        WarArena *arena = [[WarArena alloc]init];
        
        // Deal hands to players
        
        while([mainDeck hasCards]){
            [a addCard:([mainDeck dealCard])];
            [b addCard:([mainDeck dealCard])];
        }
        
        Player *winner = [arena play:(a) player2:(b)];
        
        if(winner == nil){
            NSLog(@"EDGE CASE!? TIE!");
        }
        else{
            NSLog(@"%@ Has Won!", [winner name]);
        }
    }
    return 0;
}

