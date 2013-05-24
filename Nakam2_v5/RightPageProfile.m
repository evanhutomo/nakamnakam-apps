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

@interface RightPageProfile () <UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *tampungdatauser;
@end

@implementation RightPageProfile
@synthesize txtPassword, txtUsername, tampungdatauser;

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
    NSString *alertsukses = [NSString stringWithFormat:@"Selamat datang %@", uname];
    NSString *alertgagal = [NSString stringWithFormat:@"Tidak ada Koneksi internet"];
    NSString *alertkosong = [NSString stringWithFormat:@"Isi username password anda"];
    if (![uname isEqualToString:@""] && ![pass isEqualToString:@""]) {
        //------------------------------------------------------------------------
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
             
             tampungdatauser = [NSMutableArray array];

             NSString *test = [dict objectForKey:@"name"];
             NSString *test1 = [dict objectForKey:@"birthday"];
             NSString *test2 = [dict objectForKey:@"gender"];
             NSString *test3 = [dict objectForKey:@"avatar"];
             NSString *test4 = [dict objectForKey:@"session"];
             
             [tampungdatauser addObject:test];
             [tampungdatauser addObject:test1];
             [tampungdatauser addObject:test2];
             [tampungdatauser addObject:test3];
             [tampungdatauser addObject:test4];
             
//             self.tampungdatauser[1] = @"";
//             self.tampungdatauser[2] = [dict objectForKey:@"password"];
//             self.tampungdatauser[3] = [dict objectForKey:@"email"];
//             self.tampungdatauser[4] = [dict objectForKey:@"birthday"];
//             self.tampungdatauser[5] = [dict objectForKey:@"gender"];
//             self.tampungdatauser[6] = [dict objectForKey:@"avatar"];
//             self.tampungdatauser[7] = [dict objectForKey:@"session"];
             
             NSLog(@"%@", tampungdatauser);
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Sukses"
                                                             message:alertsukses
                                                            delegate:self
                                                   cancelButtonTitle:@"Ok"
                                                   otherButtonTitles:nil];
             [alert show];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tidak Konek"
                                                             message:alertgagal
                                                            delegate:self
                                                   cancelButtonTitle:@"Ok"
                                                   otherButtonTitles:nil];
             [alert show];
             NSLog(@"Error: %@", error);
         }];
        [operation start];
        [self dismissViewControllerAnimated:YES completion:nil];
        //------------------------------------------------------------------------
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kosong"
                                                        message:alertkosong
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)btnSignup:(id)sender {
    NSLog(@"testmodal");
    RegisterForm *registerform = [[RegisterForm alloc] initWithNibName:@"RegisterForm" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:registerform];

    [self presentViewController:navi animated:YES completion:nil];
}

#pragma mark - DLL
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
