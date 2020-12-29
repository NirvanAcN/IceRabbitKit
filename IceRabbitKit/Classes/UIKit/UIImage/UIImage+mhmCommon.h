//
//  UIImage+mhmCommon.h
//  GCD
//
//  Created by 马浩萌 on 2020/12/28.
//  Copyright © 2020 abandoneveryday. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (mhmCommon)

/// 白色填充的正方形图片
-(UIImage *)mhm_squareImage;

-(UIImage *)mhm_squareImageWithWidth:(CGFloat)width;

-(UIImage *)mhm_reDrawImageWithSize:(CGSize)targetSize;

@end

NS_ASSUME_NONNULL_END
