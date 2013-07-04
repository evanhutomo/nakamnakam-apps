//
//  OpsiPage.m
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "OpsiPage.h"
#import "IIViewDeckController.h"
#import "LeftDeckTab.h"
#import "KustomCell.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFImageRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "NakamDataStatis.h"
#import "SVProgressHUD.h"
#import "NakamDataStatis.h"
#import "SIAlertView.h"
#import "GlobalMap.h"


@interface OpsiPage ()

@end

@implementation OpsiPage
@synthesize txt_input_rad;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [txt_input_rad resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)btn_simpan_opsi:(id)sender {
    NSString *data = self.txt_input_rad.text;
    if ([data isEqualToString:@""]) {        
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Woops!" andMessage:@"Isi dulu radius nearby"];
        [alert addButtonWithTitle:@"Okay"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
        [SVProgressHUD dismiss];
        [alert show];
    }else{
        NakamDataStatis *nakamdata = [NakamDataStatis factory];
        nakamdata.rad = (NSNumber *)self.txt_input_rad.text;
        NSString *y = [[NSString alloc] initWithFormat:@"Setting radius restoran terdekat : %@", (NSNumber *)self.txt_input_rad.text];
        [txt_input_rad resignFirstResponder];
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Setting" andMessage:y];
        [alert addButtonWithTitle:@"Sip!"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
        [SVProgressHUD dismiss];
        [alert show];
        [self.viewDeckController closeOpenView];                
    }

}
- (IBAction)btn_globalmap:(id)sender {
    GlobalMap *globalmap = [[GlobalMap alloc] initWithNibName:@"GlobalMap" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:globalmap];
    [self presentViewController:navi animated:YES completion:nil];

}
@end
