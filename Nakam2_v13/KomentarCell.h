//
//  KomentarCell.h
//  Nakam2_v
//
//  Created by Evan on 6/27/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KomentarCell : UITableViewCell
{
    UIImageView *image;
}

@property (strong, nonatomic) IBOutlet UILabel *lbl_nama;
@property (strong, nonatomic) IBOutlet UITextView *textfield_komentar;
@property (strong, nonatomic) IBOutlet UIImageView *ava_komentar;
@property (strong, nonatomic) NSString *gender;

-(void)setAva:(NSString *)ava;
-(void)setNama:(NSString *)nama;
-(void)setKomentar:(NSString *)isikomentar;

@end
