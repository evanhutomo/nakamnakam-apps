//
//  LeftPage.h
//  Nakam2
//
//  Created by Evan on 4/17/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface LeftPage : UIViewController <UITableViewDelegate, UITableViewDataSource, IIViewDeckControllerDelegate>

@property (nonatomic, strong) NSArray *dataTab;
@property (nonatomic, assign) NSInteger temp;

@end
