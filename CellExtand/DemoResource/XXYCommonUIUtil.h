//
//  XXYCommonUIUtil.h
//  DXCareProject
//
//  Created by Jason_Xu on 2017/6/23.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(void);

@interface XXYCommonUIUtil : NSObject
/**
 自动消失 不自定义消失时间
 
 @param title 标题
 @param message <#message description#>
 @param view <#view description#>
 */
+ (void)autmicDismisAlertWithTitle:(NSString *)title
                       withMessage:(NSString *)message
                            onView:(id)view;
/**
 自动消失 时间自定
 
 @param title <#title description#>
 @param message <#message description#>
 @param time <#time description#>
 @param view <#view description#>
 */
+ (void)autmicDismisAlertWithTitle:(NSString *)title
                       withMessage:(NSString *)message
                          withTime:(CGFloat)time
                            onView:(id)view;

/**
 确定自动消失
 
 @param title <#title description#>
 @param message <#message description#>
 @param view <#view description#>
 */
+ (void)noautmicDismisAlertWithTitle:(NSString *)title
                         withMessage:(NSString *)message
                              onView:(id)view;
/**
 点击确定 消失
 
 @param title <#title description#>
 @param message <#message description#>
 @param event <#event description#>
 @param view <#view description#>
 */
+ (void)noautmicDismisAlertWithTitle:(NSString *)title
                         withMessage:(NSString *)message
                         eventAction:(ActionBlock)event
                              onView:(id)view;

/**
 点击确定 发生事件  点击取消 返回
 
 @param title <#title description#>
 @param message <#message description#>
 @param event <#event description#>
 @param view <#view description#>
 */
+ (void)actionAlertWithTitle:(NSString *)title
                 withMessage:(NSString *)message
                 eventAction:(ActionBlock)event
                      onView:(id)view;

/**
 AlertSheet
 
 @param titleOne <#titleOne description#>
 @param message <#message description#>
 @param oneTitle <#oneTitle description#>
 @param twoTitle <#twoTitle description#>
 @param cameraImge <#cameraImge description#>
 @param chose <#chose description#>
 @param view <#view description#>
 */
+ (void)actionAlertSheetWithTitle:(NSString *)titleOne
                      withMessage:(NSString *)message
                     eventNameOne:(NSString *)oneTitle
                     eventNameTwo:(NSString *)twoTitle
                  takePhotoAction:(ActionBlock)cameraImge
                       chosoPhoto:(ActionBlock)chose
                           onView:(id)view;

/**
 *  界面图标imageview
 *
 *  @param image image
 *
 *  @return imageview
 */
+ (UIImageView *)xxyLoginImageViewToolWithImage:(UIImage *)image;

/**
 输入框

 @param placeholder 占位字
 @param tfText <#tfText description#>
 @return <#return value description#>
 */
+ (UITextField *)xxyLoginTextFieldToolWithPlaceholder:(NSString *)placeholder
                                                 text:(NSString *)tfText;

/**
 *  获取短信验证码按钮
 *
 *  @param title           获取验证码标题
 *  @param textColor       字体颜色
 *  @param backgroundColor 背景色
 *
 *  @return button
 */
+(UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                           textColor:(UIColor *)textColor
                     backgroundColor:(UIColor *)backgroundColor
                              target:(id)target
                           selAction:(SEL)action;

/**
 可设置正常、选中状态背景图

 @param title 标题
 @param font 字体大小
 @param textColor 自体颜色
 @param backgroundColor 背景色
 @param normalImage 正常状态背景图
 @param selectedImage 选中状态背景图
 @param target <#target description#>
 @param action <#action description#>
 @return <#return value description#>
 */
+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            titleFont:(CGFloat)font
                            textColor:(UIColor *)textColor
                      backgroundColor:(UIColor *)backgroundColor
                          normalImage:(UIImage *)normalImage
                        selectedImage:(UIImage *)selectedImage
                               target:(id)target
                            selAction:(SEL)action;
/**
 *  可设置边框 button
 *
 *  @param title           标题
 *  @param textColor       前景色
 *  @param backgroundColor 背景色
 *  @param borderColor     边框颜色
 *  @param borderWidth     边框宽度
 *  @param target          事件对象
 *  @param action          事件
 *
 *  @return <#return value description#>
 */
+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            textColor:(UIColor *)textColor
                      backgroundColor:(UIColor *)backgroundColor
                          borderColor:(CGColorRef)borderColor
                          borderWidth:(CGFloat)borderWidth
                               target:(id)target
                            selAction:(SEL)action;

/**
 普通button
 
 @param title 标题
 @param textColor 字体颜色
 @param backgroundColor 背景色
 @param image 图片
 @param target self
 @param action 事件
 @return <#return value description#>
 */
+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            textColor:(UIColor *)textColor
                      backgroundColor:(UIColor *)backgroundColor
                                image:(UIImage *)image
                               target:(id)target
                            selAction:(SEL)action;


/**
 普通button 只带事件

 @param color <#color description#>
 @param image <#image description#>
 @param target <#target description#>
 @param selAction <#selAction description#>
 @return <#return value description#>
 */
+ (UIButton *)xxyCommonButtonWithBackgroundColor:(UIColor *)color
                                           image:(UIImage *)image
                                          target:(id)target
                                       selAction:(SEL)selAction;
/**
 *  分界线
 *
 *  @return linview
 */
+ (UIView *)xxyLoginLineTool;


/**
 分割线

 @return <#return value description#>
 */
+ (UIView *)xxyLineView;

/**
 自定义view

 @param color <#color description#>
 @return <#return value description#>
 */
+ (UIView *)xxyCommonViewWithColor:(UIColor *)color;

/**
 *  显示label 不带标题参数
 *
 *  @param bgColor   背景色
 *  @param textColor 字体颜色
 *  @param textFont  字体大小
 *
 *  @return <#return value description#>
 */
+ (UILabel *)xxyLabelWithBackgroundColor:(UIColor *)bgColor
                               textColor:(UIColor *)textColor
                                textFont:(CGFloat)textFont;
/**
 *  显示label 带标题参数
 *
 *  @param text      标题
 *  @param bgColor   背景色
 *  @param textColor 字体颜色
 *  @param textFont  字体大小
 *
 *  @return <#return value description#>
 */
+ (UILabel *)xxyLabelWithText:(NSString *)text
              BackgroundColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     textFont:(CGFloat)textFont;

/**
 显示label 带标题参数 可设置字体粗细
 
 @param text <#text description#>
 @param bgColor <#bgColor description#>
 @param textColor <#textColor description#>
 @param textFont <#textFont description#>
 @param weight <#weight description#>
 @return <#return value description#>
 */
+ (UILabel *)xxyLabelWithText:(NSString *)text
              BackgroundColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     textFont:(CGFloat)textFont
                       weight:(CGFloat)weight;

/**
 label自适应高度
 
 @param rect <#rect description#>
 @param contentStr <#contentStr description#>
 @param isTitle <#isTitle description#>
 @return <#return value description#>
 */
+ (UILabel *)xxyGetAdaptiveLable:(CGRect)rect
                         AndText:(NSString *)contentStr
                      andIsTitle:(BOOL)isTitle;

/**
 改变占位符颜色
 
 @param tf <#tf description#>
 @param color <#color description#>
 @param fontValue <#fontValue description#>
 */
+ (void)changePlacedHolderTextColorWithTF:(UITextField *)tf
                                    color:(UIColor *)color
                                     font:(CGFloat )fontValue;

@end
