#import "GlobalMap.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "MyLocation.h"
#import "SIAlertView.h"
#import "NakamDataStatis.h"

#define METERS_PER_MILE 1609.344

@interface GlobalMap ()

@end

@implementation GlobalMap
@synthesize lat,lng,locationManager,_mapView,tampungIdRSpeta,tampungNamaRSpeta;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"kembali" style:UIBarButtonItemStyleBordered target:self action:@selector(dismismodal)];
    
    NakamDataStatis *n = [NakamDataStatis factory];
    NSString *a = [[NSString alloc] initWithFormat:@"Radius %@ km", n.rad];
    self.title = a;
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
        
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    startLocation = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    
    NSNumber *currentLatitude = [NSNumber numberWithFloat:newLocation.coordinate.latitude];
    NSNumber *currentLongitude = [NSNumber numberWithFloat:newLocation.coordinate.longitude];
    self.lat = currentLatitude;
    self.lng = currentLongitude;
    
    [self loadlokasi];
}

-(void)loadlokasi{
    NakamDataStatis *n = [NakamDataStatis factory];
    [locationManager stopUpdatingLocation];    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam.com/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"x-www-form-urlencoded"];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/nearby.php?format=json&lat=%@&lng=%@&r=%@", self.lat, self.lng, n.rad]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *err;
         NSDictionary *diks = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&err];
         NSArray *arr = [diks objectForKey:@"resto"];
         for (NSDictionary *petaRS in arr) {
             NSNumber *latitude = [petaRS objectForKey:@"latitude"];
             NSNumber *longitude = [petaRS objectForKey:@"longitude"];
             NSString *detail = [petaRS objectForKey:@"restoname"];
             NSString *alamat = [petaRS objectForKey:@"restoalamat"];
             NSString *idRS = [petaRS objectForKey:@"resto_id"];
             [tampungIdRSpeta addObject:idRS];
             [tampungNamaRSpeta addObject:detail];
             
             NSLog(@"%@",latitude);
             NSLog(@"%@",longitude);
             
             
             CLLocationCoordinate2D coordinate;
             coordinate.latitude = latitude.doubleValue;
             coordinate.longitude = longitude.doubleValue;
             MyLocation *annotation = [[MyLocation alloc]initWithName:detail address:alamat coordinate:coordinate];
             [_mapView addAnnotation:annotation];
         }
         MKMapRect zoomRect = MKMapRectNull;
         for (id <MKAnnotation> annotation in _mapView.annotations)
         {
             MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
             MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
             zoomRect = MKMapRectUnion(zoomRect, pointRect);
         }
         [_mapView setVisibleMapRect:zoomRect animated:YES];

     }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[MyLocation class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
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

- (void)viewDidUnload {
    [self set_mapView:nil];
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    CLLocationCoordinate2D zoomLocation;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    [_mapView setRegion:viewRegion animated:YES];    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    MyLocation *location = (MyLocation*)view.annotation;
    NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
    [location.mapItem openInMapsWithLaunchOptions:launchOptions];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mapRegion;
    mapRegion.center = _mapView.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    [_mapView setUserTrackingMode:MKUserTrackingModeNone animated:NO];
    [_mapView setRegion:mapRegion animated: NO];
}

-(void)dismismodal{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
