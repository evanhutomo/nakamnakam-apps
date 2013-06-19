//
//  MapViewViewController.h
//  Nakam2_v
//
//  Created by Evan on 6/20/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewViewController : UIViewController<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property (nonatomic, strong) NSMutableArray *annotations;
@property (nonatomic, strong) NSNumber *tampunglat;
@property (nonatomic, strong) NSNumber *tampunglong;
@property (nonatomic, strong) NSString *tampungNama;
@property (nonatomic, strong) NSString *tampungAlamat;
@property (nonatomic, strong) NSString *tampungID4;

@end
