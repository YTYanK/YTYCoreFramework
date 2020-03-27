//
//  UIButton+Extension.h
//  QiChang
//
//  Created by POP3mac on 2020/2/28.
//  Copyright © 2020 YTYanK. All rights reserved.
//

//#import <AppKit/AppKit.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extension)
/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;

- (void)startWithTime:(NSInteger )timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle titleColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
