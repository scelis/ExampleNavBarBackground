/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import "SCAppDelegate.h"
#import "SCAppUtils.h"
#import "SCTestTableViewController.h"

@implementation SCAppDelegate

@synthesize window;
@synthesize navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SCTestTableViewController *tvc = [[SCTestTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tvc];
    [SCAppUtils customizeNavigationController:nc];
    [self setNavController:nc];
    
    [window addSubview:[nc view]];
    [window makeKeyAndVisible];
    
    [tvc release];
    [nc release];
    
    return YES;
}

- (void)dealloc
{
    [navController release];
    [window release];
    [super dealloc];
}

@end
