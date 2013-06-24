//
//  CategoryPage.m
//  Nakam2_v
//
//  Created by Evan on 6/21/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "CategoryPage.h"
#import "IIViewDeckController.h"
#import "ViewCategoryPage.h"

@interface CategoryPage ()

@end

@implementation CategoryPage

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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Profile" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)];
    self.navigationItem.title = @"Category";
    
    UITableView *tableview = (id)[self.view viewWithTag:1];
    UINib *nib = [UINib nibWithNibName:@"KustomCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:@"Kustom"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_indonesianfood:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"indonesia";
        [self.navigationController pushViewController:viewcategorypage animated:YES];
}

- (IBAction)btn_chinesefood:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"chinese";
    [self.navigationController pushViewController:viewcategorypage animated:YES];
}

- (IBAction)btn_westernfood:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"western";
    [self.navigationController pushViewController:viewcategorypage animated:YES];
}

- (IBAction)btn_japanesefood:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"japanese";
    [self.navigationController pushViewController:viewcategorypage animated:YES];
}

- (IBAction)btn_coffeeshop:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"coffee";
    [self.navigationController pushViewController:viewcategorypage animated:YES];
}

- (IBAction)btn_cakebakepastry:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"cake";
    [self.navigationController pushViewController:viewcategorypage animated:YES];
}

- (IBAction)btn_fastfood:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"fastfood";
    [self.navigationController pushViewController:viewcategorypage animated:YES];
}

- (IBAction)btn_internationalfood:(id)sender {
    ViewCategoryPage *viewcategorypage = [[ViewCategoryPage alloc] initWithNibName:@"ViewCategoryPage" bundle:nil];
    viewcategorypage.tampungkategori = @"international";
    [self.navigationController pushViewController:viewcategorypage animated:YES];
}
@end
