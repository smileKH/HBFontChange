//
//  HBTableCell.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBTableCell.h"

@implementation HBTableCell
{
    UILabel         *_titleLabel;
    UILabel         *_contentLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"我的信念";
    titleLabel.font = Font(USERDEFAULT_float(TITLE_FONT));
    _titleLabel = titleLabel;
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.text = @"我现在没有，但经过努力，不代表我以后没有！";
    contentLabel.font = Font(USERDEFAULT_float(CONTENT_FONT));
    _contentLabel = contentLabel;
    
    [self.contentView sd_addSubviews:@[titleLabel,contentLabel]];
    
    _titleLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .autoHeightRatio(0)
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView,10);
    
    _contentLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .autoHeightRatio(0)
    .topSpaceToView(_titleLabel,5)
    .leftSpaceToView(self.contentView,10);
    
    [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:10];
    
}

- (void)setTitleString:(NSString *)titleString{

    _titleString = titleString;
    
    _titleLabel.text = titleString;
}

@end
