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
#import "SIAlertView.h"
#import "SVProgressHUD.h"


#include <CommonCrypto/CommonDigest.h>

#define kSalt @"adlfu3489tyh2jnkLIUGI&%EV(&0982cbgrykxjnk8855"
#define kOFFSET_FOR_KEYBOARD 80.0
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


@interface RegisterForm ()
{
    UIAlertView *loading;
    CGFloat animatedDistance;
}
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
//    NSLog(@"%@ %@ %@ %@ %@", namanya, emailnya, usernamenya, passwordnya, gendernya);
    if (![namanya isEqualToString:@""] && ![emailnya isEqualToString:@""] && ![usernamenya isEqualToString:@""] && ![passwordnya isEqualToString:@""] && ![gendernya isEqualToString:NULL]) {
        NSLog(@"kirim form");
        //---dicek
        NSString *cekstring = self.txt_username.text;
        [SVProgressHUD showWithStatus:@"pengecekan.."];
        AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
        [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
        [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
        
        NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                                path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/cek_username.php?usercek=%@", cekstring]
                                                          parameters:nil];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSError *error;
             NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                         options:kNilOptions
                                                                           error:&error];
             NSString *id_pembanding = [dict objectForKey:@"id"];
             if ([id_pembanding isEqualToString:@"ada_yang_sama"]) {
                 SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Username sudah dipakai" andMessage:@"Silahkan cari username yang lain."];
                 [alert addButtonWithTitle:@"Ok"
                                      type:SIAlertViewButtonTypeCancel
                                   handler:nil];
                 alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
                 alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
                 [alert show];

                 self.txt_username.text = @"";
                 txt_name.text = @"";
                 txt_email.text = @"";
                 txt_password.text = @"";
             }else{             
                 if (tampung == NULL) {
                     SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Ups!" andMessage:@"Sepertinya form masih belum terisi lengkap. dilengkapi dulu ya (^_ ^ ) "];
                     [alert addButtonWithTitle:@"Ok"
                                          type:SIAlertViewButtonTypeCancel
                                       handler:nil];
                     alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
                     alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
                     [alert show];
                     
                 }else{
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
                          NSLog(@"%@", self.tampung);
                          NSLog(@"responnya adalah: %@", responseObject);
                      } failure:^(AFHTTPRequestOperation *operation, NSError *error)
                      {
                          NSLog(@"Error: %@", error);
                      }];
                     [operation start];
                     [self dismissViewControllerAnimated:YES completion:nil];
                     //------------------------------------------------------------------------                
                 }
             }
             
             NSLog(@"responnya adalah: %@", responseObject);
             [SVProgressHUD dismiss];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"Error: %@", error);
         }];
        [operation start];
        //---dicek
        
    
    }else{
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Ups!" andMessage:@"Sepertinya form masih belum terisi lengkap. dilengkapi dulu ya (^_ ^ ) "];
        [alert addButtonWithTitle:@"Ok"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
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

- (IBAction)btn_cek:(id)sender {
    NSString *cekstring = self.txt_username.text;
    NSString *selamat = [[NSString alloc] initWithFormat:@"anda dapat menggunakan username %@", cekstring];
    [SVProgressHUD showWithStatus:@"pengecekan.."];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/cek_username.php?usercek=%@", cekstring]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *error;
         NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                     options:kNilOptions
                                                                       error:&error];
         NSString *id_pembanding = [dict objectForKey:@"id"];
         NSString *a = self.txt_username.text;
         if ([id_pembanding isEqualToString:@"ada_yang_sama"] || [a isEqualToString:@""]) {
             SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Ops!!" andMessage:@"Anda belum memasukkan username / username sudah ada yang memakai"];
             [alert addButtonWithTitle:@"Ok"
                                  type:SIAlertViewButtonTypeCancel
                               handler:nil];
             alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
             alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
             [alert show];
             
             self.txt_username.text = @"";
         }else{
             SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Selamat" andMessage:selamat];
             [alert addButtonWithTitle:@"Yeah"
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


-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:txt_password] && [sender isEqual:txt_email])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
    
}

-(void)hideKeyboard:(UITapGestureRecognizer *)sender{
    [txt_name resignFirstResponder];
    [txt_password resignFirstResponder];
    [txt_email resignFirstResponder];
    [txt_username resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
@end
