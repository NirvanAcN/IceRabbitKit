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

/// 生成指定颜色、尺寸的图片
/// @param color 指定图片颜色
/// @param targetSize 指定图片尺寸
+(nullable UIImage *)mhm_imageByColor:(nonnull UIColor *)color andSize:(CGSize)targetSize;

/// 与另一张图片合成一张新的图片
/// @param targetImage 另一张图片
-(nullable UIImage *)mhm_compositeWithImage:(nonnull UIImage *)targetImage;

-(nullable UIImage *)mhm_addBackgroundImage:(nonnull UIImage *)backgroundImae;

-(nullable UIImage *)mhm_generateBackgroundWithColor:(nonnull UIColor *)backgroundColor;

-(nullable UIImage *)mhm_original;

@end

NS_ASSUME_NONNULL_END
