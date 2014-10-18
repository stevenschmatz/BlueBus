//
//  Stop.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "Mantle.h"

@interface Stop : MTLModel <MTLJSONSerializing>

/**
 Returns the stop's ID
 */
@property (nonatomic, copy, readonly) NSString *id;

/**
 Returns the stop's unique name
 */
@property (nonatomic, copy, readonly) NSString *uniqueName;

/**
 Returns the stop's human name
 */
@property (nonatomic, copy, readonly) NSString *humanName;

/**
 Returns the stop's additional name, if it has one
 */
@property (nonatomic, copy, readonly) NSString *additionalName;

/**
 Returns the latitude that the stop resides on
 */
@property (nonatomic, readonly) CLLocationDegrees latitude;

/**
 Returns the longitude that the stop resides on
 */
@property (nonatomic, readonly) CLLocationDegrees longitude;

/**
 Returns the heading that the stop is directing towards
 */
@property (nonatomic, copy, readonly) NSString *heading;

/**
 Returns a CLLocationCoordinate2D containing the stop's latitude and longitude.
 */
- (CLLocationCoordinate2D)coordinate;

@end
