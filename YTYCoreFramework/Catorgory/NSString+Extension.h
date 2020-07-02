//
//  NSString+Extension.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface NSString (Extension)


///MARK: - 正则判断部分
/// 数字验证
- (BOOL)isNumber;
/// 简单-手机号码格式验证
- (BOOL)isMobilePhoneNum;
/// 严格- 手机号码格式验证
- (BOOL)isTelphoneNumber;
/// 香港手机号验证
- (BOOL)isPhoneHongKongNumber;
/// 电子邮箱格式验证
- (BOOL)isEmailFormat;



///MARK: - 字符串判断部分
/**
  获取日期 判断 星期
  @param dateStr  日期字符串
 */
+ (NSString *)whichWeek:(NSString *)dateStr;

@end

