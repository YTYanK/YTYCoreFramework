//
//  YTYConfigure.h
//  zhengtang_baby
//
//  Created by POP3mac on 2020/1/7.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#ifndef YTYConfigure_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define YTYConfigure_h



/// 定义返回错误数据的block类型
typedef void(^YTYErrorBlock)(id error);
///// 定义 失败数据的block类型
//typedef void(^YTYFailureBlock)(void);
/// 定义 需要返回的失败数据的block类型
typedef void(^YTYFailureBlock)(id failure);
/// 定义 返回成功数据的block类型
typedef void (^YTYSuccessBlock)(id success);
/// 定义 返回状态成功数据的block类型
typedef void(^YTYStateBlock)(BOOL state);
/// 定义 一个可以相互传值block 类型
typedef id (^YTYMutualVlueBlock)(id value);
/// 定义 返回多个参数 api block类型
//typedef void(^YTYBlock)(id value ,UIViewController *vc, NSString *msg,  id api);

/**
 *  处理数据中得null值
 */
#define NULL_TO_NIL(obj) ({ __typeof__ (obj) __obj = (obj);  __obj == [NSNull null] ?  @0 : obj;})

//???:--------------获取通知中心
#define NSNC  [NSNotificationCenter defaultCenter]
//???:---------------获取用户默认值
#define NSUD  [NSUserDefaults standardUserDefaults]
//???:--------------弱引用/强引用
#define YTYWeakSelf(self)  __weak typeof(self)  weak##Self  = self;
#define YTYStrongSelf(self) __strong typeof(self)  self = strong##Self;


//???:--------------获取当前语言
#define IOS_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

/**
 * 获取系统版本 - 原型
 */
#define IOS_VERSION  [[UIDevice currentDevice] systemVersion]

/**
 *  获取系统版本 - float类型
 *
 */
#define IOS_VERSION_FLOAT [IOS_VERSION floatValue]


//???:---------------获取各种高度、宽度
/**
   
 */
#define SCREEN_SCALE ([UIScreeen mainScreen].scale)

/**
 *  获取手机屏幕的高度
 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/**
 *  获取手机屏幕的宽度
 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
/**
 *  手机屏幕的 frame
 */
#define SCREEN_FRAME (CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
/**
 *  传入控制器对象，获取导航条高度
 */
#define SCREEN_NAVIGATIONBAR_HEIGHT(obj)  obj.navigationController.navigationBar.frame.size.height
/**
 *  X \ XSM \ XS \ XR
 */
#define IS_IPHONE_X (((int)((SCREEN_HEIGHT/SCREEN_WIDTH)*100)== 216) ? (YES) : (NO))
/**
 *  TabBar高度
 */
#define SCREEN_TAB_BAR  (((IS_IPHONE_X) == (YES))?(83.0):(49.0f))
/**
 *  NavBar高度
 */
#define SCREEN_NAV_BAR (((IS_IPHONE_X) == (YES))?(88.0):(64.0f))

/**
 * 状态栏 高度 - 20px
 */
#define SCREEN_STATUS_BAR  [[UIApplication sharedApplication] statusBarFrame]

/**
 * 宽/高比 - MIN
 */
#define SCREEN_PORTRAIT_WIDTH (MIN(SCREEN_WIDTH,SCREEN_HEIGHT))
/**
 * 宽/高比 - MAX
 */
#define SCREEN_PORTRAIT_HEIGHT (MAX(SCREEN_WIDTH,SCREEN_HEIGHT))
 
#define YTY_DP(size, _base_screen_width) ((CGFloat)(size) / (_base_screen_width) * SCREEN_PORTRAIT_WIDTH)

#define YTY_DP_320(size)     YTY_DP(size, 320.0)
#define YTY_DP_375(size)     YTY_DP(size, 375.0)
#define YTY_DP_414(size)     YTY_DP(size, 414.0)

//???:---------------颜色宏
/**
 * RGBA颜色  -UIColor
 */
#define YTYRGBA(r,g,b,a) \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/**
 * RGB颜色  -UIColor
 */
#define YTYRGB(r,g,b) \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(1)]

// 随机颜色
#define YTYRGB_RANDOM \
[UIColor colorWithRed:arc4random_uniform(100)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(100)/255.0 alpha:0.9f]

/**
 * RGB颜色转换（16进制->10进制）
 */
#define YTYRGB_TRANSFER_10 (rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//???:---------------图片宏
// 读取本地图片
#define IMG_FILE (file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
// 定义UIImage对象
//#define IMG_NAMED (_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]



//???:---------------- 单例化一个类及实例  //singleton_for_interface
#define yty_for_interface(className) +(className * )shared##className;

#define yty_for_implementation(className) static className* _instance;\
+ (id)allocWithZone:(NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{      \
_instance = [super allocWithZone:zone];\
});                                    \
return _instance;                      \
}\
+ (className *)shared##className{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{\
_instance = [[className alloc] init];\
});\
return _instance;\
}\


////???: ----- 语言切换
//#import "LFChangeLanguage.h"
//#define  LocalizedString(key) [[LFChangeLanguage bundle] localizedStringForKey:(key) value:(nil) table:@"YSBLocalizable"]

/**
   获取 路径， 通过   [NSUD setValue:@"url“  forKey:@“IPHEAD”] 设置路径
 */
#define IPHEAD  [NSUD  objectForKey:@"IPHEAD"]  //@"http://192.168.1.7:9000"


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


#endif /* YTYConfigure_h */
