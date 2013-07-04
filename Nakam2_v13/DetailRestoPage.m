//
//  DetailRestoPage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "DetailRestoPage.h"
#import "IIViewDeckController.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "NakamDataStatis.h"
#import "UIImageView+AFNetworking.h"
#import "SIAlertView.h"
#import "MapViewViewController.h"
#import "SVProgressHUD.h"
#import "PromoPage.h"
#import "KomentarPage.h"
#import "RatePage.h"
#import "AboutThisRestoPage.h"

@interface DetailRestoPage ()
@property (strong, nonatomic) NSString *rating_tampung;
@end

@implementation DetailRestoPage
@synthesize namaRestoString, alamatRestoString, ratingRestoString, GambarString, resto_gambar, namaresto, ratingresto, alamatresto, desc_resto, description, deskripsirestoran, telp, kategorimasakan, rentangharga, openhour;
@synthesize long_val, lat_val;
@synthesize userlat, userlong;

//kopas dari CenterPage.h
@synthesize  restoIdArray, restoarray, restojalan, avgrating;

@synthesize restolong, restolat;

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
    [namaresto setText:namaRestoString];
    [alamatresto setText:alamatRestoString];
    [ratingresto setText:ratingRestoString];
    resto_gambar.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:GambarString ]]];
    NSLog(@"sampek di details: %@", self.deskripsirestoran);
//    [description setText:deskripsirestoran];
    
    //-----------------
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam.com/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
//    NSString *path = [NSString stringWithFormat:@"http://nakamnakam.com/evan/load_details_resto.php?format=json&rid=%@", self.ratingRestoString];
//    NSLog(@"%@", path);
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/load_details_resto.php?format=json&rid=%@", self.ratingRestoString]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *error;
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         NSArray *array = [dictionary objectForKey:@"resto"];
         restoIdArray = [NSMutableArray array];
         restoarray = [NSMutableArray array];
         restojalan = [NSMutableArray array];
         telp = [NSMutableArray array];
         kategorimasakan = [NSMutableArray array];
         rentangharga = [NSMutableArray array];
         openhour = [NSMutableArray array];
         avgrating = [NSMutableArray array];
         desc_resto = [NSMutableArray array];
         
         restolong = [NSMutableArray array];
         restolat = [NSMutableArray array];
         

         NSLog(@"%@", array);
//             NSNumber *dist = [av objectForKey:@"distance"];
//             [restodistance addObject:dist];
         
         for (NSDictionary *i in array) {
             NSString *restoid = [i objectForKey:@"resto_id"];
             [restoIdArray addObject:restoid];
         }
         
         for (NSDictionary *d in array) {
             NSString *restoname = [d objectForKey:@"restoname"];
             [restoarray addObject:restoname];
         }
         
         for (NSDictionary *s in array) {
             NSString *restoalamat = [s objectForKey:@"restoalamat"];
             [restojalan addObject:restoalamat];
         }
         
         for (NSDictionary *s in array) {
             NSString *telpon = [s objectForKey:@"restotelpon"];
             [telp addObject:telpon];
         }
         
         for (NSDictionary *s in array) {
             NSString *restokat = [s objectForKey:@"name"];
             [kategorimasakan addObject:restokat];
         }
         
         for (NSDictionary *s in array) {
             NSString *rentang = [s objectForKey:@"price"];
             [rentangharga addObject:rentang];
         }
         
         for (NSDictionary *s in array) {
             NSString *jambuka = [s objectForKey:@"openhour"];
             [openhour addObject:jambuka];
         }         
         
         for (NSDictionary *av in array) {
             NSNumber *avgvalue = [av objectForKey:@"avg_rating"];
             [avgrating addObject:avgvalue];
         }
         
         for (NSDictionary *berita in array) {
             NSString *aaa = [berita objectForKey:@"restodesc"];
             [desc_resto addObject:aaa];
         }
                  
         description.text = [NSString stringWithFormat:@"%@",[desc_resto objectAtIndex:0]];
//         CGRect frame;
//         frame = description.frame;
//         frame.size.height = [description contentSize].height;
//         description.frame = frame;
//         int contentheight = description.frame.size.height + description.frame.origin.y;
//         [self.scrollView addSubview:isi];
         
         for (NSDictionary *p in array) {
             NSNumber *longvalue = [p objectForKey:@"longitude"];
             [restolong addObject:longvalue];
         }
         
         for (NSDictionary *p in array) {
             NSNumber *latvalue = [p objectForKey:@"latitude"];
             [restolat addObject:latvalue];
         }
         
         
         //NSDictionary *dictionary = [array objectAtIndex:1];
         //         NSLog(@"title : %@", [dictionary objectForKey:@"title"]);
         
         // Print the response body in text
         //       NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);

         [SVProgressHUD dismiss];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
    //-----------------
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)btn_sent_rate:(id)sender {
    RatePage *ratepage = [[RatePage alloc] initWithNibName:@"RatePage" bundle:nil];
    ratepage.idresto = ratingRestoString;   //ratingRestoString aslie id_resto
    ratepage.namaresto = namaRestoString;
    [self.navigationController pushViewController:ratepage animated:YES];
}

- (IBAction)btn_goto_map:(id)sender {
//    NSString *idrestone = ratingRestoString;
    MapViewViewController *map = [[MapViewViewController alloc] initWithNibName:@"MapViewViewController" bundle:nil];
    map.tampungNama = namaRestoString;
    map.tampunglat = lat_val;
    map.tampunglong = long_val;
    map.tampungAlamat = alamatRestoString;
    [self.navigationController pushViewController:map animated:YES];
}

- (IBAction)btn_promo:(id)sender {
    PromoPage *promopage = [[PromoPage alloc] initWithNibName:@"PromoPage" bundle:nil];
    promopage.idresto = [restoIdArray objectAtIndex:0];
    [self.navigationController pushViewController:promopage animated:YES];
}

- (IBAction)btn_komentar:(id)sender {
    KomentarPage *komentarpage = [[KomentarPage alloc] initWithNibName:@"KomentarPage" bundle:nil];
    komentarpage.restoid = [restoIdArray objectAtIndex:0];
    [self.navigationController pushViewController:komentarpage animated:YES];
}

- (IBAction)btn_aboutThisResto:(id)sender {
    AboutThisRestoPage *aboutthisrestopage = [[AboutThisRestoPage alloc] initWithNibName:@"AboutThisRestoPage" bundle:nil];
    
    aboutthisrestopage.namaresto = [restoarray objectAtIndex:0];
    aboutthisrestopage.alamatresto = [restojalan objectAtIndex:0];
    aboutthisrestopage.telpresto = [telp objectAtIndex:0];
    aboutthisrestopage.kategorimasakanresto = [kategorimasakan objectAtIndex:0];
    aboutthisrestopage.rentanghargaresto = [rentangharga objectAtIndex:0];
    aboutthisrestopage.openhourresto = [openhour objectAtIndex:0];
    aboutthisrestopage.avgratingresto = [avgrating objectAtIndex:0];
    aboutthisrestopage.deskripsiresto = [desc_resto objectAtIndex:0];
    
    [self.navigationController pushViewController:aboutthisrestopage animated:YES];
}
@end
