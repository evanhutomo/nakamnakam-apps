//
//  CenterPage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "CenterPage.h"
#import "IIViewDeckController.h"
#import "LeftDeckTab.h"
#import "DetailRestoPage.h"
#import "KustomCell.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFImageRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "DetailRestoPage.h"
#import "NakamDataStatis.h"
#import "SVProgressHUD.h"


@interface CenterPage () <UITableViewDelegate, UITableViewDataSource,IIViewDeckControllerDelegate, UINavigationBarDelegate>
@property (strong, nonatomic) NSNumber *lat;
@property (strong, nonatomic) NSNumber *lng;

@end

@implementation CenterPage

@synthesize restoarray, restojalan, restogambar, tabelresto, restoIdArray;
@synthesize namaresto, restolat, restolong;
@synthesize lat, lng, locationManager, avgrating, restodistance;

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
    NakamDataStatis *n = [NakamDataStatis factory];
    NSNumber *r = [[NSNumber alloc] initWithDouble:0.5];
    n.rad = r;
    
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    startLocation = nil;
    
    //-----------------------------------------------------------------

    UIBarButtonItem *barButtonItemProxy = [UIBarButtonItem appearanceWhenContainedIn:
                                           [UINavigationBar class], [UINavigationController class], nil];
    
    NSDictionary *textAttributes = @{
                                     UITextAttributeFont : [UIFont boldSystemFontOfSize:15.0f],
                                     UITextAttributeTextColor : [UIColor orangeColor],
                                     };
    [barButtonItemProxy setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    //-----------------------------------------------------------------
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"profile" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];

    self.navigationItem.title = @"Home";
    
    UITableView *tableview = (id)[self.view viewWithTag:1];
    UINib *nib = [UINib nibWithNibName:@"KustomCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:@"Kustom"];
    
    //set ledge buat view kanan dan kiri
    self.viewDeckController.rightSize = MAX(33, 10);
    self.viewDeckController.leftSize = MAX(33, 10);
    //----------------------------------------------------------------- FETCHING
    [SVProgressHUD showWithStatus:@"Load resto :)"];
}

