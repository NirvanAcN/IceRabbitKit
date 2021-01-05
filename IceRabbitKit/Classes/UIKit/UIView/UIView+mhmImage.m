//
//  UIView+mhmImage.m
//  IceRabbitKit
//
//  Created by 马浩萌 on 2021/1/5.
//

#import "UIView+mhmImage.h"

@implementation UIView (mhmImage)

-(UIImage *)mhm_image {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
