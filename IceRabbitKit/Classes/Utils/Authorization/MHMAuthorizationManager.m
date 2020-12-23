//
//  MHMAuthorizationManager.m
//  MHMKeyboard
//
//  Created by 马浩萌 on 2020/12/21.
//

#import "MHMAuthorizationManager.h"

@import AVFoundation;
@import Photos;

@implementation MHMAuthorizationManager

+(void)checkCameraAuthorization: (void(^)(BOOL granted))callback {
    AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (AVstatus) {
        case AVAuthorizationStatusAuthorized:
            callback(YES);
            break;
        case AVAuthorizationStatusDenied:
            callback(NO);
            break;
        case AVAuthorizationStatusNotDetermined: {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(granted);
                });
            }];
            break;
        }
        case AVAuthorizationStatusRestricted:
            callback(NO);
            break;
        default:
            callback(NO);
            break;
    }
}

+(void)checkPhotoLibraryAuthorization: (void(^)(BOOL granted))callback {
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
    switch (photoAuthorStatus) {
        case PHAuthorizationStatusAuthorized:
            callback(YES);
            break;
        case PHAuthorizationStatusDenied:
            callback(NO);
            break;
        case PHAuthorizationStatusNotDetermined: {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (status == PHAuthorizationStatusAuthorized) {
                        callback(YES);
                    }else{
                        callback(NO);
                    }
                });
            }];
            break;
        }
        case PHAuthorizationStatusRestricted:
            callback(NO);
            break;
        default:
            callback(NO);
            break;
    }
}

@end
