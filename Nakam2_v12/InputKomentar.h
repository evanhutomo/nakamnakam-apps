//
//  InputKomentar.h
//  Nakam2_v
//
//  Created by Evan on 6/27/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputKomentar : UIViewController
@property (nonatomic,strong) NSString *id_user;
@property (nonatomic,strong) NSString *id_resto;
@property (strong, nonatomic) IBOutlet UITextView *textfield_komen;
- (IBAction)dismiss:(id)sender;

@end
