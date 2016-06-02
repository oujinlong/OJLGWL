//
//  OUNavAnimation.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
// OJL

#import "OUNavAnimation.h"
@interface OUNavAnimation ()
@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, assign) CGRect finalRect;
@property (nonatomic, weak) UIImageView* imageView;
@end
@implementation OUNavAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    self.finalRect =  self.desRect;

    if (self.isPush) {
        [self startPushAnimation];
    }else{
        [self startPopAnimation];
    }
    
    
    
}
-(void)startPopAnimation{

    UIViewController* fromVc = [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
   
    
    
    CGFloat X = [UIScreen mainScreen].bounds.size.width - self.finalRect.origin.x;
    CGFloat Y = [UIScreen mainScreen].bounds.size.height - self.finalRect.origin.y;
    CGFloat radius = sqrtf(X * X + Y * Y);
    UIBezierPath* origionPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(50, 120, 20, 20), -radius, -radius)];
    
    UIBezierPath* finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(25 + self.imageRect.size.width / 2, 180 + self.imageRect.size.height / 2, 0, 0)];

    
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.path = finalPath.CGPath;
    fromVc.view.layer.mask = layer;
    
   
    
    CABasicAnimation* animimation = [CABasicAnimation animationWithKeyPath:@"path"];
    animimation.fromValue = (__bridge id _Nullable)(origionPath.CGPath);
    animimation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animimation.delegate = self;
    animimation.duration = 0.3;
    [layer addAnimation:animimation forKey:@"path"];
    
    
    
}
-(void)startPushAnimation{
    
    
    UIView* contentView = [self.transitionContext containerView];
    [contentView addSubview:[self bgView]];
    UIViewController* toVc = [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.imageRect];
    self.imageView = imageView;
    imageView.image = self.image;
    imageView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(0, 0);
    imageView.layer.shadowOpacity = 5;
    imageView.layer.shadowRadius = 5;
    [contentView addSubview:imageView];
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.transform = CGAffineTransformScale(imageView.transform, 1.2, 1.2);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            imageView.frame = self.finalRect;
            imageView.transform = CGAffineTransformScale(imageView.transform, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15 animations:^{
                imageView.frame = self.finalRect;
                self.finalRect = imageView.frame;
            } completion:^(BOOL finished) {
                imageView.layer.shadowRadius = 5;
                imageView.layer.shadowOpacity = 5;
                
                
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    imageView.layer.shadowRadius = 0;
                    
                    [contentView addSubview:toVc.view];
                    [self setupCircleAnimation];
                    [contentView bringSubviewToFront:imageView];
                });
                
            }];
            
            
        }];
        
    }];

}
-(UIView*)bgView{
    UIView* view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.tag = 1;
    UIView* topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 220)];
    view.backgroundColor = [UIColor whiteColor];
    topView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:topView];
    
    view.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 1;
    }];
    return view;
}
-(void)setupCircleAnimation{
    CGPoint point = CGPointMake(20, 150);
    UIBezierPath* origionPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(point.x + self.imageRect.size.width / 2, point.y + self.imageRect.size.height / 2, 0, 0)];
    
    CGFloat X = [UIScreen mainScreen].bounds.size.width - point.x;
    CGFloat Y = [UIScreen mainScreen].bounds.size.height - point.y;
    CGFloat radius = sqrtf(X * X + Y * Y);
    UIBezierPath* finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(point.x + self.imageRect.size.width / 2, point.y + self.imageRect.size.height / 2, 0, 0), -radius, -radius)];
    
    UIViewController* toVc = [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.path = finalPath.CGPath;
    toVc.view.layer.mask = layer;
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.delegate = self;
    animation.fromValue = (__bridge id _Nullable)(origionPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = 0.3;
    [layer addAnimation:animation forKey:@"path"];
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (!self.isPush) {
        UIView* contentView = [self.transitionContext containerView];
        UIViewController* toVc = [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

        UIImageView* imageView = nil;
        for (id view in contentView.subviews) {
            if ([view isKindOfClass:[UIImageView class]]) {
                imageView = view;
                break;
            }
        }
        imageView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        imageView.layer.shadowOffset = CGSizeMake(0, 0);
        imageView.layer.shadowOpacity = 5;
        imageView.layer.shadowRadius = 5;
        [UIView animateWithDuration:0.3 animations:^{
            imageView.transform = CGAffineTransformScale(imageView.transform, 1.2, 1.2);
        
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
               
                imageView.frame = self.imageRect;
                imageView.transform = CGAffineTransformScale(imageView.transform, 1.2, 1.2);
            
            }completion:^(BOOL finished) {
                
                [UIView animateWithDuration:0.15 animations:^{
                    imageView.frame = self.imageRect;
                } completion:^(BOOL finished) {
                    imageView.layer.shadowRadius = 5;
                    imageView.layer.shadowOpacity = 5;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        imageView.layer.shadowRadius = 0;
                        imageView.layer.shadowOpacity = 0;
                        
                        
                        
                        [contentView addSubview:toVc.view];
                        toVc.view.alpha = 0;
                        [UIView animateWithDuration:0.2 animations:^{
                            toVc.view.alpha = 1;
                        } completion:^(BOOL finished) {
                            [imageView removeFromSuperview];
                            [[[self.transitionContext containerView] viewWithTag:1] removeFromSuperview];
                            [self.transitionContext completeTransition:YES];
                            
                            
                            [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
                            [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;;
                        }];
                       
                        

                    });
                    
                    
                    
                }];
                

            }];
            
           
        }];
        
        
       
    }else{
        
        [self.transitionContext completeTransition:YES];

        
        [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
        [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
        
        
    }

}
@end
