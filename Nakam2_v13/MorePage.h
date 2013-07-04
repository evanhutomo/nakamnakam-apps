//
//  MorePage.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapseClick.h"

@interface MorePage : UIViewController <CollapseClickDelegate,UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UITextViewDelegate>{
    IBOutlet CollapseClick *myColapseClick;
    IBOutlet UIView *pricerangeView;
    IBOutlet UIView *kategoriView;
}
- (IBAction)dismiss:(id)sender;

- (IBAction)btn_sent:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt_support;
@property (weak, nonatomic) IBOutlet UITextField *txt_conf;

//kategori button
- (IBAction)CAT_1:(id)sender;
- (IBAction)CAT_2:(id)sender;
- (IBAction)CAT_3:(id)sender;
- (IBAction)CAT_4:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *indoFood;
@property (weak, nonatomic) IBOutlet UIButton *ChineseFood;
@property (weak, nonatomic) IBOutlet UIButton *westernFood;
@property (weak, nonatomic) IBOutlet UIButton *japaneseFood;

//price range button
- (IBAction)PR_1:(id)sender;
- (IBAction)PR_2:(id)sender;
- (IBAction)PR_3:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *limaribu;
@property (weak, nonatomic) IBOutlet UIButton *enamblasribu;
@property (weak, nonatomic) IBOutlet UIButton *duaenamribu;


@end
