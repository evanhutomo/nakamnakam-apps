//
//  MapRestoPage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "MapRestoPage.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "MyLocation.h"

#define METERS_PER_MILE 1609.344
@interface MapRestoPage ()
@property (nonatomic, strong) NSMutableArray *namarestonya;
@property (nonatomic, strong) NSMutableArray *lati;
@property (nonatomic, strong) NSMutableArray *longi;

@end

@implementation MapRestoPage
@synthesize tampunglat,tampungNama,tampunglong,mapview,tampungID4;
@synthesize namarestonya, lati, longi;

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
    [mapview setShouldGroupAccessibilityChildren:YES];
    for (id<MKAnnotation> annotation in mapview.annotations) {
        [mapview removeAnnotation:annotation];
    }
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam.com/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"x-www-form-urlencoded"];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/index.php?format=json"]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *err;
         NSDictionary *diks = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&err];
         NSArray *arr = [diks objectForKey:@"resto"];
         NSLog(@"%@", arr);
//         namarestonya = [NSMutableArray array];
//         lati = [NSMutableArray array];
//         longi = [NSMutableArray array];
//         
//         for (NSDictionary *z in arr) {
//             NSString *restoname = [z objectForKey:@"restoname"];
//             [namarestonya addObject:restoname];
//         }
//         
//         for (NSDictionary *a in arr) {
//             NSNumber *lat = [a objectForKey:@"latitude"];
//             [lati addObject:lat];
//         }
//
//         for (NSDictionary *b in arr) {
//             NSNumber *lon = [a objectForKey:@"longitude"];
//             [longi addObject:lon];
//         }
//         
         for (NSDictionary *petaRS in arr) {
             NSNumber *latitude = [petaRS objectForKey:@"latitude"];
             NSNumber *longitude = [petaRS objectForKey:@"longitude"];
             NSString *restoname = [petaRS objectForKey:@"restoname"];
             NSString *restoalamat = [petaRS objectForKey:@"restoalamat"];
             
//             NSLog(@"NAMA: %@ LAT : %@   LONG:%@",restoname, latitude, longitude);

             

             CLLocationCoordinate2D coordinate;
             coordinate.latitude = latitude.doubleValue;
             coordinate.longitude = longitude.doubleValue;
             MyLocation *annotation = [[MyLocation alloc]initWithName:restoname address:restoalamat coordinate:coordinate];
             [mapview addAnnotation:annotation];
             
         }
         
         //NSLog(@"responnya adalah: %@", responseObject);
         
     }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
        // Do any additional setup after loading the view from its nib.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[MyLocation class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapview dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"Green_Map_Pin.png"];//here we use a nice image instead of the default pins
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

