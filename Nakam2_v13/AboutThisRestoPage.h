//
//  AboutThisRestoPage.h
//  Nakam2_v
//
//  Created by Evan on 6/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutThisRestoPage : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lbl_namaresto;
@property (strong, nonatomic) IBOutlet UILabel *lbl_alamat;
@property (strong, nonatomic) IBOutlet UILabel *lbl_notelp;
@property (strong, nonatomic) IBOutlet UILabel *lbl_kategorimakanan;
@property (strong, nonatomic) IBOutlet UILabel *lbl_pricerange;
@property (strong, nonatomic) IBOutlet UILabel *lbl_openhour;
@property (strong, nonatomic) IBOutlet UILabel *lbl_avg_rating;
@property (strong, nonatomic) IBOutlet UITextView *txtview_desc;

@property (strong, nonatomic) NSString *namaresto;
@property (strong, nonatomic) NSString *alamatresto;
@property (strong, nonatomic) NSString *telpresto;
@property (strong, nonatomic) NSString *kategorimasakanresto;
@property (strong, nonatomic) NSString *rentanghargaresto;
@property (strong, nonatomic) NSString *openhourresto;
@property (strong, nonatomic) NSString *avgratingresto;
@property (strong, nonatomic) NSString *deskripsiresto;

@end
