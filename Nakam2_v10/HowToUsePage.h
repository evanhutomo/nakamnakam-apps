//
//  HowToUsePage.h
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowToUsePage : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *pictureSlide;
@property (strong, nonatomic) IBOutlet UIPageControl *pageNumber;
@property (strong, nonatomic) NSArray *imagearray;
@end
