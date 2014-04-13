//
//  BrewersPlayer.m
//  brewers
//
//  Created by Jake on 4/13/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersPlayer.h"


@implementation BrewersPlayer

@dynamic firstName;
@dynamic lastName;
@dynamic infoUrl;
@dynamic headshotUrl;
@dynamic position;

/*
 NONE,
 PITCHER,
 CATCHER,
 FIRST_BASE,
 SECOND_BASE,
 THIRD_BASE,
 SHORTSTOP,
 LEFT_FIELD,
 CENTER_FIELD,
 RIGHT_FIELD
 */

-(NSString*)nameForPosition:(Position)position{
    switch(position){
        case NONE:
            return @"None";
        case PITCHER:
            return @"Pitcher";
        case CATCHER:
            return @"Catcher";
        case FIRST_BASE:
            return @"First Base";
        case SECOND_BASE:
            return @"Second Base";
        case THIRD_BASE:
            return @"Third Base";
        case SHORTSTOP:
            return @"Shortstop";
        case LEFT_FIELD:
            return @"Left Field";
        case CENTER_FIELD:
            return @"Center Field";
        case RIGHT_FIELD:
            return @"Right Field";
    }
}

-(NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
