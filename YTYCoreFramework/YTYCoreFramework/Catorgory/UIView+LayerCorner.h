//
//  UIView+LayerCorner.h
//  DCAMP
//
//  Created by Kyo on 2018/1/17.
//  Copyright © 2018年 easyder. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (LayerCorner)


/// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen;

///---------------------
/// @name set Border
///---------------------

/**
给View对象添加边框
@param cornerRadius 圆角
@param borderWidth 边框宽度
@param borderColor 边框颜色
*/
- (void)setViewBorderCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 给View对象添加边框 、 圆角
 @param corners  需要设置的边框线，
 @param cornerRadii 设置绘画边框的圆角大小
 */
- (void)setCornerBorderByRoundingCorners:(UIRectCorner)corners  cornerRadii:(CGSize)cornerRadii;


@end
