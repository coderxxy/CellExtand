//
//  XXYCommonUIUtil.m
//  DXCareProject
//
//  Created by Jason_Xu on 2017/6/23.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "XXYCommonUIUtil.h"

#define kXXYSubViewsToolLoginToolTFPlaceHolder   (@"#019cda")

@implementation XXYCommonUIUtil
//
+ (void)autmicDismisAlertWithTitle:(NSString *)title
                       withMessage:(NSString *)message
                            onView:(id)view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [view presentViewController:alert animated:YES completion:nil];
    //自动消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alert dismissViewControllerAnimated:YES completion:^{
            
        }];
    });
}
//
+ (void)autmicDismisAlertWithTitle:(NSString *)title
                       withMessage:(NSString *)message
                          withTime:(CGFloat)time
                            onView:(id)view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [view presentViewController:alert animated:YES completion:nil];
    //自动消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}
//
+ (void)noautmicDismisAlertWithTitle:(NSString *)title
                         withMessage:(NSString *)message
                              onView:(id)view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [view presentViewController:alert animated:YES completion:nil];
}
//
+ (void)noautmicDismisAlertWithTitle:(NSString *)title
                         withMessage:(NSString *)message
                         eventAction:(ActionBlock)event
                              onView:(id)view{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (event) {
            event();
        }
    }]];
    
    [view presentViewController:alert animated:YES completion:nil];
}
//
+ (void)actionAlertWithTitle:(NSString *)title
                 withMessage:(NSString *)message
                 eventAction:(ActionBlock)event
                      onView:(id)view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (event) {
            event();
        }
    }]];
    
    //
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [view presentViewController:alert animated:YES completion:nil];
}
/**
 *  Description
 */
+ (void)actionAlertSheetWithTitle:(NSString *)title
                      withMessage:(NSString *)message
                     eventNameOne:(NSString *)oneTitle
                     eventNameTwo:(NSString *)twoTitle
                  takePhotoAction:(ActionBlock)cameraImge
                       chosoPhoto:(ActionBlock)chose
                           onView:(id)view{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:oneTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
        if (cameraImge) {
            cameraImge();
        }
        
        
    }]];
    
    //
    [alert addAction:[UIAlertAction actionWithTitle:twoTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (chose) {
            chose();
        }
    }]];
    //
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    
    [view presentViewController:alert animated:YES completion:nil];
}

+ (UIImageView *)xxyLoginImageViewToolWithImage:(UIImage *)image{
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = image;
    return iconImageView;
}

+ (UITextField *)xxyLoginTextFieldToolWithPlaceholder:(NSString *)placeholder
                                                 text:(NSString *)tfText{
    UITextField *tf = [[UITextField alloc] init];
    //tf.clearButtonMode = UITextFieldViewModeUnlessEditing;
    tf.placeholder = placeholder;
    tf.textColor = [UIColor blackColor];
    tf.text = tfText;
    tf.font = [UIFont systemFontOfSize:15.0f weight:.5f];
    tf.keyboardType = UIKeyboardTypeDefault;
    tf.borderStyle = UITextBorderStyleNone;
    //tf.backgroundColor = [UIColor redColor];
    tf.exclusiveTouch = YES;
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置富文本对象的颜色
    attributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    //设置富文本对象的字体大小
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    // 设置UITextField的占位文字
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    //
    tf.layer.borderColor = [[UIColor clearColor] CGColor];
    tf.layer.borderWidth = 0;
    tf.tintColor = [UIColor lightGrayColor];
    
    return tf;
}
//
+ (UIButton *)xxyCommonButtonWithBackgroundColor:(UIColor *)color
                                           image:(UIImage *)image
                                          target:(id)target
                                       selAction:(SEL)selAction{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button setBackgroundColor:color];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    [button addTarget:target action:selAction forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            textColor:(UIColor *)textColor
                      backgroundColor:(UIColor *)backgroundColor
                               target:(id)target
                            selAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    //button.timeInterval = 1.5f;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    button.tintColor= textColor;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //[button sizeToFit];
    //button.layer.cornerRadius = 22;
    [button setTitleColor:textColor forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithHexString:kXXYSubViewsToolLoginToolTFPlaceHolder] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            textColor:(UIColor *)textColor
                      backgroundColor:(UIColor *)backgroundColor
                                image:(UIImage *)image
                               target:(id)target
                            selAction:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    //button.timeInterval = 1.5f;
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    [button setImage:image forState:UIControlStateNormal];
    //[button sizeToFit];
    button.layer.cornerRadius = 2;
    [button setTitleColor:textColor forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithHexString:kXXYSubViewsToolLoginToolTFPlaceHolder] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            titleFont:(CGFloat)font
                            textColor:(UIColor *)textColor
                      backgroundColor:(UIColor *)backgroundColor
                          normalImage:(UIImage *)normalImage
                        selectedImage:(UIImage *)selectedImage
                               target:(id)target
                            selAction:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    [button setBackgroundColor:backgroundColor];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            textColor:(UIColor *)textColor
                      backgroundColor:(UIColor *)backgroundColor
                          borderColor:(CGColorRef)borderColor
                          borderWidth:(CGFloat)borderWidth
                               target:(id)target
                            selAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    //button.timeInterval = 1.5f;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    button.layer.borderColor = borderColor;
    button.layer.borderWidth = borderWidth;
    //[button sizeToFit];
    button.layer.cornerRadius = 2;
    [button setTitleColor:textColor forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor colorWithHexString:kXXYSubViewsToolLoginToolTFPlaceHolder] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}
