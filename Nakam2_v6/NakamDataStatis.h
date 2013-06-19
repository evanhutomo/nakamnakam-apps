//
//  StaticData.h
//  Nakam2_v
//
//  Created by Evan on 5/24/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NakamDataStatis : NSObject
@property (strong, nonatomic) NSString *namauser;
@property (strong, nonatomic) NSString *usernamebuatlogin;
@property (strong, nonatomic) NSString *birth;
@property (strong, nonatomic) NSString *pointuser;
@property (strong, nonatomic) NSString *genderuser;


@property (strong, nonatomic) NSString *iduser;
@property (strong, nonatomic) NSString *kategoriuser;
@property (strong, nonatomic) NSString *pruser;

+(NakamDataStatis *)factory;


@end
