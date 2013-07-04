//
//  KomentarPage.m
//  Nakam2_v
//
//  Created by Evan on 6/26/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "KomentarPage.h"
#import "IIViewDeckController.h"
#import "DetailRestoPage.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFImageRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "NakamDataStatis.h"
#import "SVProgressHUD.h"
#import "KomentarCell.h"
#import "InputKomentar.h"
#import "SIAlertView.h"

@interface KomentarPage ()
@property (nonatomic,strong) NSString *iduser;
@end

@implementation KomentarPage
@synthesize restoid, tampungkomentar,tabelkomen, pengomentar, gender;

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
    NakamDataStatis *n = [NakamDataStatis factory];
    self.iduser = n.iduser;
    
    NSLog(@"RESTO ID: %@", self.restoid);
    self.navigationItem.title = @"Komentar";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Komen" style:UIBarButtonItemStyleDone target:self action:@selector(isiKomentar)];
    
    //-----------------------
    [SVProgressHUD showWithStatus:@"Loading"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam.com/evan/"]];
    [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:[NSString stringWithFormat:@"http://nakamnakam.com/evan/ambil_komen.php?restoid=%@", self.restoid]
                                                      parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError *err;
         NSDictionary *diks = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&err];
         NSLog(@"diks: %@", diks);         
         
         NSArray *array = [diks objectForKey:@"komentar"];
         tampungkomentar = [NSMutableArray array];
         pengomentar = [NSMutableArray array];
         gender = [NSMutableArray array];
         
         for (NSDictionary *f in array) {
             NSString *isikomen = [f objectForKey:@"coment"];
             [tampungkomentar addObject:isikomen];
         }
         
         for (NSDictionary *d in array) {
             NSString *nama = [d objectForKey:@"name"];
             [pengomentar addObject:nama];
         }
         
         for (NSDictionary *e in array) {
             NSString *gen = [e objectForKey:@"gender"];
             [gender addObject:gen];

         }
         
         [SVProgressHUD dismiss];
         [self.tabelkomen reloadData];
     }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
    [operation start];
    //-----------------------
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [pengomentar count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellKomentar";
    KomentarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        NSArray *topLevel = [[NSBundle mainBundle] loadNibNamed:@"KomentarCell" owner:self options:nil];
        cell = [topLevel objectAtIndex:0];
    }
    
//    NSLog(@"%@", gender);
//    NSURL *imageurl = [NSURL URLWithString:[restogambar objectAtIndex:indexPath.row]];  
    [cell setNama:[NSString stringWithFormat:@"%@", [pengomentar objectAtIndex:indexPath.row]]];
    [cell setAva:[NSString stringWithFormat:@"%@", [gender objectAtIndex:indexPath.row]]];
    [cell setKomentar:[NSString stringWithFormat:@"%@", [tampungkomentar objectAtIndex:indexPath.row]]];

    return cell;    
}

-(void)isiKomentar{
//    NSLog(@"eahhh%@", self.iduser);
    if (self.iduser == NULL) {
        SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Woops" andMessage:@"login dulu yah"];
        [alert addButtonWithTitle:@"Ok"
                             type:SIAlertViewButtonTypeCancel
                          handler:nil];
        alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
        alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
        [alert show];
    }else{
        InputKomentar *inputkomentar = [[InputKomentar alloc] initWithNibName:@"InputKomentar" bundle:nil];
        inputkomentar.id_user = self.iduser;
        inputkomentar.id_resto = self.restoid;
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:inputkomentar];
        [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:navi animated:YES completion:nil];
    
    }
}

-(void)kembali{
    NSLog(@"dismis");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
