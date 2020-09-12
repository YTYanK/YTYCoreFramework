//
//  YTYRequest.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYRequest.h"

@implementation YTYRequest
yty_for_implementation(YTYRequest)

// 统一的一个请求管理者对象
- (AFHTTPSessionManager *)sessionManager {
    if (_sessionManager == nil) {
        return _sessionManager = [AFHTTPSessionManager manager];
    }
    return _sessionManager;
}


- (AFHTTPResponseSerializer * _Nonnull)rSerializer {
//    if(_rSerializer == nil){
    return [AFHTTPResponseSerializer serializer];
}


+ (void)requestWithUrl:(NSString *)url requestWithParameters:(NSDictionary *)par method:(NetMethod)met returnSuccess:(void(^)(id objs, int status, NSString *mag))success returnError:(void(^)(NSString *err))err {
    
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable  || status == AFNetworkReachabilityStatusUnknown) {
            // 網絡不可用
            // NSString *requestStr = @"";
             [UIApplication sharedApplication].networkActivityIndicatorVisible  = NO;
             err(@"网络不可用，请您检查网络");
        }else{
            
            NSString *metStr = (met > 0) ? @"POST" : @"GET";
            
            NSString *requestUrl = [NSString stringWithFormat:@"%@%@",IPHEAD,url];
            // AF 管理者
            AFHTTPSessionManager *manager = [YTYRequest sharedYTYRequest].sessionManager;
            
            if (![YTYRequest beforeExecute:manager]) {
                err(@"网络不可用，请您检查网络");
                return;
            }
            
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];//[YSBNetRequest sharedYSBNetRequest].rSerializer;
            [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer.timeoutInterval = 10.f;//3
            [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
            
            NSLog(@"-->url:%@",requestUrl);
            NSComparisonResult getComparison = [metStr caseInsensitiveCompare:@"GET"];
            if (getComparison == NSOrderedSame) {
                //requestUrl.URL.absoluteString
                [manager GET:[NSString stringWithFormat:@"%@",requestUrl] parameters:par progress:^(NSProgress * _Nonnull downloadProgress) {
                    //不做操作
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [YTYRequest requestWithRetrunSuccess:responseObject successBlock:success];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [YTYRequest requestWithReturnError:error errorBlock:err];
                }];
                
            }
            
            
            NSComparisonResult postComparison = [metStr caseInsensitiveCompare:@"POST"];
            if (postComparison == NSOrderedSame) {
                [manager POST:[NSString stringWithFormat:@"%@",requestUrl] parameters:par progress:^(NSProgress * _Nonnull uploadProgress) {
                    //不做操作
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [YTYRequest requestWithRetrunSuccess:responseObject successBlock:success];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [YTYRequest requestWithReturnError:error errorBlock:err];
                }];
            }
        }
    }];
    
    
    
}


/**
 *  请求成功
 */
+ (void)requestWithRetrunSuccess:(id _Nonnull)responseObject successBlock:(void(^)(id,int,NSString *))block{
    // 请求返回的信息
    __block NSString *requestStr = @"";
    NSError *jsonError = nil;
    NSData *jsonData = nil;
    // 转成Json字符串
    NSString  *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    // 检查是否可以转json 对象
    
    //如果检查到为空做登出
    if ([jsonStr isEqual:[NSNull null]] || jsonStr == nil) {
         requestStr = @"jsonStr null / 数据返回有问题， 请查看数据";
         block(nil,NetObtainDataStatusError, requestStr);  //遇到错误
    }
    
//    BOOL bol = [NSJSONSerialization isValidJSONObject:jsonStr];  // 检查是否可以转json
    if ([jsonStr rangeOfString:@"<"].location != NSNotFound) { // 检查jsonStr 是否包含在HTML代码里
            NSRange range = [jsonStr rangeOfString:@"<"];
            jsonStr = [jsonStr substringToIndex:range.location];
            jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    }else {
        jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        //jsonData = responseObject;
    }
    // 转 json 字典
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&jsonError];
    NSLog(@"获取json字符串：原型---->%@  Dic---%@",jsonStr,jsonDic);
    if (jsonStr != nil) {
        if (jsonError) {
             requestStr = @"转换字典失败，请查看数据";
             block(nil,NetObtainDataStatusFail, requestStr);  //有数据，通过代码处理时错误
        }else {
            requestStr = @"加载完成！";
            NSString *codeStr = [NSString stringWithFormat:@"%@",[jsonDic objectForKey:@"code"]];
            
            
            if([codeStr isEqualToString:@"200"]) {  //200 时
                if(jsonDic[@"msg"] != nil) {
                    if(![jsonDic[@"msg"] isEqual:[NSNull null]]) {
                      requestStr = jsonDic[@"msg"];
                    }
                }

                if(jsonDic[@"data"] == nil || [jsonDic[@"data"] isEqual: [NSNull null]]) {
                    block(jsonDic,NetObtainDataStatusSuccessAlsoNotData, requestStr);
                     // 是 200 并且数据是空时
                }else {
                    block(jsonDic[@"data"],NetObtainDataStatusSuccess,requestStr);
                }
                
               
            }else if ([codeStr isEqualToString:@"403"]){
                // 退出登陆
                requestStr = @"账户异常，请重新登录!";
                block(jsonDic[@"data"],NetObtainDataStatusFail, requestStr);
//                if ([YTYRequest sharedYTYRequest].authorityFailBlock != nil) {
//                    [YTYRequest sharedYTYRequest].authorityFailBlock(requestStr);
//                }
                return;
            }else if([codeStr isEqualToString:@"500"]){
                 requestStr = jsonDic[@"msg"];
                 block(nil,NetObtainDataStatusFail, requestStr);
            }else {  // 其他代码、处理情况
                requestStr = jsonDic[@"msg"];
                block(jsonDic,NetObtainDataStatusSuccessAlsoNotData, requestStr);
            }
        }
    }else {
        requestStr = @"获取不到任何数据";
        block(nil,NetObtainDataStatusError,requestStr); //直接错误
    }
}
/**
 *  请求失败
 */
+ (void)requestWithReturnError:(NSError *_Nonnull)error errorBlock:(void(^)(NSString *err))block {
    NSString *requestStr = @"";
    [UIApplication sharedApplication].networkActivityIndicatorVisible  = NO;
    NSLog(@"\n获取到错误，API错误，或服务器连接失败-->error is %@",error);
    requestStr = [YTYRequest afterExecute:error addViewC:nil];
    //如果是直接错误，请求问题，参数问题、接口问题。统一做处理，不返回到上面做提示
     block(requestStr);
}


/// 监控提示
+ (NSString *)afterExecute:(NSError *)error addViewC:(UIViewController *)vc {
    NSString *errStr = @"获取数据失败";
    NSLog(@"==??>>>%@", error);
    if ([error code] == NSURLErrorNotConnectedToInternet) {
        return errStr = @"网络不给力, 请检查网络连接";
    }else if([error code] == NSURLErrorTimedOut) {
        return errStr = @"网络连接超时，请稍后再尝试";
    }else if([error code] == NSURLErrorBadServerResponse) {
        return errStr = @"服务器异常或页面不存在";
    }else {
        return errStr = @"网络不给力, 请检查网络连接";
    }
}

/// 内调-监控网络
+ (BOOL)beforeExecute:(AFHTTPSessionManager *)manager {
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];  //开启请求
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES]; //暂停请求
                break;
        }
    }];
    [manager.reachabilityManager startMonitoring];
    return true;
}




@end
