/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface UINavigationBar (SCBackgroundImage)

- (void)scInsertSubview:(UIView *)view atIndex:(NSInteger)index;
- (void)scSendSubviewToBack:(UIView *)view;

@end
