//
//  YTYRequest.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "YTYConfigure.h"




NS_ASSUME_NONNULL_BEGIN

@interface YTYRequest : NSObject
@property (assign, nonatomic) NetObtainDataStatus obtainStatus;
@property (assign, nonatomic) NetMethod method;
@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@property (strong, nonatomic) AFHTTPRequestSerializer * _Nonnull rSerializer;
@property (strong, nonatomic) YTYErrorBlock errorBlock;

yty_for_interface(YTYRequest)

/**
 * @brief 全局请求方法
 *
 *    none
 */
+ (void)requestWithUrl:(NSString *)url requestWithParameters:(NSDictionary *)par method:(NetMethod)met returnSuccess:(void(^)(id objs, int status, NSString *mag))success returnError:(void(^)(NSString *err))err;


@end

NS_ASSUME_NONNULL_END
