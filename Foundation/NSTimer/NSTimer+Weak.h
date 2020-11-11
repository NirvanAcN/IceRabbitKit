//
//  NSTimer+Weak.h
//  DataShow
//
//  Created by iCe Rabbit on 2020/11/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Weak)

+ (NSTimer *)ir_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
