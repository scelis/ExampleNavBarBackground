//
//  SCAppDelegate.m
//  ExampleNavBarBackground
//
//  Created by Sebastian Celis on 6/7/2010.
//  Copyright 2010-2012 Sebastian Celis. All rights reserved.
//

#import "SCAppDelegate.h"

#import "SCNavigationBar.h"
#import "SCTestTableViewController.h"

@interface SCAppDelegate ()
- (UINavigationController *)customizedNavigationController;
@end


@implementation SCAppDelegate

@synthesize navigationController = _navigationController;
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UINavigationController *navigationController = [self customizedNavigationController];
    SCTestTableViewController *tvc = [[SCTestTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [navigationController setViewControllers:[NSArray arrayWithObject:tvc]];
    [self setNavigationController:navigationController];
    [tvc release];
    
    [[self window] setRootViewController:navigationController];
    [[self window] makeKeyAndVisible];
    
    return YES;
}

- (void)dealloc
{
    [_navigationController release];
    [_window release];
    [super dealloc];
}

- (UINavigationController *)customizedNavigationController
{
    UINavigationController *navController = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    
    // Ensure the UINavigationBar is created so that it can be archived. If we do not access the
    // navigation bar then it will not be allocated, and thus, it will not be archived by the
    // NSKeyedArchvier.
    [navController navigationBar];
    
    // Archive the navigation controller.
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:navController forKey:@"root"];
    [archiver finishEncoding];
    [archiver release];
    [navController release];
    
    // Unarchive the navigation controller and ensure that our UINavigationBar subclass is used.
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [unarchiver setClass:[SCNavigationBar class] forClassName:@"UINavigationBar"];
    UINavigationController *customizedNavController = [unarchiver decodeObjectForKey:@"root"];
    [unarchiver finishDecoding];
    [unarchiver release];
    
    // Modify the navigation bar to have a background image.
    SCNavigationBar *navBar = (SCNavigationBar *)[customizedNavController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.39 green:0.72 blue:0.62 alpha:1.0]];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigation-bar-bg.png"] forBarMetrics:UIBarMetricsDefault];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigation-bar-bg-landscape.png"] forBarMetrics:UIBarMetricsLandscapePhone];

    return customizedNavController;
}

@end
