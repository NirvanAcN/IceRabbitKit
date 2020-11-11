//
//  NSTimer+Weak.m
//  DataShow
//
//  Created by iCe Rabbit on 2020/11/11.
//

#import "NSTimer+Weak.h"

@interface IRTimerAssistObject : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

-(void)fire:(NSTimer *)timer;

@end

@implementation IRTimerAssistObject

-(void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            [self.target performSelector:self.selector withObject:timer.userInfo];
        }
    } else {
        [self.timer invalidate];
    }
}

@end

@implementation NSTimer (Weak)

+(NSTimer *)ir_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    IRTimerAssistObject *timerAssistObject = [[IRTimerAssistObject alloc] init];
    timerAssistObject.selector = aSelector;
    timerAssistObject.target = aTarget;
    timerAssistObject.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:timerAssistObject selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    return timerAssistObject.timer;
}
/Users/mahaomeng/Documents/workspace/DataShow/DataShow/IceRabbitKit
@end
