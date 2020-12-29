//
//  NSMutableArray+mhmCommon.h
//  IceRabbitKit
//
//  Created by 马浩萌 on 2020/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (mhmCommon)

- (nullable NSMutableArray *)mhm_moveObjectAtIndex:(NSUInteger)idx1 toObjectAtIndex:(NSUInteger)idx2;

@end

NS_ASSUME_NONNULL_END
