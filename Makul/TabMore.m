//
//  TabMore.m
//  Makul
//
//  Created by Evan on 3/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "TabMore.h"
#import "FormRegister.h"
#import "LoginPage.h"
//#import <QuartzCore/QuartzCore.h>

@interface TabMore ()

@end

@implementation TabMore


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
//    CATransition *s = [[CATransition alloc]init ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSaveOption:(id)sender {
    UIAlertView *test = [[UIAlertView alloc] initWithTitle:@"Option"
                                                   message:@"Pengaturan sudah disimpan"
                                                  delegate:self
                                         cancelButtonTitle:@"Tutup"
                                         otherButtonTitles:nil];
    [test show];
}

- (IBAction)btnLogout:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
