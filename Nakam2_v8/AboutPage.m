//
//  AboutPage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "AboutPage.h"
#import "IIViewDeckController.h"
#import "ThanksToPage.h"
#import "HowToUsePage.h"

@interface AboutPage ()

@end

@implementation AboutPage

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    self.navigationItem.title = @"About";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_thanksto:(id)sender {
    ThanksToPage *thankstopage = [[ThanksToPage alloc] initWithNibName:@"ThanksToPage" bundle:nil];
    [self.navigationController pushViewController:thankstopage animated:YES];
}

- (IBAction)btn_howtouse:(id)sender {
    HowToUsePage *howtousepage = [[HowToUsePage alloc] initWithNibName:@"HowToUsePage" bundle:nil];
    [self.navigationController pushViewController:howtousepage animated:YES];
}
@end
