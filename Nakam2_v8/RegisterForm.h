//
//  RegisterForm.h
//  Nakam2_v
//
//  Created by Evan on 4/21/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterForm : UIViewController
- (IBAction)dismiss:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt_username;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UIButton *boy_button_state;
@property (weak, nonatomic) IBOutlet UIButton *girl_button_state;

- (IBAction)btn_boy:(id)sender;
- (IBAction)btn_girl:(id)sender;
- (IBAction)btn_cek:(id)sender;


@end
