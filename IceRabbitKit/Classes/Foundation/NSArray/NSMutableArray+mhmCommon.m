//
//  NSMutableArray+mhmCommon.m
//  IceRabbitKit
//
//  Created by 马浩萌 on 2020/12/23.
//

#import "NSMutableArray+mhmCommon.h"

@implementation NSMutableArray (mhmCommon)

- (nullable NSMutableArray *)mhm_moveObjectAtIndex:(NSUInteger)idx1 toObjectAtIndex:(NSUInteger)idx2 {
    id obj = [self[idx1] copy];
    if (idx1 > idx2) {
        [self removeObjectAtIndex:idx1];
        [self insertObject:obj atIndex:idx2];
    } else {
        [self insertObject:obj atIndex:idx2 + 1];
        [self removeObjectAtIndex:idx1];
    }
    return [self mutableCopy];
}

@end
