//
//  MyLocation.h
//  Formalman
//
//  Created by Job  on 6/6/13.
//  Copyright (c) 2013 Job Ongkowijoyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end
