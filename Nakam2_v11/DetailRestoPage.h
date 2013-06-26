//
//  DetailRestoPage.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterPage.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface DetailRestoPage : UIViewController

@property (strong, nonatomic) NSString *namaRestoString;
@property (strong, nonatomic) NSString *alamatRestoString;
@property (strong, nonatomic) NSString *ratingRestoString;
@property (strong, nonatomic) NSString *GambarString;
@property (strong, nonatomic) NSString *distRestoString;

//yang akan dipas ke webservice
@property (strong, nonatomic) NSNumber *lat_val;
@property (strong, nonatomic) NSNumber *long_val;
//radius diambil dari static factory

//yang buat nampung hasil json
@property (nonatomic,strong) NSMutableArray *restolong;
@property (nonatomic,strong) NSMutableArray *restolat;
@property (nonatomic,strong) NSMutableArray *avgrating;
@property (nonatomic,strong) NSMutableArray *restodistance;
@property (nonatomic,strong) NSMutableArray *userlong;
@property (nonatomic,strong) NSMutableArray *userlat;

@property (strong, nonatomic) IBOutlet UIImageView *resto_gambar;

@property (strong, nonatomic) IBOutlet UILabel *distresto;
@property (strong, nonatomic) IBOutlet UILabel *namaresto;
@property (strong, nonatomic) IBOutlet UILabel *ratingresto;
@property (strong, nonatomic) IBOutlet UILabel *alamatresto;
@property (strong, nonatomic) IBOutlet UIButton *btnRateOutlet;
@property (strong, nonatomic) IBOutlet UISegmentedControl *btnsegmentoutlet;

@property (nonatomic,strong) NSMutableArray *restoIdArray;
@property (nonatomic,strong) NSMutableArray *restoarray;
@property (nonatomic,strong) NSMutableArray *restojalan;

- (IBAction)btn_sent_rate:(id)sender;
- (IBAction)btn_goto_map:(id)sender;
- (IBAction)btn_rating:(UISegmentedControl *)sender;
- (IBAction)btn_promo:(id)sender;


@end
