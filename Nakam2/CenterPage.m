//
//  CenterPage.m
//  Nakam2
//
//  Created by Evan on 4/16/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "CenterPage.h"
#import "IIViewDeckController.h"

@interface CenterPage ()

@end

@implementation CenterPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.viewDeckController){
        NSLog(@"ini viewdeck, di centerviewcontroller");
    }else{
        NSLog(@"ini bukan viewdeck");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
