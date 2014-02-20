//
//  ViewController.m
//  mapit
//
//  Created by Jake on 2/15/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) CLPlacemark* placemark;
@property(nonatomic, strong) CLLocation* currLocation;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.geocoder = [[CLGeocoder alloc]init];
	self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MKMapViewDelegate
-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
}

//CLLocationmanagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    if(_currLocation == nil){
        NSLog(@"Null locaton. setting.");
        _currLocation = [locations lastObject];
    }
    int maxDiff = 3;
    NSLog(@"comparison : %5f",[_currLocation distanceFromLocation:([locations lastObject])]);
    if([_currLocation distanceFromLocation:([locations lastObject])] > maxDiff){
        NSLog(@"currlocation is != location lastobject");
        _currLocation = [locations lastObject];
        [self reverseGeocodeLocation:_currLocation];
        [_addy setText:self.placemark.name];
    }else{
        NSLog(@"Not updating");
    }
}

-(IBAction)segmentSelected:(id)sender{
    NSInteger selected = [_segControl selectedSegmentIndex];
    if(selected == 0){
        self.mapView.mapType = MKMapTypeStandard;
    }
    if(selected == 1){
        self.mapView.mapType = MKMapTypeSatellite;
    }
    if(selected == 2){
        self.mapView.mapType = MKMapTypeHybrid;
    }
}

-(IBAction)markLocation:(id)sender{
    NSLog(@"mark it button");
    MapAnnotation* test = [[MapAnnotation alloc] initWithCoordinate:(_currLocation.coordinate) street:(_placemark.name) city:(_placemark.locality)];
    [_mapView addAnnotation:(test)];
}

-(void)reverseGeocodeLocation:(CLLocation*)location{
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        self.placemark = [placemarks objectAtIndex:0];
        NSLog(@"RGL: %@", self.placemark);
    }];
}

@end
