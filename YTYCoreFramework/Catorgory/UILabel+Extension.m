//
//  UILabel+Extension.m
//  zhengtang_baby
//
//  Created by POP3mac on 2019/9/19.
//  Copyright © 2019 YTYanK. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

// 设置可变样式 - 颜色设置
- (void)addAttributedString:(NSString *)string stringColor:(UIColor *)color  {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    // 设置部分颜色
    [str addAttribute:NSForegroundColorAttributeName value:color range:strRange];
    //    [self.modifyBut setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self setAttributedText:str];
}

/// 設置文字間距
- (void)setText:(NSString *)text spacing:(CGFloat)spacing {
    // 設置文字間距原理是在每一個字符串後面添加一個空白的間距,這樣會使得居中出現問題
    // text = [NSString stringWithFormat:@" %@",text]; 錯誤方式,就算空白字符串,也會佔用寬度,居中有偏差
    // 正確解決辦法就是在xib中設置居中偏移量為 + spacing/2.0
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSKernAttributeName:@(spacing)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:self.textAlignment];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length]-1)];
    self.attributedText = attributedString;
    [self sizeToFit];
}

/// 设置行间距
- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing {
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}

- (void)setRangeOfString:(NSString *)ofStr lineSpacing:(CGFloat)lineSpacing  firstFont:(UIFont *)first tailFont:(UIFont *)tail {
    [self setRangeOfString:ofStr lineSpacing:lineSpacing firstFont:first firstColor:UIColor.blackColor tailFont:tail tailColor:UIColor.blackColor];
}

- (void)setRangeOfString:(NSString *)ofStr lineSpacing:(CGFloat)lineSpacing  firstFont:(UIFont *)first tailFont:(UIFont *)tail tailColor:(UIColor *)color {
    [self setRangeOfString:ofStr lineSpacing:lineSpacing firstFont:first firstColor:UIColor.blackColor tailFont:tail tailColor:color];
}

- (void)setRangeOfString:(NSString *)ofStr lineSpacing:(CGFloat)lineSpacing  firstFont:(UIFont *)first firstColor:(UIColor *)firstColor tailFont:(UIFont *)tail  tailColor:(UIColor *)tailColor {
     // NSString *str = @"產品類型\n紙杯";
      NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSRange range  = {0,0};
    if ([ofStr isEqualToString:@""]) {
        range = NSMakeRange(0, [self.text length]);
    }else {
        range = [self.text rangeOfString:ofStr];
    }
       
      NSRange typeRange = {0,range.location};
      [mutStr addAttribute:NSFontAttributeName value:first range:typeRange];
      [mutStr addAttribute:NSFontAttributeName value:tail range:NSMakeRange(range.location, [self.text length] - range.location)];
    [mutStr addAttribute:NSForegroundColorAttributeName value:firstColor range:typeRange];
    [mutStr addAttribute:NSForegroundColorAttributeName value:tailColor range:NSMakeRange(range.location, [self.text length] - range.location)];
    
    
      NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
      [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
      [paragraphStyle setLineBreakMode:self.lineBreakMode];
      [paragraphStyle setAlignment:self.textAlignment];
      
      [mutStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
      self.attributedText = mutStr;
}


- (void)setMutableAttributes:(nonnull NSDictionary<NSAttributedStringKey,id> *)attriuted {
    NSMutableAttributedString * mutStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [mutStr addAttributes:attriuted range:NSMakeRange(0, [self.text  length])];
    self.attributedText = mutStr;
      
}




@end
