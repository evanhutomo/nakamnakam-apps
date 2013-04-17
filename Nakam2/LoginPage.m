//
//  LoginPage.m
//  Nakam2
//
//  Created by Evan on 4/15/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "LoginPage.h"
#import "CenterPage.h"
#import "IIViewDeckController.h"
#import "LeftPage.h"
#import "DaftarPage.h"

@interface LoginPage ()

@end

@implementation LoginPage
@synthesize behavior = _behavior;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDaftar:(id)sender {
    DaftarPage *daftarkontrol = [[DaftarPage alloc] initWithNibName:@"DaftarPage" bundle:nil];
    [[self navigationController] pushViewController:daftarkontrol animated:YES];
}

- (IBAction)btnMasuk:(id)sender {
        if ([self viewDeckController]) {  //ngetes apa self itu tipene dah viewDeckController
            NSLog(@"ini viewdeckController");
        }else{
            NSLog(@"bukan viewdeckconroller");
        }

    
    CenterPage *centerPageView = [[CenterPage alloc] initWithNibName:@"CenterPage" bundle:nil];
    LeftPage *leftPageView = [[LeftPage alloc] initWithNibName:@"LeftPage" bundle:nil];
    IIViewDeckController *deckcontroller = [[IIViewDeckController alloc] initWithCenterViewController:centerPageView leftViewController:leftPageView];
    
    deckcontroller.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    deckcontroller.delegateMode = IIViewDeckDelegateAndSubControllers;
    
    [self presentViewController:deckcontroller animated:YES completion:nil];
}

@end
