//
//  UserPage.h
//  Nakam2_v
//
//  Created by Evan on 5/22/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RightPageProfile;

@interface UserPage : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lbl_nama;
@property (strong, nonatomic) IBOutlet UILabel *lbl_birthday;
@property (strong, nonatomic) IBOutlet UILabel *lbl_point;
@property (weak, nonatomic) IBOutlet UIImageView *ava;
@property (strong, nonatomic) IBOutlet UILabel *lbl_kategori;
@property (strong, nonatomic) IBOutlet UILabel *lbl_pr;

@property (strong, nonatomic) RightPageProfile *rightPageProfile;

@end