//
+ (UIView *)xxyLoginLineTool{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    return lineView;
}
//
+ (UIView *)xxyLineView{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:(240/255.0) green:(240/255.0) blue:(240/255.0) alpha:1.0];
    return lineView;
}
//
+ (UIView *)xxyCommonViewWithColor:(UIColor *)color{
    UIView *commonView = [[UIView alloc] init];
    commonView.backgroundColor = color;
    return commonView;
}

+ (UILabel *)xxyLabelWithBackgroundColor:(UIColor *)bgColor
                               textColor:(UIColor *)textColor
                                textFont:(CGFloat)textFont{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:textFont];
    return label;
}

+ (UILabel *)xxyLabelWithText:(NSString *)text
              BackgroundColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     textFont:(CGFloat)textFont{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:textFont];
    return label;
}

+ (UILabel *)xxyLabelWithText:(NSString *)text
              BackgroundColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     textFont:(CGFloat)textFont
                       weight:(CGFloat)weight{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:textFont weight:weight];
    return label;
}


//label自适应高度
+ (UILabel *)xxyGetAdaptiveLable:(CGRect)rect
                         AndText:(NSString *)contentStr
                      andIsTitle:(BOOL)isTitle{
    UILabel *contentLbl = [[UILabel alloc] initWithFrame:rect];
    contentLbl.numberOfLines = 0;
    contentLbl.text = contentStr;
    contentLbl.textAlignment = NSTextAlignmentCenter;
    if (isTitle) {
        contentLbl.font = [UIFont boldSystemFontOfSize:16.0];
    }else{
        contentLbl.font = [UIFont systemFontOfSize:14.0];
    }
    
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    NSMutableParagraphStyle *mParaStyle = [[NSMutableParagraphStyle alloc] init];
    mParaStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [mParaStyle setLineSpacing:3.0];
    [mAttrStr addAttribute:NSParagraphStyleAttributeName value:mParaStyle range:NSMakeRange(0,[contentStr length])];
    [contentLbl setAttributedText:mAttrStr];
    [contentLbl sizeToFit];
    
    return contentLbl;
}

+ (void)changePlacedHolderTextColorWithTF:(UITextField *)tf
                                    color:(UIColor *)color
                                     font:(CGFloat )fontValue{
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置富文本对象的颜色
    attributes[NSForegroundColorAttributeName] = color;
    //设置富文本对象的字体大小
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:fontValue];
    // 设置UITextField的占位文字
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:tf.placeholder attributes:attributes];
}


@end
