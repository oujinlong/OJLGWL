//
//  OUNavAnimation.h
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface OUNavAnimation : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) CGRect imageRect;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, assign) BOOL isPush;
@property (nonatomic, assign) CGRect desRect;
@end
