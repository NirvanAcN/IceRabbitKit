//
//  NSMutableArray+mhmCommon.m
//  IceRabbitKit
//
//  Created by 马浩萌 on 2020/12/23.
//

#import "NSMutableArray+mhmCommon.h"

@implementation NSMutableArray (mhmCommon)

- (void)mhm_moveObjectAtIndex:(NSUInteger)idx1 toObjectAtIndex:(NSUInteger)idx2 {
    if (idx1 > idx2) {
        [self removeObjectAtIndex:idx1];
        [self insertObject:tmpObj atIndex:idx2];
    } else {
        [self insertObject:tmpObj atIndex:idx2 + 1];
        [self removeObjectAtIndex:idx1];
    }
}

@end
