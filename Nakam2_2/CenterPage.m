//
//  CenterPage.m
//  Nakam2
//
//  Created by Evan on 4/16/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "CenterPage.h"
#import "IIViewDeckController.h"
#import "KustomCell.h"

@interface CenterPage () <UITableViewDataSource, UITableViewDelegate, IIViewDeckControllerDelegate>
@property (nonatomic, strong) NSArray *dataNamaResto;
@property (nonatomic, strong) NSArray *dataFotoResto;
@property (nonatomic, strong) NSArray *dataDetailsCellResto;
@end

@implementation CenterPage
@synthesize dataDetailsCellResto, dataFotoResto, dataNamaResto;

    static NSString *CellIdentifier = @"Kustom";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //test ini viewdeckcontroller
    if(self.viewDeckController){
        NSLog(@"ini viewdeck, di centerviewcontroller");
    }else{
        NSLog(@"ini bukan viewdeck");
    }
    
    //munculin navbar
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"deck" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    self.navigationItem.title = @"Nakam2";
    
    dataNamaResto = [[NSArray alloc] initWithObjects:@"Soto Sempu", @"Bakso Samut", @"Sate ayam Pak No", nil];
    dataFotoResto = [[NSArray alloc] initWithObjects:@"makanan1.jpg", @"makanan2.jpg", @"makanan3.jpg", nil];
    dataDetailsCellResto = [[NSArray alloc] initWithObjects:@"jl. sempu104", @"jl. tidar atas 89", @"jl. jombang 9A", nil];
    
    UITableView *tableview = (id)[self.view viewWithTag:1];
    
    UINib *nib = [UINib nibWithNibName:@"KustomCell" bundle:nil];
//    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [tableview registerNib:nib forCellReuseIdentifier:CellIdentifier];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataNamaResto count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(nil == cell){
        NSArray *toplevel = [[NSBundle mainBundle]loadNibNamed:@"KustomCell" owner:self options:nil];
        cell = [toplevel objectAtIndex:0];
}
    [cell setNama:[NSString stringWithFormat:@"%@", [dataNamaResto objectAtIndex:[indexPath row]]]];
    [cell setDetail:[NSString stringWithFormat:@"%@", [dataDetailsCellResto objectAtIndex:[indexPath row]]]];
    [cell setGambar:[UIImage imageNamed:[NSString stringWithFormat:@"makanan%d.jpg", indexPath.row+1]]];

//    NSString *loadnama = [dataNamaResto objectAtIndex:indexPath.row];
//    NSString *detailnya = [dataDetailsCellResto objectAtIndex:indexPath.row];

return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
}

@end
