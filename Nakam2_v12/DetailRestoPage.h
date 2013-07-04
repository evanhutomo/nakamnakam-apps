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

@property (strong, nonatomic) NSString *namaRestoString;    //nama resto push2an dari URL CENTERPAGE
@property (strong, nonatomic) NSString *alamatRestoString;  //alamt push2an dari URL CENTERPAGE
@property (strong, nonatomic) NSString *ratingRestoString;  //id resto
@property (strong, nonatomic) NSString *GambarString;       //gambar push2an dari URL CENTERPAGE
@property (strong, nonatomic) NSString *deskripsirestoran;     

//yang buat nampung hasil json
@property (strong, nonatomic) IBOutlet UIImageView *resto_gambar;
@property (strong, nonatomic) IBOutlet UILabel *namaresto;
@property (strong, nonatomic) IBOutlet UILabel *ratingresto;
@property (strong, nonatomic) IBOutlet UILabel *alamatresto;
@property (strong, nonatomic) IBOutlet UITextView *description;

@property (nonatomic,strong) NSMutableArray *restoIdArray;
@property (nonatomic,strong) NSMutableArray *restoarray;
@property (nonatomic,strong) NSMutableArray *restojalan;
@property (nonatomic,strong) NSMutableArray *telp;
@property (nonatomic,strong) NSMutableArray *kategorimasakan;
@property (nonatomic,strong) NSMutableArray *rentangharga;
@property (nonatomic,strong) NSMutableArray *openhour;

@property (nonatomic,strong) NSMutableArray *avgrating;
@property (nonatomic,strong) NSMutableArray *desc_resto;


//SOON//
@property (nonatomic,strong) NSMutableArray *restolong;
@property (nonatomic,strong) NSMutableArray *restolat;
@property (nonatomic,strong) NSMutableArray *userlong;
@property (nonatomic,strong) NSMutableArray *userlat;
//yang akan dipas ke webservice
@property (strong, nonatomic) NSNumber *lat_val;
@property (strong, nonatomic) NSNumber *long_val;
//radius diambil dari static factory

- (IBAction)btn_sent_rate:(id)sender;
- (IBAction)btn_goto_map:(id)sender;
- (IBAction)btn_promo:(id)sender;
- (IBAction)btn_komentar:(id)sender;
- (IBAction)btn_aboutThisResto:(id)sender;

@end
