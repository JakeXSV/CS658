//
//  BrewersPlayer.h
//  brewers
//
//  Created by Ryan Hardt on 4/2/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum{
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
} Position;

@interface BrewersPlayer : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * position;
@property (nonatomic, retain) NSString * infoUrl;
@property (nonatomic, retain) NSString * headshotUrl;

+(NSString*)nameForPosition:(Position)position;
-(NSString*)fullName;

@end
