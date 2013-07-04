//
//  OpsiPage.h
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpsiPage : UIViewController
- (IBAction)dismiss:(id)sender;
- (IBAction)btn_simpan_opsi:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt_input_rad;
- (IBAction)btn_globalmap:(id)sender;
@end
