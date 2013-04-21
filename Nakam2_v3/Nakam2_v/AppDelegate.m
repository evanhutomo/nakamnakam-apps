//
//  AppDelegate.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "CenterPage.h"
#import "LeftDeckTab.h"
#import "RightPageProfile.h"
#import "MapRestoPage.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize leftPage = _leftPage;
@synthesize rightpage = _rightpage;
@synthesize centerPage = _centerPage;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //custom navbar
    UIImage *navbar = [UIImage imageNamed:@"navbarKustom"];
    [[UINavigationBar appearance] setBackgroundImage:navbar forBarMetrics:UIBarMetricsDefault];
    //custom title navbar
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], UITextAttributeTextColor, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], UITextAttributeTextShadowColor, [NSValue valueWithUIOffset:UIOffsetMake(0, 1.5)],UITextAttributeTextShadowOffset, [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:24.0], UITextAttributeFont, nil]];
    
    //custom back normal button navbar
    UIImage *backbuttonImage = [[UIImage imageNamed:@"button_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,13,0,6)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backbuttonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *normalButton = [[UIImage imageNamed:@"button_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
    [[UIBarButtonItem appearance] setBackgroundImage:normalButton forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.leftPage = [[LeftDeckTab alloc] initWithNibName:@"LeftDeckTab" bundle:nil];
    
    
    RightPageProfile *rightdetails = [[RightPageProfile alloc] initWithNibName:@"RightPageProfile" bundle:nil];
    MapRestoPage *maprestopage = [[MapRestoPage alloc] initWithNibName:@"MapRestoPage" bundle:nil];
    
    CenterPage *centerkontrol = [[CenterPage alloc] initWithNibName:@"CenterPage" bundle:nil];
    self.centerPage = [[UINavigationController alloc] initWithRootViewController:centerkontrol];
    IIViewDeckController *deckkontrol = [[IIViewDeckController alloc] initWithCenterViewController:self.centerPage leftViewController:self.leftPage rightViewController:rightdetails topViewController:maprestopage bottomViewController:nil];
    deckkontrol.rightSize = 100;
    self.window.rootViewController = deckkontrol;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
