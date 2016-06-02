//
//  FilmCollectionViewCell.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "FilmCollectionViewCell.h"

@interface FilmCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
@implementation FilmCollectionViewCell
-(void)awakeFromNib{
    self.backgroundColor = [UIColor whiteColor];
}

-(void)setModel:(FilmModel *)model{
    _model = model;
    
    self.imageView.image = [UIImage imageNamed:model.image];
    self.label.text = model.name;
}
@end
