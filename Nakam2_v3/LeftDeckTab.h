//
//  LeftDeckTab.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface LeftDeckTab : UIViewController <UITableViewDataSource, UITableViewDelegate, IIViewDeckControllerDelegate>

@property (nonatomic, strong) NSArray *dataOption;
@property (nonatomic, assign) NSInteger temp;
@end
