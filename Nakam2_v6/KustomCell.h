//
//  KustomCell.h
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KustomCell : UITableViewCell
{
       UIImageView *image;
}
@property (weak, nonatomic) IBOutlet UIImageView *gambarResto;
@property (weak, nonatomic) IBOutlet UILabel *namaRestoran;
@property (weak, nonatomic) IBOutlet UILabel *jalanRestoran;

-(void)setGambar:(UIImage *)thumbnail;
-(void)setNamares:(NSString *)kalimat;
-(void)setJalanres:(NSString *)detailres;

@end
