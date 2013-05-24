//
//  MorePage.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MorePage : UIViewController <UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UIPickerView *picker_resto;
- (IBAction)btn_sent:(id)sender;
- (IBAction)btn_rating:(UISegmentedControl *)sender;
- (IBAction)dismiss:(UITextField *)sender;

@end
