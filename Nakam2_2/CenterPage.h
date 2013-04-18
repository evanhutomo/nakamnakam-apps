//
//  CenterPage.h
//  Nakam2
//
//  Created by Evan on 4/16/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@class LeftPage;

@interface CenterPage : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, IIViewDeckControllerDelegate>

@property (nonatomic, strong) LeftPage *leftpage;
@end
