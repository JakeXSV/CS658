//
//  BrewersPlayer.m
//  Brewers
//
//  Created by Ryan Hardt on 3/17/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersPlayer.h"

@implementation BrewersPlayer

-(id)init
{
    return [self initWithFirstName:@"" lastName:@"" position:@""];
}

-(id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position
{
    self = [super init];
    if(self) {
        _firstName = firstName;
        _lastName = lastName;
        _position = position;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self) {
        _firstName = [aDecoder decodeObjectForKey:@"firstName"];
        _lastName = [aDecoder decodeObjectForKey:@"lastName"];
        _position = [aDecoder decodeObjectForKey:@"position"];
        _infoUrl = [aDecoder decodeObjectForKey:@"url"];
        _headshotUrl = [aDecoder decodeObjectForKey:@"headshotUrl"];
    }
    return self;
}

-(NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.position forKey:@"position"];
    [aCoder encodeObject:self.infoUrl forKey:@"url"];
    [aCoder encodeObject:self.headshotUrl forKey:@"headshotUrl"];
}

@end
