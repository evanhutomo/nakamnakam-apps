//
//  LeftPage.m
//  Nakam2
//
//  Created by Evan on 4/17/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "LeftPage.h"
#import "IIViewDeckController.h"
#import "NearbyTableViewController.h"
#import "RecomenTableViewController.h"
#import "MoreViewController.h"

@interface LeftPage () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation LeftPage
@synthesize dataTab, temp;

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
    dataTab = [[NSArray alloc] initWithObjects:@"Home", @"Nearby", @"Recomendation", @"More", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataTab count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    NSString *setLabel = [dataTab objectAtIndex:[indexPath row]];
    cell.textLabel.text = setLabel;
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        {case 0:
            NSLog(@"Home");
            
            break;}
        {case 1:
            NSLog(@"Nearby");
            NearbyTableViewController *near = [[NearbyTableViewController alloc] initWithNibName:@"NearbyTableViewController" bundle:nil];
            [self.viewDeckController willMoveToParentViewController:near];
            break;}
        {case 2:
            NSLog(@"Recomendation");
            
            break;}
        {case 3:
            NSLog(@"More");
            
            break;}
        {default:
            break;}
    }
}
@end
