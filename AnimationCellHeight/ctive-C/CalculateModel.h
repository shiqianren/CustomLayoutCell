//
//  CalculateModel.h
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *imageName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
