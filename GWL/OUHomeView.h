//
//  OUHomeView.h
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OUHomeView : UICollectionView
-(instancetype)initWithFrame:(CGRect)frame dataSource:(id<UICollectionViewDataSource>)dataSource delegate : (id <UICollectionViewDelegate>)delegate;
@end
