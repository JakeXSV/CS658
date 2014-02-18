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
@property(nonatomic, weak) IBOutlet UISegmentedControl* segControl;
@property(nonatomic, weak) IBOutlet UIButton* markIt;
@property(nonatomic, weak) IBOutlet UILabel* addy;
@property(nonatomic, strong) CLGeocoder* geocoder;

-(IBAction)segmentSelected:(id)sender;
-(IBAction)markLocation:(id)sender;

@end
