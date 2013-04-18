//
//  SplashScreen.m
//  Nakam2
//
//  Created by Evan on 4/15/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "SplashScreen.h"
#import "LoginPage.h"
#import "IIViewDeckController.h"

@interface SplashScreen ()

@end

@implementation SplashScreen

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
    //set background nakam2 secara programatikal
    [super viewDidLoad];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SplashScreen"]];
    bgView.frame = self.view.bounds;
    [[self view] addSubview:bgView];
    
    //set delay dan efek dissolve menuju halaman login
    [self performSelector:@selector(keLoginPage) withObject:self afterDelay:0.5];
}

-(void)keLoginPage{
    NSArray *te = [[NSBundle mainBundle] loadNibNamed:@"LoginPageViewController" owner:self options:nil];
    UINavigationController *nav = (UINavigationController *)[te objectAtIndex:0];
    [nav setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:nav animated:YES completion:nil];
//    LoginPage *loginpage = [[LoginPage alloc] initWithNibName:@"LoginPage" bundle:nil];
//    loginpage.behavior = IIViewDeckNavigationControllerIntegrated;
//    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:loginpage] animated:YES completion:^{[self tesMasukLoginPage];}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
