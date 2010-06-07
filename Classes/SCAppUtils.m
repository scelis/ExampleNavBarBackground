/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import "SCAppUtils.h"

@implementation SCAppUtils

+ (void)customizeNavigationController:(UINavigationController *)navController
{
    UINavigationBar *navBar = [navController navigationBar];
    [navBar setTintColor:kSCNavigationBarTintColor];
    
    UIImageView *imageView = (UIImageView *)[navBar viewWithTag:kSCNavigationBarBackgroundImageTag];
    if (imageView == nil)
    {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigation-bar-bg.png"]];
        [imageView setTag:kSCNavigationBarBackgroundImageTag];
        [navBar insertSubview:imageView atIndex:0];
        [imageView release];
    }
}

@end
