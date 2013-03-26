//
//  LoginPage.m
//  Makul
//
//  Created by Evan on 3/25/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "LoginPage.h"
#import "FormRegister.h"
#import "TabControllerMakul.h"

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
        [self performSelector:@selector(goToTabController) withObject:self afterDelay:0.2];
}
-(void)goToTabController {
    NSArray *te = [[NSBundle mainBundle] loadNibNamed:@"TabControllerMakul" owner:self options:nil];
    UITabBarController *tabcon = (UITabBarController *)[te objectAtIndex:0];
    [tabcon setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:tabcon animated:YES];
}

- (IBAction)dismiss:(id)sender {
    [txtUsername resignFirstResponder];
    [txtPassword resignFirstResponder];
}

- (IBAction)btnRegister:(id)sender {
//    [self performSelector:@selector(goToFormRegister) withObject:self];
    FormRegister *aa = [[FormRegister alloc]init ];
    [self.navigationController pushViewController:aa animated:YES];
}

//-(void)goToFormRegister{
//    NSArray *de = [[NSBundle mainBundle] loadNibNamed:@"FormRegisterViewController" owner:self options:nil];
//    UIViewController *formview = (UIViewController *)[de objectAtIndex:0];
//    [formview setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
//    [self presentModalViewController:formview animated:YES];
//
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [txtPassword resignFirstResponder];
    [txtUsername resignFirstResponder];
    return YES;
}

@end
