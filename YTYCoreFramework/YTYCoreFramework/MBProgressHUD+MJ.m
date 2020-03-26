//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

@implementation MBProgressHUD (MJ)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置字体大小
    //hud.label.font = [UIFont systemFontOfSize:12.f];
    // 标题颜色
    hud.contentColor = UIColor.whiteColor;
    // 设置背景颜色
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    //activityIndicatorColor = [UIColor colorWithRed:246/255.0 green:8/255.0 blue:142/255.0 alpha:1];
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    //hud.customView.backgroundColor = UIColor.greenColor;
 
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1.2秒之后再消失
    [hud hideAnimated:YES afterDelay:2.0];
}

#pragma mark 显示错误信息
+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success.png" view:view];
}
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
//    hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showSuccess:success toView:window];
}

+ (void)showError:(NSString *)error {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showError:error toView:window];
}

/// 加载
+ (MBProgressHUD *)showMessage:(NSString *)message {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    return [self showMessage:message toView:window];
}

+ (void)hideHUDForView:(UIView *)view {
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self hideHUDForView:view animated:YES];
}


+ (void)hideHUD {
    [self hideHUDForView:nil];
}



/**
   YTY _ 自定义部分   [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
 */

+ (void)showErrorWithTitle:(NSString *)title detailsText:(NSString *)details toView:(UIView *)view  {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    hud.detailsLabel.text = details;
    // 设置字体大小
  //  hud.labelFont = [UIFont systemFontOfSize:15.f];
    hud.detailsLabel.font =  [UIFont systemFontOfSize:15.f];
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/error.png"]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:2.0];
}





@end
