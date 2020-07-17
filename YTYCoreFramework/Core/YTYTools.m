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


// 设置下划线
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

// 返回一个NavButtonItem
+ (UIBarButtonItem *)obtainBackItemWithTarget:(nullable id)target action:(nullable SEL)action image:(UIImage *)image {
        // 自定义View
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =CGRectMake(-45, 0, 45, 45);
        button.imageEdgeInsets =  UIEdgeInsetsMake(0, 0, 0, 20);
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [YTYTools obtainItemWithCustomView:button];
}

+ (UIBarButtonItem *)obtainItemWithCustomView:(UIView *)customView {
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
      return backButtonItem;
}

//将数组拆分成固定长度 -后面抽离
+ (NSMutableArray *)splitArray: (NSArray *)array withSubSize : (int)subSize{
//  数组将被拆分成指定长度数组的个数
  unsigned long count = array.count % subSize == 0 ? (array.count / subSize) : (array.count / subSize + 1);
//  用来保存指定长度数组的可变数组对象
  NSMutableArray *arr = [[NSMutableArray alloc] init];
  
//利用总个数进行循环，将指定长度的元素加入数组
  for (int i = 0; i < count; i ++) {
    //数组下标
    int index = i * subSize;
    //保存拆分的固定长度的数组元素的可变数组
    NSMutableArray *arr1 = [[NSMutableArray alloc] init];
    //移除子数组的所有元素
    [arr1 removeAllObjects];
    
    int j = index;
    //将数组下标乘以1、2、3，得到拆分时数组的最大下标值，但最大不能超过数组的总大小
    while (j < subSize*(i + 1) && j < array.count) {
      [arr1 addObject:[array objectAtIndex:j]];
      j += 1;
    }
    //将子数组添加到保存子数组的数组中
    [arr addObject:[arr1 copy]];
  }
  
  return [arr copy];
}





+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
