//
//  RightPageProfile.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightPageProfile : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIButton *btn_signIn;
@property (strong, nonatomic) IBOutlet UIButton *btn_signUp;
@property (strong, nonatomic) IBOutlet UIButton *btn_logOut;
@property (strong, nonatomic) IBOutlet UIImageView *bon_image;
@property (strong, nonatomic) IBOutlet UILabel *welcome_user;

- (IBAction)btnSignin:(id)sender;
- (IBAction)btnSignup:(id)sender;
- (IBAction)btnSignout:(id)sender;

-(void)keyboardWillShow;
-(void)keyboardWillHide;

@end
