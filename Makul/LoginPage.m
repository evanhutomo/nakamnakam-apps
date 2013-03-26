//
//  LoginPage.m
//  Makul
//
//  Created by Evan on 3/25/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "LoginPage.h"

@interface LoginPage ()

@end

@implementation LoginPage
@synthesize txtPassword, txtUsername, lblPassword, lblUsername;

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
    [[self navigationController] setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)btnLogin:(id)sender{
//    NSString *u = @"evan";
//    NSString *p = @"evan";
    
//    NSString *lblpass = [[NSString alloc] initWithFormat:@"%@", [txtPassword text]];
//    NSString *lbluser = [[NSString alloc] initWithFormat:@"%@", [txtUsername text]];
  //  NSLog(@"%@, %@", lblpass, lbluser);
    
 //   [lblUsername setText:lbluser];
   
    
//    NSString *aa = (NSString *)lblUsername.text;
//    NSString *bb = (NSString *)lblPassword.text;
    //NSLog(@"aa: %@, bb: %@, u: %@, p: %@", aa, bb, u, p);
        [self performSelector:@selector(goToTabController) withObject:self afterDelay:0.5];
}
-(void)goToTabController{
    NSArray *te = [[NSBundle mainBundle] loadNibNamed:@"TabControllerMakul" owner:self options:nil];
    UITabBarController *tabcon = (UITabBarController *)[te objectAtIndex:0];
    [tabcon setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:tabcon animated:YES];
}

- (IBAction)dismiss:(id)sender {
    [txtUsername resignFirstResponder];
    [txtPassword resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [txtPassword resignFirstResponder];
    [txtUsername resignFirstResponder];
    return YES;
}

@end
