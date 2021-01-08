//
//  UIImage+mhmFilter.m
//  test
//
//  Created by 马浩萌 on 2021/1/6.
//

#import "UIImage+mhmFilter.h"

@implementation UIImage (mhmFilter)

-(UIImage *)mhm_imageOfFilter:(MHMImageFilterName)filterName {
    CIFilter * filter = [CIFilter filterWithName:filterName];
    CIImage * beginImage = [CIImage imageWithCGImage:self.CGImage];
    [filter setValue:beginImage forKey:kCIInputImageKey];
    CIImage * outputImage = filter.outputImage;
    struct CGImage * outputCGImage = [[CIContext contextWithOptions:nil] createCGImage:outputImage fromRect:outputImage.extent];
    UIImage * newImage = [UIImage imageWithCGImage:outputCGImage];
    return newImage;
}

@end

MHMImageFilterName const MHMImageFilterNameCIColorPosterize = @"CIColorPosterize";
MHMImageFilterName const MHMImageFilterNameCIColorMonochrome = @"CIColorMonochrome";
MHMImageFilterName const MHMImageFilterNameCIMaximumComponent = @"CIMaximumComponent";
MHMImageFilterName const MHMImageFilterNameCIPhotoEffectMono = @"CIPhotoEffectMono";
MHMImageFilterName const MHMImageFilterNameCIFalseColor = @"CIFalseColor";
MHMImageFilterName const MHMImageFilterNameCIComicEffect = @"CIComicEffect";
MHMImageFilterName const MHMImageFilterNameCIHatchedScreen = @"CIHatchedScreen";
MHMImageFilterName const MHMImageFilterNameCIThermal = @"CIThermal";
MHMImageFilterName const MHMImageFilterNameCIMorphologyGradient = @"CIMorphologyGradient";
MHMImageFilterName const MHMImageFilterNameCIColorThreshold = @"CIColorThreshold";
MHMImageFilterName const MHMImageFilterNameCICircularScreen = @"CICircularScreen";
MHMImageFilterName const MHMImageFilterNameCISpotColor = @"CISpotColor";
MHMImageFilterName const MHMImageFilterNameCIPhotoEffectTonal = @"CIPhotoEffectTonal";
MHMImageFilterName const MHMImageFilterNameCILineOverlay = @"CILineOverlay";
MHMImageFilterName const MHMImageFilterNameCIColorInvert = @"CIColorInvert";
