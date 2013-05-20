//
//  MorePage.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "MorePage.h"
#import "IIViewDeckController.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface MorePage ()
@property (strong, nonatomic) NSArray *list_resto;
@property (strong, nonatomic) NSString *rating_tampung;
@end

@implementation MorePage
@synthesize list_resto,txt_name,title, rating_tampung;

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    NSLog(@"%d", [list_resto count]);
    return [self.list_resto count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.list_resto[row];
}

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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"option" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    self.navigationItem.title = @"More";
    //listing resto dummy
    
    self.list_resto = @[@"A", @"B", @"C", @"D", @"E"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_sent:(id)sender {
    NSInteger row = [self.picker_resto selectedRowInComponent:0];
    NSString *selected = self.list_resto[row];
    NSString *print = [[NSString alloc] initWithFormat:@"%@", selected];
    NSString *b = self.txt_name.text;
    NSLog(@"nama :%@ resto:%@ rating:%@", b, print, self.rating_tampung);
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost/nakamnakam/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://localhost/nakamnakam/tulis.php?nama=%@&resto=%@", b, print]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *error;
         NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         NSLog(@"%@", array);
         NSDictionary *dictionary = [array objectAtIndex:1];
         NSLog(@"title : %@", [dictionary objectForKey:@"title"]);
         
         // Print the response body in text
         NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
    
    
    
}   

- (IBAction)btn_rating:(UISegmentedControl *)sender {
    int pilih = sender.selectedSegmentIndex;
    switch (pilih) {
        {case 0:
            self.rating_tampung = @"1";
            NSLog(@"%@", self.rating_tampung);
            break;}
        {case 1:
            self.rating_tampung = @"2";
            NSLog(@"%@", self.rating_tampung);
            break;
        }
        {case 2:
            self.rating_tampung = @"3";
            NSLog(@"%@", self.rating_tampung);
            break;
        }
        {case 3:
            self.rating_tampung = @"4";
            NSLog(@"%@", self.rating_tampung);
            break;
        }
        {case 4:
            self.rating_tampung = @"5";
            NSLog(@"%@", self.rating_tampung);
            break;
        }

}
}

- (IBAction)dismiss:(UITextField *)sender {
    [txt_name resignFirstResponder];
}


@end
