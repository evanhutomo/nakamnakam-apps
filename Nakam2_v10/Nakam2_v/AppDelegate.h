//
//  AppDelegate.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CenterPage;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *centerPage;
@property (strong, nonatomic) UIViewController *leftPage;
@property (strong, nonatomic) UIViewController *rightpage;
@property (strong, nonatomic) UIViewController *toppage;

@end
