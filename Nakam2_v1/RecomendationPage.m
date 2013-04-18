//
//  RecomendationPage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "RecomendationPage.h"
#import "IIViewDeckController.h"
#import "DetailRestoPage.h"
#import "KustomCell.h"

@interface RecomendationPage ()
@property (nonatomic,strong) NSArray *dataNamaResto;
@property (nonatomic,strong) NSArray *dataJalan;
@property (nonatomic,strong) NSArray *dataGambarResto;

@end

@implementation RecomendationPage
@synthesize dataJalan, dataNamaResto, dataGambarResto;

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleTopView)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<<" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    self.navigationItem.title = @"Nearby";
    
    dataNamaResto = [[NSArray alloc] initWithObjects:@"A", @"B", nil];
    dataJalan = [[NSArray alloc] initWithObjects:@"jl.A", @"jl.B", nil];
    dataGambarResto = [[NSArray alloc] initWithObjects:@"makanan1.jpg", @"makanan2.jpg", nil];
    
    UITableView *tableview = (id)[self.view viewWithTag:1];
    UINib *nib = [UINib nibWithNibName:@"KustomCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:@"Kustom"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma - table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataNamaResto count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Kustom";
    KustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        NSArray *topLevel = [[NSBundle mainBundle] loadNibNamed:@"KustomCell" owner:self options:nil];
        cell = [topLevel objectAtIndex:0];
        
    }
    [cell setGambar:[UIImage imageNamed:[NSString stringWithFormat:@"makanan%d.jpg", indexPath.row + 1]]];//aku casting paksa ke UIImageView, karena parameter bukan UIImage
    [cell setNamares:[NSString stringWithFormat:@"%@", [dataNamaResto objectAtIndex:indexPath.row]]];
    [cell setJalanres:[NSString stringWithFormat:@"%@", [dataJalan objectAtIndex:indexPath.row]]];
    
   // NSString *loadNama = [dataNamaResto objectAtIndex:indexPath.row];
    //set text label dari widget tableviewcell dengan data didalam variabel dataArr
    //NSString *yea = [datadata objectAtIndex:indexPath.row];
   // NSString *loadJalan = [dataJalan objectAtIndex:indexPath.row];
    //    [[cell NameLabel] setText:yea];
    //    [[cell DetailsLabel] setText:yeaa];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"details recomendations");
    
}
@end
