//
//  MapAnnotation.h
//  mapit
//
//  Created by jprather on 2/20/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate street:(NSString*)street city:(NSString*)city;

@end
