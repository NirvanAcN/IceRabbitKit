//
//  UIImage+mhmCommon.m
//  GCD
//
//  Created by 马浩萌 on 2020/12/28.
//  Copyright © 2020 abandoneveryday. All rights reserved.
//

#import "UIImage+mhmCommon.h"

@implementation UIImage (mhmCommon)

-(UIImage *)mhm_squareImage {
    CGSize size = self.size;
    return [self mhm_squareImageWithWidth:MAX(size.width, size.height)];
}

-(UIImage *)mhm_squareImageWithWidth:(CGFloat)width {
    return [self mhm_reDrawImageWithSize:CGSizeMake(width, width)];
}

-(UIImage *)mhm_reDrawImageWithSize:(CGSize)targetSize {
    CGImageRef imageRef = self.CGImage;
    size_t bytePerComponent = CGImageGetBitsPerComponent(imageRef);
    size_t bytePerRow = CGImageGetBytesPerRow(imageRef);
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    CGContextRef context = CGBitmapContextCreate(nil, targetSize.width, targetSize.height, bytePerComponent, bytePerRow, colorSpace, bitmapInfo);
    if (!context) return nil;
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextDrawImage(context, CGRectMake(0, 0, targetSize.width, targetSize.height), imageRef);
    CGImageRef bitmapImageRef = CGBitmapContextCreateImage(context);
    if (!bitmapImageRef) return nil;
    UIImage *image = [UIImage imageWithCGImage:bitmapImageRef scale:self.scale orientation:self.imageOrientation];
    CGContextRelease(context);
    return image;
}

@end
