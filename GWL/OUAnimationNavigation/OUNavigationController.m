//
//  OUNavigationController.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OUNavigationController.h"
#import "OUNavAnimation.h"
@interface OUNavigationController () <UINavigationControllerDelegate>
@property (nonatomic, assign) CGRect origionRect;
@property (nonatomic, assign) CGRect desRect;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, assign) BOOL isPush;
@end

@implementation OUNavigationController
-(void)pushViewController:(UIViewController *)viewController withImageView:(UIImageView *)imageView desRect:(CGRect)desRect{
    self.delegate = self;
    self.origionRect = [imageView convertRect:imageView.frame toView:self.view];
;
    self.desRect = desRect;
    self.image = imageView.image;
    self.isPush = YES;
    [super pushViewController:viewController animated:YES];
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    self.isPush = NO;
    
    return [super popViewControllerAnimated:animated];
}

#pragma mark UINavigationControllerDelegate
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    OUNavAnimation* animation = [[OUNavAnimation alloc] init];
    animation.imageRect = self.origionRect;
    animation.image = self.image;
    animation.isPush = self.isPush;
    animation.desRect = self.desRect;
    if (!self.isPush) {
        self.delegate = nil;
    }
    return animation;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
