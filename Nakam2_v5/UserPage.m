//
//  UserPage.m
//  Nakam2_v
//
//  Created by Evan on 5/22/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "UserPage.h"
#import "IIViewDeckController.h"

@interface UserPage ()

@end

@implementation UserPage

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"option" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
