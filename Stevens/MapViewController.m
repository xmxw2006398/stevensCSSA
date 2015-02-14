//
//  MapViewController.m
//  Stevens
//
//  Created by weixiao on 2/11/15.
//  Copyright (c) 2015 wxiao. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView.mapType = MKMapTypeStandard;
    _mapView.delegate = self;
    _locationLabel.text = @"Stevens institute of Technology,Hoboken";
    [self search:_locationLabel.text];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeMapType:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard) {
        _mapView.mapType = MKMapTypeSatellite;
    }else if (_mapView.mapType == MKMapTypeSatellite){
        _mapView.mapType = MKMapTypeHybrid;
    }else{
        _mapView.mapType = MKMapTypeStandard;
    }
}

- (IBAction)search:(id)sender {
    if (_locationLabel.text == nil || [_locationLabel.text length] == 0) {
        return;
    }
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:_locationLabel.text completionHandler:^(NSArray *placemarks, NSError *error){
        if ([placemarks count] > 0) {
            [_mapView removeAnnotations:_mapView.annotations];
        }
        for (int i = 0; i < [placemarks count]; i++) {
            CLPlacemark *placemark = placemarks[i];
            [_locationLabel resignFirstResponder];
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate, 10000, 10000);
            [_mapView setRegion:viewRegion animated:YES];
            mapLocation *annotation = [[mapLocation alloc] init];
            annotation.streetAddress = placemark.thoroughfare;
            annotation.city = placemark.locality;
            annotation.state = placemark.administrativeArea;
            annotation.zip = placemark.postalCode;
            annotation.coordinate = placemark.location.coordinate;
            [_mapView addAnnotation:annotation];
        }
    }];
    /*[geocoder geocodeAddressString:_locationLabel.text completionHandler:^(NSArray *placemarks, NSError *error) {
        
        //NSLog(@"查询记录数：%i",[placemarks count]);
        
        if ([placemarks count] > 0) {
            [_mapView removeAnnotations:_mapView.annotations];
        }
        
        for (int i = 0; i < [placemarks count]; i++) {
            
            CLPlacemark* placemark = placemarks[i];
            
            //关闭键盘
            [_locationLabel resignFirstResponder];
            
            //调整地图位置和缩放比例
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate, 10000, 10000);
            [_mapView setRegion:viewRegion animated:YES];
            
            mapLocation *annotation = [[mapLocation alloc] init];
            annotation.streetAddress = placemark.thoroughfare;
            annotation.city = placemark.locality;
            annotation.state = placemark.administrativeArea;
            annotation.zip = placemark.postalCode;
            annotation.coordinate = placemark.location.coordinate;
            
            [_mapView addAnnotation:annotation];
        }
    }];*/
    
}

-(MKAnnotationView *) mapView:(MKMapView *)theMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:@"PIN_ANNOTATION"];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"PIN_ANNOTATION"];
    }
    annotationView.pinColor = MKPinAnnotationColorRed;
    annotationView.animatesDrop = YES;
    annotationView.canShowCallout = YES;
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate = userLocation.location.coordinate;
}

-(void)mapViewDidFailLoadingMap:(MKMapView *)theMapView withError:(NSError *)error{
    NSLog(@"error : %@",[error description]);
}
@end
