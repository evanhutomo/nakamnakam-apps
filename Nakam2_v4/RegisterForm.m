//
//  RegisterForm.m
//  Nakam2_v
//
//  Created by Evan on 4/21/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RegisterForm.h"

@interface RegisterForm ()

@end

@implementation RegisterForm

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleBordered target:self action:@selector(dismismodal)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(kirimRegisterForm)];
}

-(void)kirimRegisterForm{
    NSLog(@"kirim form");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dismismodal{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
