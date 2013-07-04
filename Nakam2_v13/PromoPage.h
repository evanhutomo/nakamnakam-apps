//
//  PromoPage.h
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromoPage : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textfield_judulpromo;
@property (strong, nonatomic) IBOutlet UITextView *textfield_isipromo;
@property (strong, nonatomic) NSString *idresto;

@property (nonatomic,strong) NSMutableArray *titledescMutablearray;
@property (nonatomic,strong) NSMutableArray *isidescMutablearray;
@property (strong, nonatomic) NSString *titledesc;
@property (strong, nonatomic) NSString *isidesc;

//@property (strong, nonatomic) NSString *startdate;
//@property (strong, nonatomic) NSString *enddate;

@end
