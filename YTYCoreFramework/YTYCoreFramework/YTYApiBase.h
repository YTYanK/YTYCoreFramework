//
//  YTYApiBase.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTYConfigure.h"

/**
   YTYApiBase 是请求Api管理基类，主要作用于  数据模型 与 请求Api 的调度，及Api 请求到数据之后的数据缓存。
*/
NS_ASSUME_NONNULL_BEGIN

/**
 
   这里可以导数据模型
 */

typedef NSString *AUString NS_STRING_ENUM;


/**  网络请求方式 */
typedef NS_ENUM(NSInteger, NetMethod){
    NetMethodGET  =  -1,
    NetMethodPOST =  1,
};

/** 服务类型  */
typedef NS_ENUM(NSUInteger, YTYServerType) {
    Development = 0, // 开发
    Test = 1,   // 测试
    Release = 2 // 正式
};

/** 获取到数据的情况 */
typedef NS_ENUM(NSInteger, NetObtainDataStatus) {
    NetObtainDataStatusUnknownAlsoFail      = -2,  //  -失败
    NetObtainDataStatusFail                 = -1,  // 失败
    NetObtainDataStatusError                = 0,   // error
    NetObtainDataStatusSuccess              = 1,   // 成功
    NetObtainDataStatusSuccessAlsoNotData   = 2,   // 成功 -无数据
};


//// Test
//#define IPHEAD_TEST @""
//// Release
//#define IPHEAD_RELE @""
//// Development
//#define IPHEAD_DEVE @""

// Test
#define YTY_TEST @"Test"
// Release
#define YTY_RELE @"Release"
// Development
#define YTY_DEVE @"Development"

#define YTY_SET_NSUD(VALUE, KEY) [NSUD setValue:VALUE forKey:KEY];
//#define YTAY_GET_NSUD(KEY) [NSUD get]



@interface YTYApiBase : NSObject
yty_for_interface(YTYApiBase)

/**
 *  不返回错误，统一数据接口返回
 *  需要继承类重写
 */
+ (void)requestWithUrl:(AUString)api parameters:(NSDictionary *)dic method:(NetMethod)met returnModel:(void(^)(id model))block;

/**
 *  会返回错误， 统一数据接口返回
 *  需要继承类重写
 */
+ (void)requestWithUrl:(AUString)api parameters:(NSDictionary *)dic method:(NetMethod)met returnModel:(void(^)(id model))block returnError:(void(^)(id error))errBlock;

@end
NS_ASSUME_NONNULL_END
