//
//  PromoPage.m
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "PromoPage.h"
#import "IIViewDeckController.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "NakamDataStatis.h"
#import "UIImageView+AFNetworking.h"
#import "SIAlertView.h"
#import "SVProgressHUD.h"
#import "KomentarPage.h"

@interface PromoPage ()

@end

@implementation PromoPage
@synthesize titledesc, isidesc, idresto, titledescMutablearray, isidescMutablearray,textfield_judulpromo,textfield_isipromo;

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
    self.navigationItem.title = @"Promo";
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    NSString *path = [NSString stringWithFormat:@"http://nakamnakam.com/evan/promo.php?restoid=%@", self.idresto];
    NSLog(@"%@", path);
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/promo.php?restoid=%@", self.idresto]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *error;
         NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         
         NSString *id_pembanding = [dict objectForKey:@"promo_id"];
         if ([id_pembanding isEqualToString:@"err"]){
             textfield_judulpromo.text = [NSString stringWithFormat:@"oops, masih belum ada promo "];
             textfield_isipromo.text = [NSString stringWithFormat:@"Maaf yah :)"];
         }else{
             titledesc = [dict objectForKey:@"title"];
             isidesc = [dict objectForKey:@"descript"];
             
             NSLog(@"dict: %@ title: %@ isi: %@", dict, titledesc, isidesc);
             textfield_judulpromo.text = [NSString stringWithFormat:@"%@", titledesc];
             textfield_isipromo.text = [NSString stringWithFormat:@"%@", isidesc];
         }
         [SVProgressHUD dismiss];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
