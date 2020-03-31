//
//  YTYTools.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYTools.h"

@implementation YTYTools
+ (UITapGestureRecognizer *)obtainTapGestureRecognizerObjectWithAction:(nullable SEL)action withTarget:(nullable id)target {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tapGestureRecognizer.delegate = target;
    tapGestureRecognizer.cancelsTouchesInView = YES;
    return tapGestureRecognizer;
}

// 按钮添加下划线
+ (UIButton * _Nonnull)obtainButtonObjectWithString:(nullable NSString *)string forState:(UIControlState)state {
    UIButton *customBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    NSMutableAttributedString *str = [YTYTools obtainUnderlineWithString:string];
 /*
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    //线条颜色
//    [str addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:strRange];
// 设置部分颜色
    
    
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    style.lineSpacing = 2.5;
//    style.alignment = NSTextAlignmentCenter;
//    [str addAttribute:NSParagraphStyleAttributeName value:style range:strRange];
    
    
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.087 green:0.024 blue:0.023 alpha:1.000] range:rangeLeft];
//     [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1.000 green:0.288 blue:0.268 alpha:1.000] range:rangeCenter];
//     [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.043 green:0.431 blue:0.046 alpha:1.000] range:rangeRight];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, [str length])];
    */
    
    [customBtn setAttributedTitle:str forState:state];
    return customBtn;
}


// 下划线。。设置
+ (NSMutableAttributedString *)obtainUnderlineWithString:(nullable NSString *)string {
     NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
        NSRange strRange = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        //Underline 颜色
    //    [str addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:strRange];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, [str length])];
    return str;
}


+ (CAGradientLayer *)obtainGradientLayerWithFrame:(CGRect)frame {
    return [YTYTools obtainGradientLayerWithFrame:frame cornerRadius:0];
}



+ (CAGradientLayer *)obtainGradientLayerWithFrame:(CGRect)frame cornerRadius:(CGFloat)radius {
    return  [YTYTools  obtainGradientLayerWithFrame:frame cornerRadius:radius colors:@[(__bridge id)YTYRGB(60, 131, 194).CGColor,(__bridge id)YTYRGB(217, 125, 134).CGColor]];
}


+ (CAGradientLayer *)obtainGradientLayerWithFrame:(CGRect)frame cornerRadius:(CGFloat)radius  colors:(NSArray*)colors {
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;//self.builtInFrame;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);  //startPoint & endPoint设置为(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    gradientLayer.locations = @[@0,@1];
    gradientLayer.cornerRadius = radius;
    return gradientLayer;
}

@end
