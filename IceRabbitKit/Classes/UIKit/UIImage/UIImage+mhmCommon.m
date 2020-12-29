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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = self;
    imageView.backgroundColor = [UIColor whiteColor];
    UIGraphicsBeginImageContext(imageView.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [imageView.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}

@end
