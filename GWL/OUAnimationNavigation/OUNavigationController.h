//
//  OUNavigationController.h
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OUNavigationController : UINavigationController
/**
 *  push 方法
 *
 *  @param viewController 目标控制器
 *  @param imageView      所要移动的ImageView
 *  @param desRect        目标位置矩形
 */
-(void)pushViewController:(UIViewController *)viewController withImageView:(UIImageView*)imageView  desRect:(CGRect)desRect;
@end
