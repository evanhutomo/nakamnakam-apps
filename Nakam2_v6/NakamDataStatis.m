//
//  StaticData.m
//  Nakam2_v
//
//  Created by Evan on 5/24/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "NakamDataStatis.h"

@implementation NakamDataStatis

@synthesize namauser, birth, pointuser, genderuser, iduser, kategoriuser, pruser, usernamebuatlogin;

static NakamDataStatis *_instance;

+ (NakamDataStatis *)factory
{
    if(_instance == nil)
    {
        _instance = [[NakamDataStatis alloc] init];
        
    }
    
    return _instance;
}



@end
