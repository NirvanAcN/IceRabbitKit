//
//  MHMOperationImageView.m
//  test
//
//  Created by 马浩萌 on 2021/1/5.
//

#import "MHMOperationImageView.h"

@interface MHMOperationImageView () <UIGestureRecognizerDelegate>

@end

@implementation MHMOperationImageView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        UIPinchGestureRecognizer * pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinchGestureRecognizer:)];
        pinchGestureRecognizer.delegate = self;
        [self addGestureRecognizer:pinchGestureRecognizer];
        
        UIRotationGestureRecognizer * rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotationGestureRecognizer:)];
        rotationGestureRecognizer.delegate = self;
        [self addGestureRecognizer:rotationGestureRecognizer];
        
        UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGestureRecognizer:)];
        [self addGestureRecognizer:panGestureRecognizer];
    }
    return self;
}

-(void)onRotationGestureRecognizer:(UIRotationGestureRecognizer *)sender {
    UIView * imageView = sender.view;
    imageView.transform = CGAffineTransformRotate(imageView.transform, sender.rotation);
    sender.rotation = 0;
}

-(void)onPinchGestureRecognizer:(UIPinchGestureRecognizer *)sender {
    UIView * imageView = sender.view;
    imageView.transform = CGAffineTransformScale(imageView.transform, sender.scale, sender.scale);
    sender.scale = 1;
}

-(void)onPanGestureRecognizer:(UIPanGestureRecognizer *)sender {
    UIView * imageView = sender.view;
    CGPoint point = [sender translationInView:self.superview];
    imageView.center = CGPointMake(imageView.center.x + point.x, imageView.center.y + point.y);
    [sender setTranslation:CGPointMake(0, 0) inView:self.superview];
}

// 解决手势冲突
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
