//
//  FormRegister.m
//  Makul
//
//  Created by Evan on 3/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "FormRegister.h"
#import "LoginPage.h"

@interface FormRegister ()

@end

@implementation FormRegister
@synthesize txtInputEmail, txtInputPassword, txtInputUsername;

LoginPage* login;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    login = [[LoginPage alloc] init];
    
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [txtInputUsername resignFirstResponder];
    [txtInputPassword resignFirstResponder];
    [txtInputEmail resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [txtInputEmail resignFirstResponder];
    [txtInputPassword resignFirstResponder];
    [txtInputUsername resignFirstResponder];
    return YES;
}

- (IBAction)btnRegisterNow:(id)sender {
    
    //[self dismissModalViewControllerAnimated:YES];
    NSArray *te = [[NSBundle mainBundle] loadNibNamed:@"TabControllerMakul" owner:self options:nil];
    UITabBarController *tabcon = (UITabBarController *)[te objectAtIndex:0];
    [tabcon setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:tabcon animated:YES];
}


@end
