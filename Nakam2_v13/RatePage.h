//
//  RatePage.h
//  Nakam2_v
//
//  Created by Evan on 6/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface RatePage : UIViewController
@property (strong, nonatomic) NSString *idresto;
@property (strong, nonatomic) NSString *namaresto;


@property (strong, nonatomic) IBOutlet UISegmentedControl *btnsegmen_Outlet;
@property (strong, nonatomic) IBOutlet UIButton *btnsenrateOutlet;
@property (strong, nonatomic) IBOutlet UILabel *lbl_namaresto;

- (IBAction)btnsegment_rate:(UISegmentedControl *)sender;
- (IBAction)btn_sentRate:(id)sender;

@end
