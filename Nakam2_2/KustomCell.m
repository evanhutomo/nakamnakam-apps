//
//  KustomCell.m
//  Nakam2
//
//  Created by Evan on 4/17/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "KustomCell.h"

@implementation KustomCell
@synthesize namaResto, detailResto, gambarResto;

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

    // Configure the view for the selected state
}

-(void)setNama:(NSString *)kalimat{
    [namaResto setText:kalimat];
}

-(void)setDetail:(NSString *)kalimat{
    [detailResto setText:kalimat];
}

-(void)setGambar:(UIImage *)thumbnail{
    [gambarResto setImage:thumbnail];
}
@end
