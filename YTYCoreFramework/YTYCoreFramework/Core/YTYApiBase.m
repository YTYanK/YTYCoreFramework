//
//  YTYApiBase.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYApiBase.h"
#import "YTYRequest.h"

@implementation YTYApiBase
yty_for_implementation(YTYApiBase)

/**
 *  不返回错误，统一数据接口返回
 */
+ (void)requestWithUrl:(AUString)api parameters:(NSDictionary *)dic method:(NetMethod)met returnModel:(void(^)(id model))block {
    
}

/**
 *  会返回错误， 统一数据接口返回
 */
+ (void)requestWithUrl:(AUString)api parameters:(NSDictionary *)dic method:(NetMethod)met returnModel:(void(^)(id model))block returnError:(void(^)(id error))errBlock {
}


@end
