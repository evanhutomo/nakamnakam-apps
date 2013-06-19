//
//  MapRestoPage.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapRestoPage : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property (nonatomic, strong) NSMutableArray *annotations;
@property (nonatomic, strong) NSMutableArray *tampunglat;
@property (nonatomic, strong) NSMutableArray *tampunglong;
@property (nonatomic, strong) NSMutableArray *tampungNama;
@property (nonatomic, strong) NSMutableArray *tampungAlamat;
@property (nonatomic, strong) NSMutableArray *tampungID4;

@end
