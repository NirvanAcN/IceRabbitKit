//
//  MHMOCRManager.m
//  GCD
//
//  Created by 马浩萌 on 2020/12/24.
//  Copyright © 2020 abandoneveryday. All rights reserved.
//

#import "MHMOCRManager.h"
#import <UIKit/UIKit.h>
#import <Vision/Vision.h>

@implementation MHMOCRManager

+(void)recognizeTextWith:(UIImage *)image withCompletionHandler:(void(^)(NSArray<NSString *> * _Nullable result, NSError * _Nullable error))handler {
    struct CGImage * cgImage = image.CGImage;
    VNImageRequestHandler * requestHandler = [[VNImageRequestHandler alloc] initWithCGImage:cgImage options:@{}];
    VNRecognizeTextRequest * request = [[VNRecognizeTextRequest alloc] initWithCompletionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
        NSArray<VNRecognizedTextObservation *> * observations = request.results;
        NSMutableArray * result = [NSMutableArray array];
        [observations enumerateObjectsUsingBlock:^(VNRecognizedTextObservation * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString * recognizeText = [[obj topCandidates:1] firstObject].string;
            [result addObject:recognizeText];
        }];
        handler(result, nil);
    }];
    request.recognitionLevel = VNRequestTextRecognitionLevelAccurate;
    if (@available(iOS 14.0, *)) {
        request.revision = VNRecognizeTextRequestRevision2;
    } else {
        // Fallback on earlier versions
    }
    request.recognitionLanguages = @[@"zh", @"en", @"ja"];
    
    NSError * error;
    [requestHandler performRequests:@[request] error: &error];
    if (error) {
        handler(nil, error);
    }
}

@end
