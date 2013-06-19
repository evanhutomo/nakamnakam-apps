//
//  RightPageProfile.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RightPageProfile.h"
#import "RegisterForm.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "NakamDataStatis.h"
#import "SIAlertView.h"
#import "SVProgressHUD.h"

@interface RightPageProfile () <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *tampungdatauser;

@end

@implementation RightPageProfile
@synthesize txtPassword, txtUsername, tampungdatauser, btn_signIn, btn_signUp, btn_logOut, welcome_user, bon_image;

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
    self.btn_logOut.hidden = YES;
    self.bon_image.hidden = YES;
    self.welcome_user.hidden = YES;
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - KEYBOARD HIDE
- (IBAction)dismiss:(id)sender {
    [txtUsername resignFirstResponder];
    [txtPassword resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - BUTTON   
- (IBAction)btnSignin:(id)sender {
    NSString *uname = self.txtUsername.text;
    NSString *pass = self.txtPassword.text;
    NSString *alertgagal = [NSString stringWithFormat:@"Tidak ada Koneksi internet"];
    NSString *alertkosong = [NSString stringWithFormat:@"Isi username password anda"];
    NSString *alertsalahpass = [NSString stringWithFormat:@"username / password anda salah"];
    
    if (![uname isEqualToString:@""] && ![pass isEqualToString:@""]) {
        //------------------------------------------------------------------------
            [SVProgressHUD showWithStatus:@"Tunggu :)"];
        AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
        [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
        [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
        NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                                path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/login.php?username=%@&password=%@", uname, pass]
                                                          parameters:nil];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSError *error;
//             NSLog(@"responnya adalah: %@", responseObject);
             NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
            
             NSString *id_pembanding = [dict objectForKey:@"id"];
             if ([id_pembanding isEqualToString:@"err"]) {
                 SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Ups!" andMessage:alertsalahpass];
                 [alert addButtonWithTitle:@"Ok"
                                      type:SIAlertViewButtonTypeCancel
                                   handler:nil];
                 alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
                 alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
                 [alert show];                
                 self.txtPassword.text = @"";
                 self.txtUsername.text = @"";
             }else{
                 tampungdatauser = [NSMutableArray array];
                 
                 NSString *hasilid = [dict objectForKey:@"id"];
                 NSString *hasilnama = [dict objectForKey:@"name"];
                 NSString *hasilusername = [dict objectForKey:@"username"];
                 NSString *hasilbirthday = [dict objectForKey:@"birthday"];
                 NSString *hasilgender = [dict objectForKey:@"gender"];
                 NSString *hasilpoint = [dict objectForKey:@"point"];
                 NSString *hasilsession = [dict objectForKey:@"session"];
                 
                 NSString *hasilkategori = [dict objectForKey:@"category_id"];
                 NSString *hasilpr = [dict objectForKey:@"price_id"];
                 NSString *username = [[NSString alloc] initWithFormat:@"Hai %@ !", hasilnama];
                 
                 [tampungdatauser addObject:hasilid];
                 [tampungdatauser addObject:hasilnama];
                 [tampungdatauser addObject:hasilusername];
                 [tampungdatauser addObject:hasilbirthday];
                 [tampungdatauser addObject:hasilgender];
                 [tampungdatauser addObject:hasilpoint];
                 [tampungdatauser addObject:hasilsession];
                 [tampungdatauser addObject:hasilkategori];
                 [tampungdatauser addObject:hasilpr];
                 
                 NSLog(@"%@", tampungdatauser);
                 
                 NakamDataStatis *nakamdata = [NakamDataStatis factory];
                 nakamdata.iduser = hasilid;
                 nakamdata.namauser = hasilnama;
                 nakamdata.usernamebuatlogin = hasilusername;
                 nakamdata.birth = hasilbirthday;
                 nakamdata.pointuser = hasilpoint;
                 nakamdata.genderuser = hasilgender;
                 nakamdata.kategoriuser = hasilkategori;
                 nakamdata.pruser = hasilpr;

                 self.btn_signIn.hidden = YES;
                 self.btn_signUp.hidden = YES;
                 self.txtUsername.hidden = YES;
                 self.txtPassword.hidden = YES;
                 self.btn_logOut.hidden = NO;
                 self.bon_image.hidden = NO;
                 self.welcome_user.hidden = NO;
                 self.welcome_user.text = username;
 
             }
                      [SVProgressHUD dismiss];
                      } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Tidak Konek" andMessage:alertgagal];
             [alert addButtonWithTitle:@"Ok"
                                  type:SIAlertViewButtonTypeCancel
                               handler:nil];
             alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
             alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
             [alert show];
             NSLog(@"Error: %@", error);
         }];
        [operation start];
        [self dismissViewControllerAnimated:YES completion:nil];
        //------------------------------------------------------------------------
    }else{
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Kosong" andMessage:alertkosong];
        [alert addButtonWithTitle:@"Ok"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
        [alert show];
        }
}

- (IBAction)btnSignup:(id)sender {
    NSLog(@"testmodal");
    RegisterForm *registerform = [[RegisterForm alloc] initWithNibName:@"RegisterForm" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:registerform];

    [self presentViewController:navi animated:YES completion:nil];
}

- (IBAction)btnSignout:(id)sender {
    NakamDataStatis *hapusdata = [NakamDataStatis factory];
    hapusdata.namauser = nil;
    hapusdata.pointuser = nil;
    hapusdata.genderuser = nil;
    hapusdata.birth = nil;
    hapusdata.kategoriuser = nil;
    hapusdata.pruser = nil;
    hapusdata.iduser = nil;
    
    self.btn_signIn.hidden = NO;
    self.btn_signUp.hidden = NO;
    self.txtUsername.hidden = NO;
    self.txtPassword.hidden = NO;
    self.btn_logOut.hidden = YES;
    self.bon_image.hidden = YES;
    self.welcome_user.hidden = YES;
    self.txtUsername.text = @"";
    self.txtPassword.text = @"";
    
}

#pragma mark - DLL
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
