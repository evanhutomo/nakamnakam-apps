//
//  FormRegister.h
//  Makul
//
//  Created by Evan on 3/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormRegister : UIViewController <UITextFieldDelegate, UINavigationBarDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtInputUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtInputPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtInputEmail;
- (IBAction)btnRegisterNow:(id)sender;
- (IBAction)dismiss:(id)sender;
@end
