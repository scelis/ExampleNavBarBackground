//
//  SCNavigationBar.m
//  ExampleNavBarBackground
//
//  Created by Sebastian Celis on 3/1/2012.
//  Copyright 2012-2012 Sebastian Celis. All rights reserved.
//

#import "SCNavigationBar.h"

@interface SCNavigationBar ()
@property (nonatomic, retain) UIImageView *backgroundImageView;
@property (nonatomic, retain) NSMutableDictionary *backgroundImages;
- (void)updateBackgroundImage;
@end


@implementation SCNavigationBar

@synthesize backgroundImages = _backgroundImages;
@synthesize backgroundImageView = _backgroundImageView;

#pragma mark - View Lifecycle

- (void)dealloc
{
    [_backgroundImages release];
    [_backgroundImageView release];
    [super dealloc];
}

#pragma mark - Background Image

- (NSMutableDictionary *)backgroundImages
{
    if (_backgroundImages == nil)
    {
        _backgroundImages = [[NSMutableDictionary alloc] init];
    }
    
    return _backgroundImages;
}

- (UIImageView *)backgroundImageView
{
    if (_backgroundImageView == nil)
    {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:[self bounds]];
        [_backgroundImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self insertSubview:_backgroundImageView atIndex:0];
    }
    
    return _backgroundImageView;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics
{
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [super setBackgroundImage:backgroundImage forBarMetrics:barMetrics];
    }
    else
    {
        [[self backgroundImages] setObject:backgroundImage forKey:[NSNumber numberWithInt:barMetrics]];
        [self updateBackgroundImage];
    }
}

- (void)updateBackgroundImage
{
    UIBarMetrics metrics = ([self bounds].size.height > 40.0) ? UIBarMetricsDefault : UIBarMetricsLandscapePhone;
    UIImage *image = [[self backgroundImages] objectForKey:[NSNumber numberWithInt:metrics]];
    if (image == nil && metrics != UIBarMetricsDefault)
    {
        image = [[self backgroundImages] objectForKey:[NSNumber numberWithInt:UIBarMetricsDefault]];
    }
    
    if (image != nil)
    {
        [[self backgroundImageView] setImage:image];
    }
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_backgroundImageView != nil)
    {
        [self updateBackgroundImage];
        [self sendSubviewToBack:_backgroundImageView];
    }
}

@end
