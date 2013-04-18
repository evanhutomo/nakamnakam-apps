//
//  LeftDeckTab.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "LeftDeckTab.h"
#import "IIViewDeckController.h"
#import "NearbyPage.h"
#import "RecomendationPage.h"
#import "MorePage.h"
#import "AboutPage.h"

@interface LeftDeckTab () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation LeftDeckTab
@synthesize dataOption, temp;

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
    dataOption = [[NSArray alloc] initWithObjects:@"Home", @"Nearby", @"Recomendation", @"More", @"About", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataOption count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *setLabel = [dataOption objectAtIndex:[indexPath row]];
    cell.textLabel.text = setLabel;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        {case 0:
            NSLog(@"home");
            [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller){
                self.viewDeckController.centerController = SharedAppDelegate.centerPage;
            }];
            break;
        }
        {case 1:
            NSLog(@"Nearby");
            [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller){
                NearbyPage *nearbypage = [[NearbyPage alloc] initWithNibName:@"NearbyPage" bundle:nil];
                UINavigationController *navcontroller = [[UINavigationController alloc] initWithRootViewController:nearbypage];
                self.viewDeckController.centerController = navcontroller;
            }];
            break;}
        {case 2:
            NSLog(@"Recomendation");
            [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller){
                RecomendationPage *recomendationpage = [[RecomendationPage alloc] initWithNibName:@"RecomendationPage" bundle:nil];
                UINavigationController *navcontroller = [[UINavigationController alloc] initWithRootViewController:recomendationpage];
                self.viewDeckController.centerController = navcontroller;
            }];
            break;}
        {case 3:
            NSLog(@"More");
            [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller){
                MorePage *morepage = [[MorePage alloc] initWithNibName:@"MorePage" bundle:nil];
                UINavigationController *navcontroller = [[UINavigationController alloc] initWithRootViewController:morepage];
                self.viewDeckController.centerController = navcontroller;
            }];
            break;}
        {case 4:
            NSLog(@"About");
            [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller){
                AboutPage *aboutpage = [[AboutPage alloc] initWithNibName:@"AboutPage" bundle:nil];
                UINavigationController *navcontroller = [[UINavigationController alloc] initWithRootViewController:aboutpage];
                self.viewDeckController.centerController = navcontroller;
            }];
            break;}
    }
    

    
    
    //    NSLog(@"%d", indexPath.row);
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


@end
