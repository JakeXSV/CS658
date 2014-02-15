//
//  ViewController.h
//  mapit
//
//  Created by Jake on 2/15/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property(nonatomic, strong) CLLocationManager* locationManager;

@end
