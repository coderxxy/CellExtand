//
//  CellTableViewCell.h
//  CellExtand
//
//  Created by 花达 on 2018/4/12.
//  Copyright © 2018年 HangZhouShenMangtTechnologyInformation. All rights reserved.
//

#import <UIKit/UIKit.h>

//屏幕尺寸
#define kMainScreenW        [UIScreen mainScreen].bounds.size.width
#define kMainScreenH        [UIScreen mainScreen].bounds.size.height
#define kMainScreenBounds   [UIScreen mainScreen].bounds
#define kIphone6ScreenHeight    667.0f
#define kIphone6ScreenWidth     375.0f
#define KRatio              (kMainScreenW / kIphone6ScreenWidth)
#define kXXYGeneralColor_WhiteColor                 [UIColor whiteColor]
// RGB
#define kXXYColor(r, g, b, al) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:al]
#define kXXYMainColor           kXXYColor(102, 101, 218, 1.0)
#define WeakSelf(weakSelf)  __weak __typeof(self) weak_Self = weakSelf;
//获取image
#define kXXYGetImage(imageName)     [UIImage imageNamed:imageName]

@protocol CellTableViewCellDelegate <NSObject>

- (void)xxy_cellTableViewCellDelegateActionWithSender:(UIButton *)sender
                                                       indexPath:(NSIndexPath *)indexPath;

@end

@interface CellTableViewCell : UITableViewCell

/**
 蓝点
 */
@property (nonatomic, strong) UIView *iconPurPleView;

/**
 title label
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 button
 */
@property (nonatomic, strong) UIButton *extendButton;

/**
 message
 */
@property (nonatomic, strong) UILabel *messageLabel;

/**
 line
 */
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSIndexPath *indexPath;


/**
 声明代理
 */
@property (nonatomic, weak) id <CellTableViewCellDelegate>delegate;

/**
 instance
 
 @param reuseIdentifier <#reuseIdentifier description#>
 @param indexPath <#indexPath description#>
 @return <#return value description#>
 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier  indexPath:(NSIndexPath *)indexPath;

@end
