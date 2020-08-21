//
//  NSString+Extension.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


// 数字判断
- (BOOL)isNumber {
    if (self.length == 0)
        return NO;
    NSString *regex = @"^[0-9]+([.]{0,1}[0-9]+){0,1}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}

// 简单-手机号码格式验证
- (BOOL)isMobilePhoneNum {
    if (self.length == 0)
        return NO;
    
    NSString *regex = @"^(13[0-9]|14[5-9]|15[0-3,5-9]|16[2,5,6,7]|17[0-8]|18[0-9]|19[0-3,5-9])\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}


// 严格- 手机号码格式验证
- (BOOL)isTelphoneNumber {
    
    NSString * telNum = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([telNum length] != 11) {  // 长度判断
        return NO;
    }
    
    /**
     * 中国移动：China Mobile
     *13[4-9],147,148,15[0-2,7-9],165,170[3,5,6],172,178,18[2-4,7-8],19[5,7,8]
     */
    NSString *CM_NUM = @"^((13[4-9])|(14[7-8])|(15[0-2,7-9])|(165)|(178)|(18[2-4,7-8])|(19[5,7,8]))\\d{8}|(170[3,5,6])\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,146,155,156,166,167,170[4,7,8,9],171,175,176,185,186,196
     */
    NSString *CU_NUM = @"^((13[0-2])|(14[5,6])|(15[5-6])|(16[6-7])|(17[1,5,6])|(18[5,6])|(196))\\d{8}|(170[4,7-9])\\d{7}$";
    
    /**
     * 中国电信：China Telecom
     * 133,149,153,162,170[0,1,2],173,174[0-5],177,180,181,189,19[0,1,3,9]
     */
    NSString *CT_NUM = @"^((133)|(149)|(153)|(162)|(17[3,7])|(18[0,1,9])|(19[0,1,3,9]))\\d{8}|((170[0-2])|(174[0-5]))\\d{7}$";

    /**
     * 中国广电：China Broadcasting Network
     * 192
     */
    NSString *CBN_NUM = @"^((192))\\d{8}$";
    
    NSPredicate *pred_CM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM_NUM];
    NSPredicate *pred_CU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU_NUM];
    NSPredicate *pred_CT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT_NUM];
    NSPredicate *pred_CBN = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CBN_NUM];
    
    BOOL isMatch_CM = [pred_CM evaluateWithObject:telNum];
    BOOL isMatch_CU = [pred_CU evaluateWithObject:telNum];
    BOOL isMatch_CT = [pred_CT evaluateWithObject:telNum];
    BOOL isMatch_CBN = [pred_CBN evaluateWithObject:telNum];
    
    if (isMatch_CM || isMatch_CT || isMatch_CU || isMatch_CBN) {
        return YES;
    }
    
    return NO;
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
/**
  判断字符串中是否包含非法字符
*/
- (BOOL)isHasIllegal {
    // 特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:self]) {
       return YES;
    }
    return NO;
}

// 是否为空或者是空格
- (BOOL)isEmpty {

    
    NSString * newSelf = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(nil == self
       || self.length ==0
       || [self isEqualToString:@""]
       || [self isEqualToString:@"<null>"]
       || [self isEqualToString:@"(null)"]
       || [self isEqualToString:@"null"]
       || newSelf.length ==0
       || [newSelf isEqualToString:@""]
       || [newSelf isEqualToString:@"<null>"]
       || [newSelf isEqualToString:@"(null)"]
       || [newSelf isEqualToString:@"null"]
       || [self isKindOfClass:[NSNull class]] ){
        
        return YES;
        
    }else{
        // <object returned empty description> 会来这里
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        return [trimedString isEqualToString: @""];
    }
    
    return NO;
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

// 計算字符串大小
+ (CGSize) calculateStringHeightWithFont:(UIFont *)font TextRect:(CGSize)size  string:(NSString *)content {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary * attributes = @{
                                  NSFontAttributeName:font,
                                  NSParagraphStyleAttributeName: paragraphStyle
                                  };
    CGSize textRect =  size; //CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, MAXFLOAT);
    CGSize s = [content boundingRectWithSize:textRect
       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
    attributes:attributes
                                        context:nil].size;
    
    return s;
}

// 字典或数组 转字符串json   parseTo
+ (NSString *)calculateJsonStringFromObject:(id)obj {
    
    if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
       NSData *data=[NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonStr = [[NSString  alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return jsonStr;
    }else {
        return  @"";
    }
}

// jsonString ->  数组/字典
+ (id)parseJSONStringToNSDictionary:(NSString *)JSONString {

    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];

    NSError *error = nil;

    id jsonObject = [NSJSONSerialization

    JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments

    error:&error];

    if (jsonObject != nil && error == nil){

    NSLog(@"反序列化成功...");

    if ([jsonObject isKindOfClass:[NSDictionary class]]){

    NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;

    NSLog(@"反序列化后的dictionary数据 = %@", deserializedDictionary);

    return deserializedDictionary;

    }

    else if ([jsonObject isKindOfClass:[NSArray class]]){

    NSArray *deserializedArray = (NSArray *)jsonObject;

    NSLog(@"反序列化json后的数组 = %@", deserializedArray);

    return deserializedArray;

    }else {

    return nil;

    }

    }else{

    NSLog(@"%@", error);

    NSLog(@"反序列化时发生一个错误");

    return nil;

    }

}

@end
