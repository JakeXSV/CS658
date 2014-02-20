//
//  MapAnnotation.m
//  mapit
//
//  Created by jprather on 2/20/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//


#import "MapAnnotation.h"

@implementation MapAnnotation

-(id)init{
    _coordinate = CLLocationCoordinate2DMake(43.0758, -87.88628);
    _title = @"Cramer";
    _subtitle = @"Milwaukee";
    return [self initWithCoordinate:(_coordinate) street:(_title) city:(_subtitle)];
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate street:(NSString*)street city:(NSString*)city{
    self = [super init];
    if(self){
        _coordinate = coordinate;
        _title = street;
        _subtitle = city;
    }
    return self;
}

@end
