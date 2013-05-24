//
//  KustomCell.m
//  Nakam2_v
//
//  Created by Evan on 4/18/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "KustomCell.h"

@implementation KustomCell
@synthesize namaRestoran, jalanRestoran, gambarResto;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)setGambar:(UIImage *)thumbnail{
    [gambarResto setImage:thumbnail];
}

-(void)setNamares:(NSString *)kalimat{
    [namaRestoran setText:kalimat];
}

-(void)setJalanres:(NSString *)detailres{
    [jalanRestoran setText:detailres];
}

@end
