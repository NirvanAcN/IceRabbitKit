//
//  NSArray+mhmCommon.h
//  GCD
//
//  Created by 马浩萌 on 2020/12/23.
//  Copyright © 2020 abandoneveryday. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nonnull (^MapBlock) (id obj, NSInteger index);

@interface NSArray<__covariant ObjectType> (mhmCommon)

- (NSArray<ObjectType> *)mhm_mapObjectsUsingBlock:(MapBlock)block;

/// Get all difference objects between self and other array
/// @param other other array
- (NSArray<ObjectType> *)mhm_differenceObjectsWithArray:(NSArray<ObjectType> *)other;

/// Get difference objects which only in self array but not in other array
/// @param other other array
- (NSArray<ObjectType> *)mhm_differenceObjectsFromArray:(NSArray<ObjectType> *)other;

/// Get difference objects which only in other array but not in self array
/// @param other other array
- (NSArray<ObjectType> *)mhm_differenceObjectsToArray:(NSArray<ObjectType> *)other;

/// Get the same objects between self and other array
/// @param other other array
- (NSArray<ObjectType> *)mhm_sameObjectsWithArray:(NSArray<ObjectType> *)other;

@end

NS_ASSUME_NONNULL_END
