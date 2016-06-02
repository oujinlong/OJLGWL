//
//  FilmModel.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "FilmModel.h"

@implementation FilmModel
+(NSArray *)filmArray{
    NSMutableArray* array = [NSMutableArray array];
    
    FilmModel* m1 = [[FilmModel alloc] init];
    m1.name = @" 速度与激情7";
    m1.image = @"1.jpg";
    m1.cover = @"c1.jpg";
    [array addObject:m1];
    
    FilmModel* m2 = [[FilmModel alloc] init];
    m2.name = @"霍比特人2";
    m2.image = @"2.jpg";
    m2.cover = @"c2.jpg";
    [array addObject:m2];

    
    FilmModel* m3 = [[FilmModel alloc] init];
    m3.name = @"美人鱼";
    m3.image = @"3.jpg";
    m3.cover = @"c3.jpg";
    [array addObject:m3];

    FilmModel* m4 = [[FilmModel alloc] init];
    m4.name = @"疯狂动物城";
    m4.image = @"4.jpg";
    m4.cover = @"c4.jpg";
    [array addObject:m4];

    FilmModel* m5 = [[FilmModel alloc] init];
    m5.name = @"美国队长3";
    m5.image = @"5.jpg";
    m5.cover = @"c5.jpg";

    [array addObject:m5];
    
    
    FilmModel* m6 = [[FilmModel alloc] init];
    m6.name = @"X战警";
    m6.image = @"6.jpg";
    m6.cover = @"c6.jpg";
    [array addObject:m6];


    FilmModel* m7 = [[FilmModel alloc] init];
    m7.name = @"爱丽丝梦游仙境";
    m7.image = @"7.jpg";
    m7.cover = @"c7.jpg";
    [array addObject:m7];
    
    FilmModel* m8 = [[FilmModel alloc] init];
    m8.name = @"愤怒的小鸟";
    m8.image = @"8.jpg";
    m8.cover = @"c8.jpg";
    [array addObject:m8];
    
    
    FilmModel* m9 = [[FilmModel alloc] init];
    m9.name = @"魔兽世界";
    m9.image = @"9.jpg";
    m9.cover = @"c9.jpg";
    [array addObject:m9];
    
    FilmModel* m10 = [[FilmModel alloc] init];
    m10.name = @"北京遇上西雅图2";
    m10.image = @"10.jpg";
    m10.cover = @"c10.jpg";
    [array addObject:m10];
    
    FilmModel* m11 = [[FilmModel alloc] init];
    m11.name = @"海底总动员";
    m11.image = @"11.jpg";
    m11.cover = @"c11.jpg";
    [array addObject:m11];

    FilmModel* m12 = [[FilmModel alloc] init];
    m12.name = @"忍者神龟2";
    m12.image = @"12.jpg";
    m12.cover = @"c12.jpg";
    [array addObject:m12];
    
    
    FilmModel* m13 = [[FilmModel alloc] init];
    m13.name = @"盗墓笔记";
    m13.image = @"13.jpg";
    m13.cover = @"c13.jpg";
    [array addObject:m13];
    
    
    FilmModel* m14 = [[FilmModel alloc] init];
    m14.name = @"我最好朋友的婚礼";
    m14.image = @"14.jpg";
    m14.cover = @"c14.jpg";
    [array addObject:m14];
    
    FilmModel* m15 = [[FilmModel alloc] init];
    m15.name = @"记忆碎片";
    m15.image = @"15.jpg";
    m15.cover = @"c15.jpg";
    [array addObject:m15];
    return array;
}
@end
