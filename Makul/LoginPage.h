//
//  LoginPage.h
//  Makul
//
//  Created by Evan on 3/25/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginPage : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet UILabel *lblPassword;

-(IBAction)btnLogin:(id)sender;
//-(IBAction)btnRegister:(id)sender;
-(IBAction)dismiss:(id)sender;

@end
