#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+mhmCommon.h"
#import "NSTimer+Weak.h"
#import "MHMAuthorizationManager.h"

FOUNDATION_EXPORT double IceRabbitKitVersionNumber;
FOUNDATION_EXPORT const unsigned char IceRabbitKitVersionString[];

