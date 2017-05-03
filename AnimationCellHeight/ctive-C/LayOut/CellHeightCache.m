//
//  CellHeightCache.m
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "CellHeightCache.h"
@interface CellHeightCache ()
@property (strong, nonatomic, readonly) NSCache *cache;

@end

@implementation CellHeightCache


#pragma mark - Init
- (instancetype)init
{
	self = [super init];
	if (self) {
		[self defaultConfigure];
	}
	return self;
}

- (void)defaultConfigure
{
	NSCache *cache = [NSCache new];
	cache.name = @"ZHCellHeightCalculator.cache";
	cache.countLimit = 200;
	_cache = cache;
}

#pragma mark - NSObject

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: cache=%@",
			[self class], self.cache];
}

#pragma mark - Publci Methods
- (void)clearCaches
{
	[self.cache removeAllObjects];
}


- (void)setHeight:(CGFloat)height withCalculateheightModel:(CalculateModel *)model
{
	NSAssert(model != nil, @"Cell Model can't  nil");
	NSAssert(height >= 0, @"cell height must greater than or equal to 0");
	
	[self.cache setObject:[NSNumber numberWithFloat:height] forKey:@(model.hash)];
}


- (CGFloat)heightForCalculateheightModel:(CalculateModel *)model
{
	NSNumber *cellHeightNumber = [self.cache objectForKey:@(model.hash)];
	if (cellHeightNumber) {
		return [cellHeightNumber floatValue];
	} else
		return -1;
}



@end
