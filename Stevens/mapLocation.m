
//  mapLocation.m
//  Stevens
//
//  Created by weixiao on 2/11/15.
//  Copyright (c) 2015 wxiao. All rights reserved.
//

#import "mapLocation.h"

@implementation mapLocation
-(NSString *)title
{
    return @"your location:";
}
-(NSString *)subtitle
{
    NSMutableString *detail = [NSMutableString new];
    if (_state) {
        [detail appendString:_state];
    }
    if (_city) {
        [detail appendString:_city];
    }
    if (_city && _state) {
        [detail appendString:@", "];
    }
    if (_streetAddress && (_city || _state || _zip)) {
        [detail appendString:@" • "];
    }
    if (_streetAddress) {
        [detail appendString:_streetAddress];
    }
    if (_zip) {
        [detail appendFormat:@", %@", _zip];
    }
    return  detail;
}
@end
