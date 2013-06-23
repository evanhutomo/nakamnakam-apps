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

@interface DetailRestoPage ()
@property (strong, nonatomic) NSString *rating_tampung;
@end

@implementation DetailRestoPage
@synthesize namaRestoString, alamatRestoString, ratingRestoString, GambarString, resto_gambar, namaresto, ratingresto, alamatresto, btnRateOutlet, btnsegmentoutlet;
@synthesize long_val, lat_val;

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
    [btnsegmentoutlet setSelectedSegmentIndex:-1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_sent_rate:(id)sender {
    NakamDataStatis *nakamdatastatis = [NakamDataStatis factory];
    NSString *userid = nakamdatastatis.iduser;
    NSString *restoid = ratingRestoString;
    NSString *kat = nakamdatastatis.kategoriuser;
    NSString *pr = nakamdatastatis.pruser;
    [SVProgressHUD showWithStatus:@"Kirim rate :)"];
    
    if ([userid length] == 0) {
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Tidak bisa rate" andMessage:@"Untuk memberi penilaian berupa rate, silahkan login terlebih dahulu"];
        [alert addButtonWithTitle:@"Ok"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
        [SVProgressHUD dismiss];
        [alert show];
    }else{
        if (self.rating_tampung == nil) {
            SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Pilih rating" andMessage:@"anda belum memberikan rating "];
            [alert addButtonWithTitle:@"Ok"
                                 type:SIAlertViewButtonTypeCancel
                              handler:nil];
            alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
            alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            [SVProgressHUD dismiss];
            [alert show];            
        }else{
            //---dicek
            AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
            [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
            [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
            NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                                    path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/cek_rating.php?usercek=%@&restocek=%@&kat=%@&pr=%@", userid, restoid, kat, pr]
                                                              parameters:nil];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 NSError *error;
                 NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                             options:kNilOptions
                                                                               error:&error];
                 NSString *id_pembanding = [dict objectForKey:@"user_id"];
                 if ([id_pembanding isEqualToString:@"belum_pernah_rating"]) {
                     //------------------------------------------------------------------------
                     AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
                     [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
                     [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
                     
                     NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                                             path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/rating.php?userid=%@&restoid=%@&valuerate=%@&kat=%@&pr=%@",userid, restoid, self.rating_tampung, kat, pr]
                                                                       parameters:nil];
                     NSLog(@"%@, %@, %@, %@, %@", userid, restoid, self.rating_tampung, kat, pr);
                     AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
                     
                     [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
                      {
                          SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Terima kasih" andMessage:@"Sudah memberikan penilaian terhadap resto ini"];
                          [alert addButtonWithTitle:@"Ok"
                                               type:SIAlertViewButtonTypeCancel
                                            handler:nil];
                          alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
                          alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
                          [alert show];
                          
                          self.btnRateOutlet.hidden = YES;
                          NSLog(@"responnya adalah: %@", responseObject);
                          [SVProgressHUD dismiss];
                      } failure:^(AFHTTPRequestOperation *operation, NSError *error)
                      {
                          NSLog(@"Error: %@", error);
                      }];
                     [operation start];
                     [self dismissViewControllerAnimated:YES completion:nil];
                     //------------------------------------------------------------------------
                     
                     
                 
                 }else
                 {
                     SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Sudah memberikan rating" andMessage:@"Maaf, pemberian rating cukup sekali"];
                     [alert addButtonWithTitle:@"Ok"
                                          type:SIAlertViewButtonTypeCancel
                                       handler:nil];
                     alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
                     alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
                     [alert show];
                                 [SVProgressHUD dismiss];
                 }
                 NSLog(@"responnya adalah: %@", responseObject);
             } failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 NSLog(@"Error: %@", error);
             }];
            [operation start];
        }
        }
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

- (IBAction)btn_rating:(UISegmentedControl *)sender {
    int pilih = sender.selectedSegmentIndex;
    switch (pilih) {
        {case 0:
            self.rating_tampung = @"1";
            NSLog(@"%@", self.rating_tampung);
            break;}
        {case 1:
            self.rating_tampung = @"2";
            NSLog(@"%@", self.rating_tampung);
            break;
        }
        {case 2:
            self.rating_tampung = @"3";
            NSLog(@"%@", self.rating_tampung);
            break;
        }
        {case 3:
            self.rating_tampung = @"4";
            NSLog(@"%@", self.rating_tampung);
            break;
        }
        {case 4:
            self.rating_tampung = @"5";
            NSLog(@"%@", self.rating_tampung);
            break;
        }
    }
}

- (IBAction)btn_promo:(id)sender {
    PromoPage *promopage = [[PromoPage alloc] initWithNibName:@"PromoPage" bundle:nil];
    [self.navigationController pushViewController:promopage animated:YES];
}
@end
