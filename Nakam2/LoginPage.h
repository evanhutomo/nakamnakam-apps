//
//  LoginPage.h
//  Nakam2
//
//  Created by Evan on 4/15/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface LoginPage : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (nonatomic, assign) IIViewDeckNavigationControllerBehavior behavior;
- (IBAction)btnDaftar:(id)sender;
- (IBAction)btnMasuk:(id)sender;

@end
