//
//  MHMAuthorizationManager.h
//  MHMKeyboard
//
//  Created by 马浩萌 on 2020/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MHMAuthorizationManager : NSObject

+(void)checkCameraAuthorization: (void(^)(BOOL granted))callback;
+(void)checkPhotoLibraryAuthorization: (void(^)(BOOL granted))callback;

@end

NS_ASSUME_NONNULL_END
