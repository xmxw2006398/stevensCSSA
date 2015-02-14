//
//  MapViewController.h
//  Stevens
//
//  Created by weixiao on 2/11/15.
//  Copyright (c) 2015 wxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "mapLocation.h"
@interface MapViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *locationLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)changeMapType:(id)sender;
- (IBAction)search:(id)sender;
@end
