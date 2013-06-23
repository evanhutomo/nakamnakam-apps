//
//  WebViewPage.m
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "WebViewPage.h"

@interface WebViewPage ()

@end

@implementation WebViewPage
@synthesize webview_about, set_web;

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

    //Create a URL object.
    NSLog(@"%@", self.set_web);
	NSURL *url = [NSURL URLWithString:self.set_web];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[webview_about loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
