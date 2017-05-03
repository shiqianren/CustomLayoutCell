//
//  CalculateCell.h
//  AnimationCellHeight
//
//  Created by shiqianren on 2017/5/2.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculateModel.h"
@interface CalculateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ShowImageView;
@property(strong,nonatomic) CalculateModel *model;

@end
