//
//  mTableViewCell.m
//  cellViewTest
//
//  Created by 王蕾 on 2016/11/17.
//  Copyright © 2016年 王蕾. All rights reserved.
//

#import "mTableViewCell.h"

@implementation mTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)loadContent{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [NSThread sleepForTimeInterval:2.0f];
//        self.contentView.backgroundColor = [UIColor yellowColor];
        //通知主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            //回调或者说是通知主线程刷新，
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            view.backgroundColor = [UIColor blueColor];
            [self.contentView addSubview:view];
        });
    });
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
