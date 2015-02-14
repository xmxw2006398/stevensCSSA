//
//  mapLocation.h
//  Stevens
//
//  Created by weixiao on 2/11/15.
//  Copyright (c) 2015 wxiao. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface mapLocation : NSObject
<MKAnnotation>
//the street
@property (nonatomic, copy) NSString *streetAddress;
//the city
@property (nonatomic, copy) NSString *city;
//the state
@property (nonatomic, copy) NSString *state;
//the zip
@property (nonatomic, copy) NSString *zip;

@property(nonatomic,readwrite) CLLocationCoordinate2D coordinate;
@end
