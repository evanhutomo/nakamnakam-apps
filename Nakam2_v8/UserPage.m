//
//  UserPage.m
//  Nakam2_v
//
//  Created by Evan on 5/22/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "UserPage.h"
#import "IIViewDeckController.h"
#import "NakamDataStatis.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface UserPage ()
@property (nonatomic, strong) NSMutableArray *tampungdatauser;
@end

@implementation UserPage
@synthesize lbl_nama, lbl_point, ava, lbl_kategori, lbl_pr, tampungdatauser;

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
    [lbl_nama setText:n.namauser];
    [lbl_point setText:n.pointuser];
    
    
    NSString *usernamee = n.usernamebuatlogin;
    NSString *iduser = n.iduser;

    //------------------------------------------------------------------------
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/ambildataOPTION.php?username=%@&id=%@", usernamee, iduser]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *error;
         NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         
         NSString *id_pembanding = [dict objectForKey:@"id"];
         if ([id_pembanding isEqualToString:@"option_masih_kosong"]) {
//             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Option kosong"
//                                                             message:@"option masih kosong, silahkan isi di halaman more"
//                                                            delegate:self
//                                                   cancelButtonTitle:@"Ok"
//                                                   otherButtonTitles:nil];
//             [alert show];
         }else{
             tampungdatauser = [NSMutableArray array];
             
             NSString *hasilpr = [dict objectForKey:@"price_id"];
             NSString *hasilpoint = [dict objectForKey:@"point"];
             NSString *hasilcategory = [dict objectForKey:@"category_id"];

             [tampungdatauser addObject:hasilpr];
             [tampungdatauser addObject:hasilpoint];
             [tampungdatauser addObject:hasilcategory];
             
             NakamDataStatis *nakamdata = [NakamDataStatis factory];
            
             nakamdata.pruser = hasilpr;
             nakamdata.pointuser = hasilpoint;
             nakamdata.kategoriuser = hasilcategory;
             if ([n.kategoriuser isEqualToString:@"CAT_1"]) {
                 [lbl_kategori setText:@"Indonesian Food"];
             }else if ([n.kategoriuser isEqualToString:@"CAT_2"]){
                 [lbl_kategori setText:@"Chinese Food"];
             }else if ([n.kategoriuser isEqualToString:@"CAT_3"]){
                 [lbl_kategori setText:@"Western Food"];
             }else if ([n.kategoriuser isEqualToString:@"CAT_4"]){
                 [lbl_kategori setText:@"Japanese Food"];
             }else{
                 [lbl_kategori setText:@""];
             }
             
             if ([n.pruser isEqualToString:@"PR1"]) {
                 [lbl_pr setText:@"Rp 5.000 - Rp 15.000"];
             }else if ([n.pruser isEqualToString:@"PR2"]){
                 [lbl_pr setText:@"Rp 16.000 - Rp 25.000"];
             }else if([n.pruser isEqualToString:@"PR3"]){
                 [lbl_pr setText:@"Rp 26.000 - Rp 50.000"];
             }else{
                 [lbl_pr setText:@""];
             }
             
             if ([n.genderuser isEqualToString:@"male"]) {
                 UIImage *gantigambar = [UIImage imageNamed:@"boy_icon.png"];
                 [self.ava setImage:gantigambar];
             }else if([n.genderuser isEqualToString:@"female"]){
                 UIImage *gantigambar = [UIImage imageNamed:@"girl_icon.png"];
                 [self.ava setImage:gantigambar];
             }else{
                 UIImage *gantigambar = [UIImage imageNamed:@"blank_ava.png"];
                 [self.ava setImage:gantigambar];
             }

         }
         NSLog(@"responnya adalah: %@", responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
    [self dismissViewControllerAnimated:YES completion:nil];
    //------------------------------------------------------------------------

    
   

//    [lbl_pr setText:n.pruser];
//    [lbl_kategori setText:n.kategoriuser];
    
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
