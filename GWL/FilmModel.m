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
    m1.name = @"Speed 7";
    m1.image = @"1.jpg";
    [array addObject:m1];
    
    FilmModel* m2 = [[FilmModel alloc] init];
    m2.name = @"Hobbit";
    m2.image = @"2.jpg";
    [array addObject:m2];

    
    FilmModel* m3 = [[FilmModel alloc] init];
    m3.name = @"纯纯欲动";
    m3.image = @"3.jpg";
    [array addObject:m3];

    FilmModel* m4 = [[FilmModel alloc] init];
    m4.name = @"Zootopia";
    m4.image = @"4.jpg";
    [array addObject:m4];

    FilmModel* m5 = [[FilmModel alloc] init];
    m5.name = @"Captain America";
    m5.image = @"5.jpg";
    [array addObject:m5];
    
    
    FilmModel* m6 = [[FilmModel alloc] init];
    m6.name = @"The Walking Dead";
    m6.image = @"6.jpg";
    [array addObject:m6];


    FilmModel* m7 = [[FilmModel alloc] init];
    m7.name = @"AK 47";
    m7.image = @"7.jpg";
    [array addObject:m7];
    
    FilmModel* m8 = [[FilmModel alloc] init];
    m8.name = @"Korea";
    m8.image = @"8.jpg";
    [array addObject:m8];
    
    
    FilmModel* m9 = [[FilmModel alloc] init];
    m9.name = @"Bella Bestia";
    m9.image = @"9.jpg";
    [array addObject:m9];
    
    FilmModel* m10 = [[FilmModel alloc] init];
    m10.name = @"星际迷航";
    m10.image = @"10.jpg";
    [array addObject:m10];
    
    FilmModel* m11 = [[FilmModel alloc] init];
    m11.name = @"迷城";
    m11.image = @"11.jpg";
    [array addObject:m11];

    FilmModel* m12 = [[FilmModel alloc] init];
    m12.name = @"赤壁";
    m12.image = @"12.jpg";
    [array addObject:m12];
    
    return array;
}
@end
