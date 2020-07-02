//
//  YTYRequest.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//


//#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "YTYConfigure.h"




NS_ASSUME_NONNULL_BEGIN

@interface YTYRequest : NSObject

/**
 *  网络状态
    NetObtainDataStatusUnknownAlsoFail      = -2,  //  -失败
    NetObtainDataStatusFail                 = -1,  // 失败
    NetObtainDataStatusError                = 0,   // error
    NetObtainDataStatusSuccess              = 1,   // 成功
    NetObtainDataStatusSuccessAlsoNotData   = 2,   // 成功 -无数据
 
 */
@property (assign, nonatomic) NetObtainDataStatus obtainStatus;

/**
 * ge / post
 */
@property (assign, nonatomic) NetMethod method;
/// 网络请求对象
@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@property (strong, nonatomic, nonnull) AFHTTPRequestSerializer * rSerializer;
///  403 - 无权限状态下回调
@property (strong, nonatomic) YTYFailureBlock authorityFailBlock;

yty_for_interface(YTYRequest)

/**
 * @brief 全局请求方法
 *
 *  none
 */
+ (void)requestWithUrl:(NSString *)url requestWithParameters:(NSDictionary *)par method:(NetMethod)met returnSuccess:(void(^)(id objs, int status, NSString *mag))success returnError:(void(^)(NSString *err))err;


@end

NS_ASSUME_NONNULL_END
