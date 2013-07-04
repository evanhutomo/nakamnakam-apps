//
//  KomentarCell.m
//  Nakam2_v
//
//  Created by Evan on 6/27/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "KomentarCell.h"

@implementation KomentarCell
@synthesize lbl_nama, textfield_komentar, ava_komentar, gender;

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

-(void)setAva:(NSString *)ava{
    if ([ava isEqualToString:@"male"]) {
        [ava_komentar setImage:[UIImage imageNamed:@"boy_icon.png"]];
    }else{
        [ava_komentar setImage:[UIImage imageNamed:@"girl_icon.png"]];
    }
//    [ava_komentar setImage:ava];
}

-(void)setNama:(NSString *)nama{
    [lbl_nama setText:nama];
}

-(void)setKomentar:(NSString *)isikomentar{
    [textfield_komentar setText:isikomentar];
}

@end
