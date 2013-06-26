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
@property (weak, nonatomic) IBOutlet UILabel *nearbyRestoran;
-(void)setGambar:(UIImage *)thumbnail;
-(void)setNamares:(NSString *)kalimat;
-(void)setJalanres:(NSString *)detailres;
-(void)setNearbyres:(NSString *)nearbyres;

@property (weak, nonatomic) IBOutlet UILabel *jarak_label;


@end
