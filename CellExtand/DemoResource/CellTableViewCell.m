//
//  CellTableViewCell.m
//  CellExtand
//
//  Created by 花达 on 2018/4/12.
//  Copyright © 2018年 HangZhouShenMangtTechnologyInformation. All rights reserved.
//

#import "CellTableViewCell.h"
#import "XXYCommonUIUtil.h"
#import "Masonry.h"



@implementation CellTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier  indexPath:(NSIndexPath *)indexPath{
    self = [super init];
    if (self) {
        _indexPath = indexPath;
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews{
    //
    self.iconPurPleView = [XXYCommonUIUtil xxyCommonViewWithColor:kXXYMainColor];
    self.iconPurPleView.layer.cornerRadius = 6 * KRatio;
    self.iconPurPleView.clipsToBounds = YES;
    [self.contentView addSubview:self.iconPurPleView];
    //
    self.titleLabel = [XXYCommonUIUtil xxyLabelWithBackgroundColor:kXXYGeneralColor_WhiteColor textColor:[UIColor blackColor] textFont:20];
    [self.contentView addSubview:self.titleLabel];
    //
    self.extendButton = [XXYCommonUIUtil xxyCommonButtonWithBackgroundColor:[UIColor clearColor] image:kXXYGetImage(@"weixuan") target:self selAction:@selector(clickButtonHandleWithSender:)];
    self.extendButton.selected = NO;
    [self.contentView addSubview:self.extendButton];
    //
    self.lineView = [XXYCommonUIUtil xxyLineView];
    [self.contentView addSubview:self.lineView];
    //
    self.messageLabel = [XXYCommonUIUtil xxyLabelWithBackgroundColor:kXXYGeneralColor_WhiteColor textColor:[UIColor lightGrayColor] textFont:17];
    self.messageLabel.numberOfLines = 0;
    [self.contentView addSubview:self.messageLabel];
    //
    [self setUpLayoutSubviews];
}
//click action
- (void)clickButtonHandleWithSender:(id)sender{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(xxy_cellTableViewCellDelegateActionWithSender:indexPath:)]) {
        [self.delegate xxy_cellTableViewCellDelegateActionWithSender:sender indexPath:self.indexPath];
    }
}
//layout
- (void)setUpLayoutSubviews{
    WeakSelf(self)
    [self.iconPurPleView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.centerY.mas_equalTo(weak_Self.contentView.mas_centerY);
        make.top.mas_equalTo(weak_Self.contentView.mas_top).offset(30 * KRatio);
        make.left.mas_equalTo(weak_Self.contentView.mas_left).offset(20 * KRatio);
        make.size.mas_equalTo(CGSizeMake(12 * KRatio, 12 * KRatio));
    }];
    
    //
    [self.extendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weak_Self.iconPurPleView);
        make.right.mas_equalTo(weak_Self.contentView.mas_right).offset(-20 * KRatio);
        make.size.mas_equalTo(CGSizeMake(40 * KRatio, 40 * KRatio));
    }];
    //
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weak_Self.iconPurPleView);
        make.left.mas_equalTo(weak_Self.iconPurPleView.mas_right).offset(10 * KRatio);
        make.right.mas_equalTo(weak_Self.extendButton.mas_left);
    }];
    //
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_Self.titleLabel.mas_bottom).offset(10 * KRatio);
        make.bottom.mas_equalTo(weak_Self.contentView.mas_bottom).offset(-30 * KRatio);
        make.left.equalTo(weak_Self.iconPurPleView.mas_left);
        make.right.equalTo(weak_Self.extendButton.mas_right);
    }];
    
    //
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weak_Self.contentView.mas_bottom).offset(0);
        make.left.equalTo(weak_Self.iconPurPleView.mas_left);
        make.right.mas_equalTo(weak_Self.extendButton.mas_right);
        make.height.mas_equalTo(.5);
    }];
    
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
