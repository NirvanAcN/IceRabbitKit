//
//  MHMOCRManager.h
//  GCD
//
//  Created by 马浩萌 on 2020/12/24.
//  Copyright © 2020 abandoneveryday. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIImage;

@interface MHMOCRManager : NSObject

+(void)recognizeTextWith:(UIImage *)image withCompletionHandler:(void(^)(NSArray<NSString *> * _Nullable result, NSError * _Nullable error))handler;

@end

NS_ASSUME_NONNULL_END
