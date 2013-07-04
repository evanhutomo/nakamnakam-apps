//
//  HowToUsePage.m
//  Nakam2_v
//
//  Created by Evan on 6/23/13.
//  Copyright (c) 2013 Evan. All rights reserved.
//

#import "HowToUsePage.h"

@interface HowToUsePage ()

@end

@implementation HowToUsePage
@synthesize imagearray, pageNumber, pictureSlide;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    imagearray = [[NSArray alloc] initWithObjects:@"howto_1.png", @"howto_2.png",  @"howto_3.png", @"howto_4.png", @"howto_5.png", @"howto_6.png", @"howto_7.png", @"howto_8.png", nil];
    
    for (int i = 0; i < [imagearray count]; i++) {
        //We'll create an imageView object in every 'page' of our scrollView.
        CGRect frame;
        frame.origin.x = self.pictureSlide.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.pictureSlide.frame.size;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[imagearray objectAtIndex:i]];
        [self.pictureSlide addSubview:imageView];
    }
    //Set the content size of our scrollview according to the total width of our imageView objects.
    pictureSlide.contentSize = CGSizeMake(pictureSlide.frame.size.width * [imagearray count], pictureSlide.frame.size.height);

}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.pictureSlide.frame.size.width;
    int page = floor((self.pictureSlide.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageNumber.currentPage = page;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
