//
//  CaluatetableController.m
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "CaluatetableController.h"
#import "CalculateModel.h"
#import "CalculateCell.h"
#import "CellHeightCache.h"
#define CellIndentifier @"CalculateCell"
@interface CaluatetableController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *CaculateTableView;
@property (strong,nonatomic) NSArray *dataArray;
@property (nonatomic, strong) CalculateCell *prototypeCell;
@property (strong,nonatomic) CellHeightCache *cellCache;
@end

@implementation CaluatetableController

- (void)viewDidLoad {
    [super viewDidLoad];
	_cellCache = [[CellHeightCache alloc] init];
	self.CaculateTableView.delegate =self;
	self.CaculateTableView.dataSource = self;
	[self.CaculateTableView registerNib:[UINib nibWithNibName:@"CalculateCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIndentifier];
	self.CaculateTableView.estimatedRowHeight = 100;
	self.prototypeCell = [self.CaculateTableView dequeueReusableCellWithIdentifier:CellIndentifier];
	[self initialData];
    // Do any additional setup after loading the view.
}
#pragma mark Private Methods
- (void)initialData
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
	NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
	NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
	NSArray *array = [dic objectForKey:@"feed"];
	NSMutableArray *muArray = [NSMutableArray array];
	for (NSDictionary *dic in array) {
		CalculateModel *model = [[CalculateModel alloc] initWithDictionary:dic];
		[muArray addObject:model];
	}
	_dataArray = [NSArray arrayWithArray:muArray];
}

#pragma mark － TableView datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CalculateModel *model = model = [_dataArray objectAtIndex:indexPath.row];
	
	CGFloat height = [_cellCache heightForCalculateheightModel:model];
	if (height > 0) {
		NSLog(@"cache height");
		return height;
	} else {
		NSLog(@"calculate height");
	}
	CalculateCell *cell = self.prototypeCell;
	cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
	[self configureCell:cell atIndexPath:indexPath]; //必须先对Cell中的数据进行配置使动态计算时能够知道根据Cell内容计算出合适的高度
	
	/*------------------------------重点这里必须加上contentView的宽度约束不然计算出来的高度不准确-------------------------------------*/
	CGFloat contentViewWidth = CGRectGetWidth(self.CaculateTableView.bounds);
	NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:contentViewWidth];
	[cell.contentView addConstraint:widthFenceConstraint];
	// Auto layout engine does its math
	CGFloat fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
	[cell.contentView removeConstraint:widthFenceConstraint];
	/*-------------------------------End------------------------------------*/
	
	CGFloat cellHeight = fittingHeight + 2 * 1 / [UIScreen mainScreen].scale; //必须加上上下分割线的高度
	[_cellCache setHeight:cellHeight withCalculateheightModel:model];
	return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CalculateCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier forIndexPath:indexPath];
	[self configureCell:cell atIndexPath:indexPath];
	return cell;
}


#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Remove seperator inset
	if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
		[cell setSeparatorInset:UIEdgeInsetsZero];
	}
	
	// Prevent the cell from inheriting the Table View's margin settings
	if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
		[cell setPreservesSuperviewLayoutMargins:NO];
	}
	
	// Explictly set your cell's layout margins
	if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
		[cell setLayoutMargins:UIEdgeInsetsZero];
	}
}

#pragma mark Configure Cell Data
- (void)configureCell:(CalculateCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	cell.model = [_dataArray objectAtIndex:indexPath.row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
