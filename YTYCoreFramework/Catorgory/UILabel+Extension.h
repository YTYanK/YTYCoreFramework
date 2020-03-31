//
//  UILabel+Extension.h
//  zhengtang_baby
//
//  Created by POP3mac on 2019/9/19.
//  Copyright © 2019 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Extension)
- (void)addAttributedString:(NSString *)string stringColor:(UIColor *)color;

/// 设置行间距
- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;
/// 設置文字間距
- (void)setText:(NSString *)text spacing:(CGFloat)spacing;
/**
  设置字体、设置间距、设置字体
    @param ofStr  分割依据字符
    @param lineSpacing 行距
    @param first 前半字体
    @param tail   后半字体
 */
- (void)setRangeOfString:(NSString *)ofStr lineSpacing:(CGFloat)lineSpacing  firstFont:(UIFont *)first tailFont:(UIFont *)tail;
- (void)setRangeOfString:(NSString *)ofStr lineSpacing:(CGFloat)lineSpacing  firstFont:(UIFont *)first tailFont:(UIFont *)tail tailColor:(UIColor *)color;
- (void)setRangeOfString:(NSString *)ofStr lineSpacing:(CGFloat)lineSpacing  firstFont:(UIFont *)first firstColor:(UIColor *)firstColor tailFont:(UIFont *)tail  tailColor:(UIColor *)tailColor;
@end

NS_ASSUME_NONNULL_END
