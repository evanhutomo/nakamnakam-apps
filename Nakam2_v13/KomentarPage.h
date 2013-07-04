//
//  KomentarPage.h
//  Nakam2_v
//
//  Created by Evan on 6/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KomentarPage : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *restoid;
@property (nonatomic,strong) NSMutableArray *tampungkomentar;
@property (nonatomic,strong) NSMutableArray *pengomentar;
@property (nonatomic,strong) NSMutableArray *gender;

@property (strong, nonatomic) IBOutlet UITableView *tabelkomen;
@end
