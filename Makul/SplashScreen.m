//
//  SplashScreen.m
//  Makul
//
//  Created by Evan on 3/25/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "SplashScreen.h"

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
    [super viewDidLoad];
    [self performSelector:@selector(goToLoginPage) withObject:self afterDelay:0.5];
}

-(void)goToLoginPage{
    NSArray *te = [[NSBundle mainBundle] loadNibNamed:@"LoginPageViewController" owner:self options:nil];
    UINavigationController *nav = (UINavigationController *)[te objectAtIndex:0];
    [nav setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentModalViewController:nav animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
