//
//  KustomCell.h
//  Nakam2
//
//  Created by Evan on 4/17/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KustomCell : UITableViewCell
{
    UIImageView *image;
}
@property (weak, nonatomic) IBOutlet UIImageView *gambarResto;
@property (weak, nonatomic) IBOutlet UILabel *namaResto;
@property (weak, nonatomic) IBOutlet UILabel *detailResto;

-(void)setGambar:(UIImage *)thumbnail;
-(void)setNama:(NSString *)kalimat;
-(void)setDetail:(NSString *)kalimat;

@end
