//
//  DaftarPage.h
//  Nakam2
//
//  Created by Evan on 4/16/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface DaftarPage : UIViewController

@property (nonatomic,assign) IIViewDeckNavigationControllerBehavior behavior;
@property (weak, nonatomic) IBOutlet UIButton *btnDaftar;

@end
