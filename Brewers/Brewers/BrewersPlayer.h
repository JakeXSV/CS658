//
//  BrewersPlayer.h
//  Brewers
//
//  Created by Ryan Hardt on 3/17/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrewersPlayer : NSObject<NSCoding>

@property(nonatomic, strong) NSString* firstName;
@property(nonatomic, strong) NSString* lastName;
@property(nonatomic, strong) NSString* position;
@property(nonatomic, strong) NSString* infoUrl;
@property(nonatomic, strong) NSString* headshotUrl;

-(id)init;
-(id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position;
-(NSString*)fullName;

@end
