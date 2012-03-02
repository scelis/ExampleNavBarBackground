//
//  SCAppDelegate.h
//  ExampleNavBarBackground
//
//  Created by Sebastian Celis on 6/7/2010.
//  Copyright 2010-2012 Sebastian Celis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
