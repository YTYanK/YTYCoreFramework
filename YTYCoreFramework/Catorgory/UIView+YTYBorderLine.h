//
//  UIView+YTYBorderLine.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/9.
//  Copyright © 2020 YTYanK. All rights reserved.
//

//#import <AppKit/AppKit.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, YTYBorderSideType) {
    YTYBorderSideTypeAll  = 0,
    YTYBorderSideTypeTop = 1 << 0,
    YTYBorderSideTypeBottom = 1 << 1,
    YTYBorderSideTypeLeft = 1 << 2,
    YTYBorderSideTypeRight = 1 << 3,
};


NS_ASSUME_NONNULL_BEGIN

/** 边框  */
@interface UIView (YTYBorderLine)


/**
   设置view指定位置的边框
@param color          边框颜色
@param borderWidth    边框宽度
@param borderType     边框类型 例子: UIBorderSideTypeTop|UIBorderSideTypeBottom
@return  view
*/
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(YTYBorderSideType)borderType;

/**
   设置view指定位置的边框
@param color          边框颜色
@param borderEdge    每个边框大小值
@param borderType     边框类型 例子: UIBorderSideTypeTop|UIBorderSideTypeBottom
@return  view
*/
- (UIView *)borderForColor:(UIColor *)color border:(UIEdgeInsets)borderEdge borderType:(YTYBorderSideType)borderType;
/**
设置view指定位置的边框

@param originalView   原view
@param color          边框颜色
@param borderWidth    边框宽度
@param borderType     边框类型 例子: UIBorderSideTypeTop|UIBorderSideTypeBottom
@return  view
*/
- (UIView *)borderForView:(UIView *)originalView color:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(YTYBorderSideType)borderType;
@end

NS_ASSUME_NONNULL_END
