/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface SCAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *navController;

@end
