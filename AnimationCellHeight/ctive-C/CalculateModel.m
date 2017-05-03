//
//  CalculateModel.m
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "CalculateModel.h"

@implementation CalculateModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if (self) {
		_title = dictionary[@"title"];
		_content = dictionary[@"content"];
		_username = dictionary[@"username"];
		_time = dictionary[@"time"];
		_imageName = dictionary[@"imageName"];
	}
	return self;
}
@end
