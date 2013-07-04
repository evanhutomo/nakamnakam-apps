//
//  InputKomentar.m
//  Nakam2_v
//
//  Created by Evan on 6/27/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "InputKomentar.h"
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

@interface InputKomentar ()

@end

@implementation InputKomentar
@synthesize id_resto,id_user, textfield_komen;

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
    NSLog(@"%@--%@", id_user, id_resto);
    self.title = @"Komentar disini";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Kirim" style: UIBarButtonItemStyleDone target:self action:@selector(BeriKomentar)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Kembali" style: UIBarButtonItemStyleDone target:self action:@selector(Keluar)];
}

-(void)BeriKomentar{
    NSString *comment = self.textfield_komen.text;
    if (![comment isEqualToString:@""] && ![self.id_user isEqualToString:nil]) {
            AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://nakamnakam.com/evan/"]];
            [httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
            [httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
            NSString *url = [NSString stringWithFormat:@"http://nakamnakam.com/evan/tulis_komen.php?userid=%@&restoid=%@&coment=%@",self.id_user, self.id_resto, comment];
            NSString *properlyEscapedURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                                    path:[NSString stringWithString:properlyEscapedURL]
                                            
                                                              parameters:nil];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 
                 
             }
                                             failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 NSLog(@"Error: %@", error);
             }];
            [operation start];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        
        
        }else{
            SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Woops" andMessage:@"Isi komentar sebelum mengirim"];
            [alert addButtonWithTitle:@"Ok"
                                 type:SIAlertViewButtonTypeCancel
                              handler:nil];
            alert.transitionStyle = SIAlertViewTransitionStyleSlideFromBottom;
            alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            [alert show];
    }
}

-(void)Keluar{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [textfield_komen resignFirstResponder];
}
@end
