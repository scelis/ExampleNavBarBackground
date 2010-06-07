/*
 * Copyright (c) 2010-2010 Sebastian Celis
 * All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "SCClassUtils.h"

int main(int argc, char *argv[])
{
    [SCClassUtils swizzleSelector:@selector(insertSubview:atIndex:)
                          ofClass:[UINavigationBar class]
                     withSelector:@selector(scInsertSubview:atIndex:)];
    [SCClassUtils swizzleSelector:@selector(sendSubviewToBack:)
                          ofClass:[UINavigationBar class]
                     withSelector:@selector(scSendSubviewToBack:)];
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
