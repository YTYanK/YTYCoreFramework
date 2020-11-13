//
//  YTYBaseNavigationController.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/13.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YTYBaseNavigationController : UINavigationController

///  Navigation Bar 背景颜色   - bar  tint
@property (strong, nonatomic) UIColor * bgColor;
/// 返回 字颜色
@property (strong, nonatomic) UIColor * titleColor;
/// 背景图片
@property (strong, nonatomic) UIImage * bgImage;
/// 样式
@property (strong, nonatomic) NSDictionary *titleTextAttributes;


/// 设置 标题 样式
- (void)navBarTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)attributes;

/// 隐藏下划线
- (void)hideNavigationUnderline;
@end

NS_ASSUME_NONNULL_END
