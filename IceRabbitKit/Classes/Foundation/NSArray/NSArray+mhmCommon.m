//
//  NSArray+mhmCommon.m
//  GCD
//
//  Created by 马浩萌 on 2020/12/23.
//  Copyright © 2020 abandoneveryday. All rights reserved.
//

#import "NSArray+mhmCommon.h"

@implementation NSArray (mhmCommon)

-(NSArray *)mhm_mapObjectsUsingBlock:(MapBlock)block {
    if (self.count == 0) return nil;
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (obj) {
            if (block(obj, idx)) {
                [result addObject:block(obj, idx)];
            }
        }
    }];
    return [result copy];
}

-(NSArray *)mhm_differenceObjectsWithArray:(NSArray *)other {
    NSMutableArray * result = [NSMutableArray arrayWithArray:[self mhm_differenceObjectsFromArray:other]];
    [result addObjectsFromArray:[self mhm_differenceObjectsToArray:other]];
    return [result copy];
}

-(NSArray *)mhm_differenceObjectsFromArray:(NSArray *)other {
    NSMutableSet * selfSet = [NSMutableSet setWithArray:self];
    NSSet * otherSet = [NSSet setWithArray:other];
    [selfSet minusSet:otherSet];
    return [selfSet allObjects];
}

-(NSArray *)mhm_differenceObjectsToArray:(NSArray *)other {
    NSMutableSet * otherSet = [NSMutableSet setWithArray:other];
    NSSet * selfSet = [NSSet setWithArray:self];
    [otherSet minusSet:selfSet];
    return [otherSet allObjects];
}

-(NSArray *)mhm_sameObjectsWithArray:(NSArray *)other {
    NSMutableSet * selfSet = [NSMutableSet setWithArray:self];
    NSSet * otherSet = [NSSet setWithArray:other];
    [selfSet intersectSet:otherSet];
    return [selfSet allObjects];
}

@end
