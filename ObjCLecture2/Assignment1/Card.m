//
//  Card.m
//  Assignment1
//
//  Created by Jacob Prather on 1/24/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "Card.h"

@implementation Card

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ Of %@", [self nameForValue], [self nameForSuit]];
}

-(NSString *)nameForValue
{
    if(_value>=2 && _value<=10){
        return [NSString stringWithFormat:@"%d", _value];
    }else if(_value==1){
        return @"Ace";
    }else if(_value==11){
        return @"Jack";
    }else if(_value==12){
        return @"Queen";
    }else if(_value==13){
        return @"King";
    }
    return @"error";
}

-(NSString *)nameForSuit{
    if(_suit == Clubs){
        return @"Clubs";
    }else if(_suit == Spades){
        return @"Spades";
    }else if(_suit == Hearts){
        return @"Hearts";
    }else if(_suit == Diamonds){
        return @"Diamonds";
    }else{
        return @"error";
    }
}

@end
