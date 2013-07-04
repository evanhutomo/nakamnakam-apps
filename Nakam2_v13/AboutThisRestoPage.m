//
//  AboutThisRestoPage.m
//  Nakam2_v
//
//  Created by Evan on 6/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "AboutThisRestoPage.h"
#import "SIAlertView.h"
@interface AboutThisRestoPage ()

@end

@implementation AboutThisRestoPage
//label
@synthesize lbl_alamat, lbl_avg_rating, lbl_kategorimakanan, lbl_namaresto, lbl_notelp, lbl_openhour, lbl_pricerange, txtview_desc;
//nsstring
@synthesize namaresto, alamatresto, telpresto, kategorimasakanresto, rentanghargaresto, openhourresto, avgratingresto, deskripsiresto;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"About Resto";
    
    if([namaresto isEqualToString:@""]){
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Koneksi Internet" andMessage:@"Mohon maaf, data tidak muncul karena terdapat gangguan koneksi internet pada Handphone anda"];
        [alert addButtonWithTitle:@"Ok"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
        [alert show];
    
    }
    [lbl_namaresto setText:namaresto];
    [lbl_alamat setText:alamatresto];
    [lbl_notelp setText:telpresto];
    [lbl_kategorimakanan setText:kategorimasakanresto];
    [lbl_pricerange setText:rentanghargaresto];
    [lbl_openhour setText:openhourresto];
    [lbl_avg_rating setText:avgratingresto];
    txtview_desc.text = [NSString stringWithFormat:@"%@",deskripsiresto];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