-(void)loadData{
    int rad = 1000;
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam.com/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    NSString *path = [NSString stringWithFormat:@"http://nakamnakam.com/evan/nearby.php?format=json&lat=%@&lng=%@&r=%d", self.lat, self.lng, rad];
    NSLog(@"%@", path);
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/nearby.php?format=json&lat=%@&lng=%@&r=%d", self.lat, self.lng,rad]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *error;
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         NSArray *array = [dictionary objectForKey:@"resto"];
         restolong = [NSMutableArray array];
         restolat = [NSMutableArray array];
         restoIdArray = [NSMutableArray array];
         restoarray = [NSMutableArray array];
         restojalan = [NSMutableArray array];
         restogambar = [NSMutableArray array];    //PERBAIKAN
         avgrating = [NSMutableArray array];
         restodistance = [NSMutableArray array];

         for (NSDictionary *av in array) {
             NSNumber *dist = [av objectForKey:@"distance"];
             [restodistance addObject:dist];
         }
         
         for (NSDictionary *av in array) {
             NSNumber *avgvalue = [av objectForKey:@"avg_rating"];
             [avgrating addObject:avgvalue];
         }
         
         for (NSDictionary *p in array) {
             NSNumber *longvalue = [p objectForKey:@"longitude"];
             [restolong addObject:longvalue];
         }
         
         for (NSDictionary *p in array) {
             NSNumber *latvalue = [p objectForKey:@"latitude"];
             [restolat addObject:latvalue];
         }
         
         for (NSDictionary *d in array) {
             NSString *restoname = [d objectForKey:@"restoname"];
             [restoarray addObject:restoname];
         }
         //         NSLog(@"%@", restoarray);
         
         for (NSDictionary *i in array) {
             NSString *restoid = [i objectForKey:@"resto_id"];
             [restoIdArray addObject:restoid];
         }
         //         NSLog(@"resto id array nya adalah : %@", restoIdArray);
         
         
         for (NSDictionary *s in array) {
             NSString *restoalamat = [s objectForKey:@"restoalamat"];
             [restojalan addObject:restoalamat];
         }
         
         for (NSDictionary *g in array) {
             NSString *restogambarr = [g objectForKey:@"image_url"];
             [restogambar addObject:restogambarr];
         }
         //NSDictionary *dictionary = [array objectAtIndex:1];
         //         NSLog(@"title : %@", [dictionary objectForKey:@"title"]);
         
         // Print the response body in text
         //       NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
         [[self tabelresto] reloadData];
         [SVProgressHUD dismiss];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    //    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    //[format numberFromString:<#(NSString *)#>]
    NSNumber *currentLatitude = [NSNumber numberWithFloat:newLocation.coordinate.latitude];
    NSNumber *currentLongitude = [NSNumber numberWithFloat:newLocation.coordinate.longitude];
    //[[NSNumber alloc] initWithFormat:@"%g", newLocation.coordinate.latitude];
    //    NSNumber *currentLongitude = [[NSNumber alloc] initWithFormat:@"%g", newLocation.coordinate.longitude];
    self.lat = currentLatitude;
    self.lng = currentLongitude;
    
    [self loadData];
    
    NSLog(@"lat: %@", currentLatitude);
    NSLog(@"long: %@", currentLongitude);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [restoarray count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView   
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Kustom";
    KustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        NSArray *topLevel = [[NSBundle mainBundle] loadNibNamed:@"KustomCell" owner:self options:nil];
        cell = [topLevel objectAtIndex:0];
    }
//    [cell setGambar:[UIImage imageNamed:[NSString stringWithFormat:@"makanan%d.jpg", indexPath.row + 1]]];//aku casting paksa ke UIImageView, karena parameter bukan UIImage
//    

    NSURL *imageurl = [NSURL URLWithString:[restogambar objectAtIndex:indexPath.row]];    //PERBAIKAN
    NSLog(@"restogambar : %@", imageurl);
    //KustomCell *k = [KustomCell alloc];
    [cell setNearbyres:[NSString stringWithFormat:@"%@", [restodistance objectAtIndex:indexPath.row]]];
    [[cell gambarResto] setImageWithURL:imageurl];    //PERBAIKAN
    [cell setNamares:[NSString stringWithFormat:@"%@", [restoarray objectAtIndex:indexPath.row]]];
    [cell setJalanres:[NSString stringWithFormat:@"%@", [restojalan objectAtIndex:indexPath.row]]];

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //UIColor *warnafont = [UIColor colorWithRed:(107/255.0) green:(62/255.0) blue:(35/255.0) alpha:1];
    NSLog(@"details from center %@", [restoarray objectAtIndex:indexPath.row]);
    
    DetailRestoPage *detailrestopage = [[DetailRestoPage alloc] initWithNibName:@"DetailRestoPage" bundle:nil];
    detailrestopage.namaRestoString = [restoarray objectAtIndex:indexPath.row]; //set properties di details dengan nama resto
    detailrestopage.alamatRestoString = [restojalan objectAtIndex:indexPath.row];
    detailrestopage.ratingRestoString = [restoIdArray objectAtIndex:indexPath.row];
    detailrestopage.GambarString = [restogambar objectAtIndex:indexPath.row];
    detailrestopage.long_val = [restolong objectAtIndex:indexPath.row];
    detailrestopage.lat_val = [restolat objectAtIndex:indexPath.row];


//    NSURL *imageurl = [NSURL URLWithString:[restogambar objectAtIndex:indexPath.row]];
//    [[detailrestopage resto_gambar] setImageWithURL:imageurl];
    [self.navigationController pushViewController:detailrestopage animated:YES];
}


@end
