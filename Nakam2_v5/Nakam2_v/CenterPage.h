//
//  CenterPage.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeftDeckTab;

@interface CenterPage : UIViewController <UINavigationBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) LeftDeckTab *leftdecktab;
@property (strong, nonatomic) IBOutlet UITableView *tabelresto;

@end
