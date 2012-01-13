/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import "SCClassUtils.h"

#if OBJC_API_VERSION >= 2
#import <objc/runtime.h>
#else
#import <objc/objc-class.h>
#endif

@implementation SCClassUtils

+ (void)swizzleSelector:(SEL)orig ofClass:(Class)c withSelector:(SEL)new;
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
    {
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else
    {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@end
