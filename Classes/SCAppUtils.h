/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import <UIKit/UIKit.h>

#define kSCNavigationBarBackgroundImageTag 6183746
#define kSCNavigationBarTintColor [UIColor colorWithRed:0.39 green:0.72 blue:0.62 alpha:1.0]

@interface SCAppUtils : NSObject
{
}

+ (void)customizeNavigationController:(UINavigationController *)navController;

@end
