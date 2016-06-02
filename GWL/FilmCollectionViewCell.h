//
//  FilmCollectionViewCell.h
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmModel.h"
@interface FilmCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FilmModel* model;
@end
