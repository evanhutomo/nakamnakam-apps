//
//  RegisterForm.m
//  Nakam2_v
//
//  Created by Evan on 4/21/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RegisterForm.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface RegisterForm ()
@property (nonatomic,strong) NSString *tampung;
@end

@implementation RegisterForm
@synthesize txt_email, txt_password, txt_username, txt_name, tampung;
@synthesize boy_button_state, girl_button_state;

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"kembali" style:UIBarButtonItemStyleBordered target:self action:@selector(dismismodal)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"kirim" style:UIBarButtonItemStyleDone target:self action:@selector(kirimRegisterForm)];
}
#pragma mark - SENT METHOD
-(void)kirimRegisterForm{
    NSString *namanya = self.txt_name.text;
    NSString *emailnya = self.txt_email.text;
    NSString *usernamenya = self.txt_username.text;
    NSString *passwordnya = self.txt_password.text;
    NSString *gendernya = self.tampung;
    NSLog(@"%@ %@ %@ %@ %@", namanya, emailnya, usernamenya, passwordnya, gendernya);
    if (![namanya isEqualToString:@""] && ![emailnya isEqualToString:@""] && ![usernamenya isEqualToString:@""] && ![passwordnya isEqualToString:@""] &&![gendernya isEqualToString:@""]) {
        NSLog(@"kirim form");
        //------------------------------------------------------------------------
        AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
        [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
        [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
        
        NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                                path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/daftar.php?name=%@&username=%@&password=%@&email=%@&gender=%@", namanya, usernamenya, passwordnya, emailnya, gendernya]
                                                          parameters:nil];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSLog(@"responnya adalah: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"Error: %@", error);
         }];
        [operation start];
        [self dismissViewControllerAnimated:YES completion:nil];
        //------------------------------------------------------------------------
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ups!"
                                                        message:@"Sepertinya form masih belum terisi lengkap. dilengkapi dulu ya (^_ ^ ) "
                                                       delegate:self
                                              cancelButtonTitle:@"Oke"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
#pragma mark - BUTTON
-(void)dismismodal{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismiss:(id)sender {
    [txt_username resignFirstResponder];
    [txt_password resignFirstResponder];
    [txt_email resignFirstResponder];
    [txt_name resignFirstResponder];
}

- (IBAction)btn_boy:(id)sender {
    [boy_button_state setBackgroundImage:[UIImage imageNamed:@"btnDown_boy.png"] forState:UIControlStateNormal ];
    [girl_button_state setBackgroundImage:[UIImage imageNamed:@"btn_girl.png"] forState:UIControlStateNormal];
    self.tampung = @"male";
    NSLog(@"%@", self.tampung);
}

- (IBAction)btn_girl:(id)sender {
    [girl_button_state setBackgroundImage:[UIImage imageNamed:@"btnDown_girl.png"] forState:UIControlStateNormal];
    [boy_button_state setBackgroundImage:[UIImage imageNamed:@"btn_boy.png"] forState:UIControlStateNormal];
    self.tampung = @"female";
    NSLog(@"%@", self.tampung);
}

#pragma mark - DLL
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
