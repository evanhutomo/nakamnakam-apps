//
//  MorePage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "MorePage.h"
#import "IIViewDeckController.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "NakamDataStatis.h"
#import "SIAlertView.h"
#import "SVProgressHUD.h"

@interface MorePage ()
@property (strong, nonatomic) NSString *sup;
@property (strong, nonatomic) NSString *conf;

@property (strong, nonatomic) NSString *kategoriTampung;
@property (strong, nonatomic) NSString *pricerangeTampung;
@end

@implementation MorePage
//@synthesize list_price_range, list_category, rating_tampung;
@synthesize kategoriTampung, pricerangeTampung, sup, conf;
@synthesize txt_conf, txt_support;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NakamDataStatis *stat = [NakamDataStatis factory];
    NSString *nama = stat.namauser;
    
    if ([nama isEqualToString:@"admin"]) {
        
        txt_conf.hidden = NO;
        txt_support.hidden = NO;
    }else{
        txt_conf.hidden = YES;
        txt_support.hidden = YES;
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    self.navigationItem.title = @"More";
    myColapseClick.CollapseClickDelegate = self;
    [myColapseClick reloadCollapseClick];
    
    //    [myColapseClick openCollapseClickCellAtIndex:0 animated:NO];
    //    [myColapseClick openCollapseClickCellAtIndex:1 animated:NO];
    //listing resto dummy
    //    self.list_price_range = @[@"5.000-15.000", @"16.000-25.000", @"26.000-50.000"];
    //    self.list_category = @[@"Indonesian Food", @"Chinese Food", @"Western Food", @"Japanese food"];
}

#pragma mark - COLLAPSE DELEGATE
-(int)numberOfCellsForCollapseClick {
    return 2;
}

-(NSString *)titleForCollapseClickAtIndex:(int)index {
    switch (index) {
        case 0:
            return @"Daftar Rentang harga";
            break;
        case 1:
            return @"Daftar Kategori";
            break;
        default:
            return @"--";
            break;
    }
}

-(UIView *)viewForCollapseClickContentViewAtIndex:(int)index {
    switch (index) {
        case 0:
            return pricerangeView;
            break;
        case 1:
            return kategoriView;
            break;
        default:
            return kategoriView;
            break;
    }
}
#pragma mark - KOMPO WARNA COLAPSE
-(UIColor *)colorForCollapseClickTitleViewAtIndex:(int)index {
    return [UIColor colorWithRed:207/255.0f green:117/255.0f blue:77/255.0f alpha:1.0];
}

-(UIColor *)colorForTitleLabelAtIndex:(int)index {
    return [UIColor whiteColor];
}

-(UIColor *)colorForTitleArrowAtIndex:(int)index {
    return [UIColor whiteColor];
}

-(void)didClickCollapseClickCellAtIndex:(int)index isNowOpen:(BOOL)open {
//    NSLog(@"%d and it's open:%@", index, (open ? @"YES" : @"NO"));
}

#pragma mark - DLL

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [txt_support resignFirstResponder];
    [txt_conf resignFirstResponder];
}

- (IBAction)btn_sent:(id)sender {
    NakamDataStatis *nakam = [NakamDataStatis factory];
    NSString *iduser = nakam.iduser;
    sup = txt_support.text;
    conf = txt_conf.text;

    //-----
    if ([iduser length] == 0) {
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Maaf" andMessage:@"Untuk memberi/mengubah opsi halaman rekomendasi, silahkan login terlebih dahulu"];
        [alert addButtonWithTitle:@"Ok"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
        [alert show];

    }else{
        if (self.kategoriTampung == nil || self.pricerangeTampung == nil) {
            SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Auch!" andMessage:@"Anda belum melengkapi pilihan kategori dan price range"];
            [alert addButtonWithTitle:@"Ok"
                                 type:SIAlertViewButtonTypeCancel
                              handler:nil];
            alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
            alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            [alert show];
            
        }else{
            //---dicek
            [SVProgressHUD showWithStatus:@"tunggu.."];
            AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
            [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
            [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
            NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                                    path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/cek_option.php?user_id=%@&price_id=%@&kategori_id=%@&sup=%@&conf=%@", iduser, self.pricerangeTampung, self.kategoriTampung, self.sup, self.conf]
                                                              parameters:nil];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 NSError *error;
                 NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                             options:kNilOptions
                                                                               error:&error];
                 NSString *id_pembanding = [dict objectForKey:@"user_id"];
                 if ([id_pembanding isEqualToString:@"update"]) {
                     SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Update" andMessage:@"Data berhasil di update"];
                     [alert addButtonWithTitle:@"Ok"
                                          type:SIAlertViewButtonTypeCancel
                                       handler:nil];
                     alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
                     alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
                     [alert show];
                 }else{
                     SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Insert" andMessage:@"Data berhasil di insert"];
                     [alert addButtonWithTitle:@"Ok"
                                          type:SIAlertViewButtonTypeCancel
                                       handler:nil];
                     alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
                     alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
                     [alert show];                     
                 }
                 NSLog(@"responnya adalah: %@", responseObject);
                 [SVProgressHUD dismiss];
             } failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 NSLog(@"Error: %@", error);
             }];
            [operation start];
        }
    }
    //-----
}

#pragma mark - BUTTON COLLAPSE
- (IBAction)CAT_1:(id)sender {
    self.kategoriTampung = @"CAT_1";
    NSLog(@"kategori: %@", self.kategoriTampung);
}

- (IBAction)CAT_2:(id)sender {
    self.kategoriTampung = @"CAT_2";
    NSLog(@"kategori: %@", self.kategoriTampung);
}

- (IBAction)CAT_3:(id)sender {
    self.kategoriTampung = @"CAT_3";
    NSLog(@"kategori: %@", self.kategoriTampung);
}

- (IBAction)CAT_4:(id)sender {
    self.kategoriTampung = @"CAT_4";
    NSLog(@"kategori: %@", self.kategoriTampung);
}
//----------------------------
- (IBAction)PR_1:(id)sender {
    self.pricerangeTampung = @"PR1";
    NSLog(@"pr: %@", self.pricerangeTampung);
}

- (IBAction)PR_2:(id)sender {
    self.pricerangeTampung = @"PR2";
    NSLog(@"pr: %@", self.pricerangeTampung);
}

- (IBAction)PR_3:(id)sender {
    self.pricerangeTampung = @"PR3";
    NSLog(@"pr: %@", self.pricerangeTampung);
}

#pragma mark - TEXTVIEW_SETTING


@end
