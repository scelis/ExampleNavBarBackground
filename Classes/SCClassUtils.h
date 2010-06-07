/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import <objc/objc-class.h>
#import <Foundation/Foundation.h>

@interface SCClassUtils : NSObject
{
}

+ (void)swizzleSelector:(SEL)orig ofClass:(Class)c withSelector:(SEL)new;

@end
