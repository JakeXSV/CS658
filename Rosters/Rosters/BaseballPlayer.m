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
    return [self initWithFirstName:(@"New") lastName:(@"Name") position:(@"")];
}

//designated initializer
-(id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position{
    self = [super init];
    if(self){
        _firstName = firstName;
        _lastName = lastName;
        _position = position;
    }
    return self;
}

-(NSString*)fullName{
    return [NSString stringWithFormat:(@"%@ %@", self.firstName, self.lastName)];
}

@end
