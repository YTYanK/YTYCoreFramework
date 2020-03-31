//
//  NSString+Extension.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


///// 数字验证
//- (BOOL)isNumber;
///// 香港手机号验证
//- (BOOL)isPhoneHongKongNumber;
///// 电子邮箱格式验证
//- (BOOL)isEmailFormat;
//
//
///**
//  获取日期 判断 星期
//  @param dateStr  日期字符串
// */
//+ (NSString *)whichWeek:(NSString *)dateStr;

// 数字判断
- (BOOL)isNumber {
    if (self.length == 0)
        return NO;
    NSString *regex = @"^[0-9]+([.]{0,1}[0-9]+){0,1}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}
// 香港手机号判断
- (BOOL)isPhoneHongKongNumber {
    if (self.length == 0)
        return NO;
    NSString *regex = @"^[69]\\d{7}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}
// 电子邮箱格式验证
- (BOOL)isEmailFormat {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate*emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

// 星期判断
+ (NSString *)whichWeek:(NSString *)dateStr {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* inputDate = [inputFormatter dateFromString:dateStr];
    
    NSDateComponents *dateComps = [calendar components:NSCalendarUnitWeekday fromDate:inputDate];
    
    NSInteger weekDay = dateComps.weekday;
    
    switch (weekDay) {
        case 1:
            return @"星期日";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            return @"";
            break;
    }
}


@end
