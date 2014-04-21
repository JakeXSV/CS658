//
//  BrewersPlayer.m
//  brewers
//
//  Created by Ryan Hardt on 4/2/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersPlayer.h"


@implementation BrewersPlayer

@dynamic firstName;
@dynamic lastName;
@dynamic position;
@dynamic infoUrl;
@dynamic headshotUrl;

+(NSString*)nameForPosition:(Position)position
{
    if(position == PITCHER) {
        return @"Pitcher";
    } else if(position == CATCHER) {
        return @"Catcher";
    } else if(position == FIRST_BASE) {
        return @"First Base";
    } else if(position == SECOND_BASE) {
        return @"Second Base";
    } else if(position == THIRD_BASE) {
        return @"Third Base";
    } else if(position == SHORTSTOP) {
        return @"Shortstop";
    } else if(position == LEFT_FIELD) {
        return @"Left Field";
    } else if(position == CENTER_FIELD) {
        return @"Center Field";
    } else if(position == RIGHT_FIELD) {
        return @"Right Field";
    } else {
        return @"None";
    }
}

-(NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
