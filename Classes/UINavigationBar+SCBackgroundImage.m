/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import "UINavigationBar+SCBackgroundImage.h"
#import "SCAppUtils.h"

@implementation UINavigationBar (SCBackgroundImage)

- (void)scInsertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [self scInsertSubview:view atIndex:index];
    
    UIView *backgroundImageView = [self viewWithTag:kSCNavigationBarBackgroundImageTag];
    if (backgroundImageView != nil)
    {
        [self scSendSubviewToBack:backgroundImageView];
    }
}

- (void)scSendSubviewToBack:(UIView *)view
{
    [self scSendSubviewToBack:view];
    
    UIView *backgroundImageView = [self viewWithTag:kSCNavigationBarBackgroundImageTag];
    if (backgroundImageView != nil)
    {
        [self scSendSubviewToBack:backgroundImageView];
    }
}

- (void)scSetBarStyle:(UIBarStyle)barStyle {
    [self scSetBarStyle:barStyle];
    
    UIView *backgroundImageView = [self viewWithTag:kSCNavigationBarBackgroundImageTag];
    if (backgroundImageView != nil)
    {
        if (self.barStyle == UIBarStyleDefault)
            backgroundImageView.hidden = NO;
        else
            backgroundImageView.hidden = YES;
    }
}

@end
