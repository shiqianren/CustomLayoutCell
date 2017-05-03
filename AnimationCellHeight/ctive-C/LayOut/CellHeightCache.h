//
//  CellHeightCache.h
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CalculateModel.h"
@interface CellHeightCache : NSObject
//系统计算高度后缓存进cache
- (void)setHeight:(CGFloat)height withCalculateheightModel:(CalculateModel *)model;

//根据model hash 获取cache中的高度,如过无则返回－1
- (CGFloat)heightForCalculateheightModel:(CalculateModel *)model;

//清空cache
- (void)clearCaches;
@end
