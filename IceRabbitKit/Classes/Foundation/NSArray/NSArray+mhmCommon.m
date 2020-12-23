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
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj, idx)];
    }];
    return [result copy];
}

-(NSArray *)mhm_differenceObjectsWithArray:(NSArray *)other {
    NSArray<NSOrderedCollectionChange *> * selfMoreCollection = [self differenceFromArray:other].insertions;
    NSArray<NSOrderedCollectionChange *> * otherMoreCollection = [self differenceFromArray:other].removals;
    NSMutableArray<NSOrderedCollectionChange *> * combinCollection = [NSMutableArray arrayWithArray:selfMoreCollection];
    [combinCollection addObjectsFromArray:otherMoreCollection];
    return [combinCollection mhm_mapObjectsUsingBlock:^id(id  _Nonnull obj, NSInteger index) {
        return ((NSOrderedCollectionChange *)obj).object;
    }];;
}

-(NSArray *)mhm_differenceObjectsFromArray:(NSArray *)other {
    NSArray<NSOrderedCollectionChange *> * selfMoreCollection = [self differenceFromArray:other].insertions;
    return [selfMoreCollection mhm_mapObjectsUsingBlock:^id(id  _Nonnull obj, NSInteger index) {
        return ((NSOrderedCollectionChange *)obj).object;
    }];;
}

-(NSArray *)mhm_differenceObjectsToArray:(NSArray *)other {
    NSArray<NSOrderedCollectionChange *> * selfMoreCollection = [self differenceFromArray:other].removals;
    return [selfMoreCollection mhm_mapObjectsUsingBlock:^id(id  _Nonnull obj, NSInteger index) {
        return ((NSOrderedCollectionChange *)obj).object;
    }];;
}

-(NSArray *)mhm_sameObjectsWithArray:(NSArray *)other {
    NSArray * onlySelfObjects = [self mhm_differenceObjectsFromArray:other];
    return [self mhm_differenceObjectsFromArray:onlySelfObjects];
}

@end
