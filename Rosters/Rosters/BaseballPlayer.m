//
//  BaseballPlayer.m
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "BaseballPlayer.h"

@implementation BaseballPlayer

-(id)init{
    return [self initWithFirstName:(@"") lastName:(@"") position:(@"")];
}

//designated initializer
-(id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position{
    self = [super init];
    if(self){
        _firstName = firstName;
        _lastName = lastName;
        _position = position;
        _headURL = @"http://sports.cbsimg.net/images/players/unknown_hat.gif";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self) {
        _firstName = [aDecoder decodeObjectForKey:(@"firstName")];
        _lastName = [aDecoder decodeObjectForKey:(@"lastName")];
        _position = [aDecoder decodeObjectForKey:(@"position")];
        _headURL = [aDecoder decodeObjectForKey:(@"headURL")];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.position forKey:@"position"];
    [aCoder encodeObject:self.headURL forKey:@"headURL"];
}



-(NSString*)fullName{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
