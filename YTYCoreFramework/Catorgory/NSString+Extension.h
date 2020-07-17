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
/// 判断字符串中是否包含非法字符
- (BOOL)isHasIllegal;
///  是否为空或者是空格
- (BOOL)isEmpty;

///MARK: - 字符串判断部分
/**
  获取日期 判断 星期
  @param dateStr  日期字符串
 */
+ (NSString *)whichWeek:(NSString *)dateStr;

///MARK: - 字符串功能部分

/**
 計算字符串高度
 @param font  字符串字体
 @param size 范围大小
 @param content 内容
 @return 宽高
*/
+ (CGSize)calculateStringHeightWithFont:(UIFont *)font TextRect:(CGSize)size  string:(NSString *)content;

/**
 字典或数组 转字符串json
 @param obj  字典对象或数组对象 - 其他对象转换结果为“”
*/
+ (NSString *)calculateJsonStringFromObject:(id)obj;
/**
 字符串json 转 字典或数组
 @param JSONString  json 字符串
*/
+ (id)parseJSONStringToNSDictionary:(NSString *)JSONString;
@end

