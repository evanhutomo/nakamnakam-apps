//
//  MapViewViewController.m
//  Nakam2_v
//
//  Created by Evan on 6/20/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "MapViewViewController.h"
#import "MyLocation.h"
#define METERS_PER_MILE 1609.344
@interface MapViewViewController ()

@end

@implementation MapViewViewController
@synthesize tampungNama, tampungAlamat, tampunglat, tampunglong, tampungID4, mapview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Peta";
    //[_mapView setShouldGroupAccessibilityChildren:YES];
    mapview.delegate = self;
    mapview.showsUserLocation = YES;
    for (id<MKAnnotation> annotation in mapview.annotations) {
        [mapview removeAnnotation:annotation];
    }
    
    
    NSNumber *latitude = tampunglat;
    NSNumber *longitude = tampunglong;
    NSString *namarestone = tampungNama;
    NSString *alamat = tampungAlamat;
    
    NSLog(@"%@",latitude);
    NSLog(@"%@",longitude);
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = latitude.doubleValue;
    coordinate.longitude = longitude.doubleValue;
    MyLocation *annotation = [[MyLocation alloc]initWithName:namarestone address:alamat coordinate:coordinate];
    [mapview addAnnotation:annotation];

MKMapRect zoomRect = MKMapRectNull;
for (id <MKAnnotation> annotation in mapview.annotations)
{
    //MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
    //MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
    //zoomRect = MKMapRectUnion(zoomRect, pointRect);
    
    
    MKMapPoint annotationPoint = MKMapPointForCoordinate(mapview.userLocation.coordinate);
    MKMapRect zoomRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
    MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
    zoomRect = MKMapRectUnion(zoomRect, pointRect);
}
[mapview setVisibleMapRect:zoomRect animated:YES];

}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[MyLocation class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapview dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"pin1.png"];//here we use a nice image instead of the default pins
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}



-(void)dismis{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    CLLocationCoordinate2D zoomLocation;
    //zoomLocation.latitude = -7.987176;
    //zoomLocation.longitude= 112.624605;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 5*METERS_PER_MILE, 5*METERS_PER_MILE);
    
    [mapview setRegion:viewRegion animated:YES];
    
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    MyLocation *location = (MyLocation*)view.annotation;
    
    NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
    [location.mapItem openInMapsWithLaunchOptions:launchOptions];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mapRegion;
    mapRegion.center = mapview.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    [mapview setRegion:mapRegion animated: YES];
}



@end
