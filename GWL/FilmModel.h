//
//  FilmModel.h
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmModel : NSObject
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSString* cover;
+(NSArray*)filmArray;
@end
