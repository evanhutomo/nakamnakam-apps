//
//  HowToUseViewController.m
//  Nakam2
//
//  Created by Evan on 4/17/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "HowToUseViewController.h"
#import "CenterPage.h"
#import "IIViewDeckController.h"

@interface HowToUseViewController ()

@end

@implementation HowToUseViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OpenTab:(id)sender {
    CenterPage *center = [[CenterPage alloc] initWithNibName:@"CenterPage" bundle:nil];
    UIViewController *controller = nil;
    if(self.viewDeckController){
        controller = center;
    }else{
        NSLog(@"ga ada isine");
    }
    if (controller) {
        [self.navigationController pushViewController:controller animated:YES];
    }
}
@end
