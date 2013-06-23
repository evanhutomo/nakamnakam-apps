//
//  ThanksToPage.m
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "ThanksToPage.h"
#import "WebViewPage.h"

@interface ThanksToPage ()

@end

@implementation ThanksToPage

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



- (IBAction)btn_afnetworking:(id)sender {
    WebViewPage *webviewpage = [[WebViewPage alloc] initWithNibName:@"WebViewPage" bundle:nil];
    webviewpage.set_web = @"https://github.com/AFNetworking/AFNetworking";
    [self.navigationController pushViewController:webviewpage animated:YES];
}

- (IBAction)btn_machung:(id)sender {
    WebViewPage *webviewpage = [[WebViewPage alloc] initWithNibName:@"WebViewPage" bundle:nil];
    webviewpage.set_web = @"www.machung.ac.id";
    [self.navigationController pushViewController:webviewpage animated:YES];
}

- (IBAction)btn_iiviewdeck:(id)sender {
    WebViewPage *webviewpage = [[WebViewPage alloc] initWithNibName:@"WebViewPage" bundle:nil];
    webviewpage.set_web = @"https://github.com/Inferis/ViewDeck";
    [self.navigationController pushViewController:webviewpage animated:YES];
}

- (IBAction)btn_svprogresshud:(id)sender {
    WebViewPage *webviewpage = [[WebViewPage alloc] initWithNibName:@"WebViewPage" bundle:nil];
    webviewpage.set_web = @"https://github.com/samvermette/SVProgressHUD";
    [self.navigationController pushViewController:webviewpage animated:YES];
}

- (IBAction)btn_collapseclick:(id)sender {
    WebViewPage *webviewpage = [[WebViewPage alloc] initWithNibName:@"WebViewPage" bundle:nil];
    webviewpage.set_web = @"https://www.cocoacontrols.com/controls/collapseclick";
    [self.navigationController pushViewController:webviewpage animated:YES];
}

- (IBAction)btn_sialertview:(id)sender {
    WebViewPage *webviewpage = [[WebViewPage alloc] initWithNibName:@"WebViewPage" bundle:nil];
    webviewpage.set_web = @"https://github.com/Sumi-Interactive/SIAlertView";
    [self.navigationController pushViewController:webviewpage animated:YES];
}
@end
