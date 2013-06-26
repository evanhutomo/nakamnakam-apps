//
//  CenterPage.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@class LeftDeckTab;

@interface CenterPage : UIViewController <UINavigationBarDelegate, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    UILabel *latitude;
    UILabel *longitude;
    UILabel *horizontalAccuracy;
    UILabel *altitude;
    UILabel *verticalAccuracy;
    UILabel *distance;
    UIButton *resetButton;
    CLLocation *startLocation;
}

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, strong) LeftDeckTab *leftdecktab;
@property (strong, nonatomic) IBOutlet UITableView *tabelresto;
@property (strong, nonatomic) NSString *namaresto;

@property (nonatomic,strong) NSMutableArray *restoIdArray;
@property (nonatomic,strong) NSMutableArray *restoarray;
@property (nonatomic,strong) NSMutableArray *restojalan;
@property (nonatomic,strong) NSMutableArray *restolong;
@property (nonatomic,strong) NSMutableArray *restolat;
@property (nonatomic,strong) NSMutableArray *avgrating;
@property (nonatomic,strong) NSMutableArray *restodistance;

@property (nonatomic,strong) NSMutableArray *restogambar;
@end
