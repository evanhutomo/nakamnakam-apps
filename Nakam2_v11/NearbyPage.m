//
//  NearbyPage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "NearbyPage.h"
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

@interface NearbyPage () <UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate>
@property (strong, nonatomic) NSNumber *lat;
@property (strong, nonatomic) NSNumber *lng;
@property (strong, nonatomic) NSNumber *rad;
@end

@implementation NearbyPage
@synthesize restoarray, restojalan, restogambar, tabelresto, restoIdArray, restodistance;
@synthesize namaresto, restolat, restolong;
@synthesize tampungkategori, locationManager;
@synthesize lat, lng, rad;


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
    
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    startLocation = nil;
    
    //NSLog(@"TES: %@", tampungkategori);
    //-----------------------------------------------------------------
    UIBarButtonItem *barButtonItemProxy = [UIBarButtonItem appearanceWhenContainedIn:
                                           [UINavigationBar class], [UINavigationController class], nil];
    
    NSDictionary *textAttributes = @{
                                     UITextAttributeFont : [UIFont boldSystemFontOfSize:15.0f],
                                     UITextAttributeTextColor : [UIColor orangeColor],
                                     };
    [barButtonItemProxy setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    //-----------------------------------------------------------------
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"opsi" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    
    NSString *judulnavi = [[NSString alloc] initWithFormat:@"%@", tampungkategori];
    self.navigationItem.title = judulnavi;
    
    UITableView *tableview = (id)[self.view viewWithTag:1];
    UINib *nib = [UINib nibWithNibName:@"KustomCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:@"Kustom"];
    
    self.navigationItem.title = @"Nearby";
    
    //set ledge buat view kanan dan kiri
    self.viewDeckController.rightSize = MAX(33, 10);
    self.viewDeckController.leftSize = MAX(33, 10);
    //----------------------------------------------------------------- FETCHING
    [SVProgressHUD showWithStatus:@"Load resto :)"];    
}

-(void)loaddatalokasi{
    NakamDataStatis *n = [NakamDataStatis factory];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam.com/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
//    NSString *path = [NSString stringWithFormat:@"http://nakamnakam.com/evan/nearby.php?format=json&lat=%@&lng=%@&r=%@", self.lat, self.lng, n.rad];
//    NSLog(@"%@", path);
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/nearby.php?format=json&lat=%@&lng=%@&r=%@", self.lat, self.lng, n.rad]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //NSLog(@"lat:%@ lng:%@ rad:%@", self.lat, self.lng, n.rad);
         NSError *error;
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         NSArray *array = [dictionary objectForKey:@"resto"];
         
         restolong = [NSMutableArray array];
         restolat = [NSMutableArray array];
         restoIdArray = [NSMutableArray array];
         restoarray = [NSMutableArray array];
         restojalan = [NSMutableArray array];
         restogambar = [NSMutableArray array];    //PERBAIKAN
         restodistance = [NSMutableArray array];
         
         for (NSDictionary *n in array) {
             NSNumber *distvalue = [n objectForKey:@"distance"];
             [restodistance addObject:distvalue];
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

    NSNumber *currentLatitude = [NSNumber numberWithFloat:newLocation.coordinate.latitude];
    NSNumber *currentLongitude = [NSNumber numberWithFloat:newLocation.coordinate.longitude];
    self.lat = currentLatitude;
    self.lng = currentLongitude;
    
    [self loaddatalokasi];
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
    
    NSURL *imageurl = [NSURL URLWithString:[restogambar objectAtIndex:indexPath.row]];    //PERBAIKAN
    //NSLog(@"restogambar : %@", imageurl);
    
    [[cell gambarResto] setImageWithURL:imageurl];    //PERBAIKAN
    [cell setNamares:[NSString stringWithFormat:@"%@", [restoarray objectAtIndex:indexPath.row]]];
    [cell setJalanres:[NSString stringWithFormat:@"%@", [restojalan objectAtIndex:indexPath.row]]];
    [cell setNearbyres:[NSString stringWithFormat:@"%@", [restodistance objectAtIndex:indexPath.row]]];
//    NSLog(@"%@  ", restodistance);
    
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
    detailrestopage.distRestoString = [restodistance objectAtIndex:indexPath.row];
    
    //    NSURL *imageurl = [NSURL URLWithString:[restogambar objectAtIndex:indexPath.row]];
    //    [[detailrestopage resto_gambar] setImageWithURL:imageurl];
    [self.navigationController pushViewController:detailrestopage animated:YES];
}

@end
