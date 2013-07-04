//
//  GlobalMap.h
//  Nakam2_v
//
//  Created by Evan on 7/4/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface GlobalMap : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate> {
    CLLocation *startLocation;
}
@property (weak, nonatomic) IBOutlet MKMapView *_mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSNumber *lat;
@property (strong, nonatomic) NSNumber *lng;
@property (strong,nonatomic) NSMutableArray *tampungIdRSpeta;
@property (strong,nonatomic) NSMutableArray *tampungNamaRSpeta;

@end
