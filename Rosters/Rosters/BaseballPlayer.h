//
//  BaseballPlayer.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseballPlayer : NSObject

@property(nonatomic, strong) NSString* firstName;
@property(nonatomic, strong) NSString* lastName;
@property(nonatomic, strong) NSString* position;
@property(nonatomic, strong) NSString* url;
@property(nonatomic, strong) NSString* headURL;

-(id)init;
-(id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position;
-(NSString*)fullName;

@end
