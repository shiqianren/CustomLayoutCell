//
//  ViewController.m
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "ViewController.h"
#import "Cell1.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *OneTableView;
@property(strong,nonatomic) NSArray *stringData;
@property (nonatomic, strong) UITableViewCell *prototypeCell;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.stringData = @[@"从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的API systemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度。Cell的高度是在- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath这个UITableViewDelegate的方法里面传给UITableView的",@"从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的API systemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度。Cell的高度是在- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath这个UITableViewDelegate的方法里面传给UITableView的从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的API systemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度。Cell的高度是在- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath这个UITableViewDelegate的方法里面传给UITableView的",@"从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的API systemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度",@"从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的APIsystemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度。Cell的高度是在- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath这个UITableViewDelegate的方法里面传给UITableView的从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的API systemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度。Cell的高度是在- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath这个UITableViewDelegate的方法里面传给UITableView的从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的APIsystemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度。Cell的高度是在- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath这个UITableViewDelegate的方法里面传给UITableView的从self.tableData中的数据我们可以看到，每一个Cell显示的数据高度是不一样的，那么我们需要动态计算Cell的高度。由于是auto layout，所以我们需要用到一个新的API systemLayoutSizeFittingSize:来计算UITableViewCell所占空间高度。Cell的高度是在- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath这个UITableViewDelegate的方法里面传给UITableView的"];
	self.OneTableView.delegate = self;
	self.OneTableView.dataSource = self;
	
	UINib *cell1 = [UINib nibWithNibName:@"Cell1" bundle:nil];
	[self.OneTableView registerNib:cell1 forCellReuseIdentifier:@"Cell1"];
	self.prototypeCell  = [self.OneTableView dequeueReusableCellWithIdentifier:@"Cell1"];
	// Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
	return self.stringData.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	Cell1 *cell = [self.OneTableView dequeueReusableCellWithIdentifier:@"Cell1"];
	cell.Label.text=self.stringData[indexPath.row];
	
	return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	Cell1 *cell = (Cell1*)self.prototypeCell;
	cell.Label.text =self.stringData[indexPath.row];
	CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"h=%f", size.height + 1);
	return 1+ size.height;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
