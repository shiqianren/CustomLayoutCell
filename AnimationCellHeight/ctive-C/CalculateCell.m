//
//  CalculateCell.m
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "CalculateCell.h"

@implementation CalculateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(CalculateModel *)model{
	_model = model;
	self.TitleLabel.text = model.title;
	self.ContentLabel.text = model.content;
	self.ShowImageView.image = model.imageName.length> 0 ?[UIImage imageNamed:model.imageName]:nil;
	self.TitleLabel.text = model.time;
	
}
@end
