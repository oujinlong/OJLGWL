//
//  OUHomeView.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OUHomeView.h"
@class FilmCollectionViewCell;
@implementation OUHomeView

-(instancetype)initWithFrame:(CGRect)frame dataSource:(id<UICollectionViewDataSource>)dataSource delegate:(id<UICollectionViewDelegate>)delegate{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        CGFloat panding = 15;
        NSInteger numberOfCol = 3;
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - (numberOfCol + 1) * panding)/numberOfCol;
        self.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
        CGFloat heignt = 1.7 * width;
        self.dataSource = dataSource;
        self.delegate = delegate;
        layout.itemSize = CGSizeMake(width, heignt);
        layout.minimumInteritemSpacing = panding;
        layout.minimumLineSpacing = 20;
        layout.sectionInset = UIEdgeInsetsMake(0, panding, 0, panding);
        [self registerNib:[UINib nibWithNibName:@"FilmCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    
    return self;
}

@end
