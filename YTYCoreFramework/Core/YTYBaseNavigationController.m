//
//  YTYBaseNavigationController.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/13.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYBaseNavigationController.h"

@interface YTYBaseNavigationController ()
@end

@implementation YTYBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 允许手势返回
    self.interactivePopGestureRecognizer.enabled=YES;
    // Do any additional setup after loading the view.
}


+ (void)initialize {
    [YTYBaseNavigationController setupNavigationBarTheme];
    [self setupBarButtonItemTheme];
}

/// 设置bar 样式

+ (void)setupNavigationBarTheme {
    UINavigationBar *navBar = nil;
//    if (@available(iOS 9.0, *)) {
        navBar =[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[YTYBaseNavigationController class]]];
//    }else {
//      navBar = [UINavigationBar appearanceWhenContainedIn:[YTYBaseNavigationController class], nil];
//    }
    
    NSString *navBarBg = @"";
    if (@available(iOS 8.2, *)) {
        [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor], NSShadowAttributeName : [[NSShadow alloc] init], NSFontAttributeName : [UIFont systemFontOfSize:18.0 weight:UIFontWeightBold]}];
    } else {
         [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor], NSShadowAttributeName : [[NSShadow alloc] init], NSFontAttributeName : [UIFont boldSystemFontOfSize:18.0]}];
        // Fallback on earlier versions
    }
    // 设置navigationbar的半透明效果
    navBar.translucent  = YES;
   // 背景 图片
    [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
}


/// 设置Itemi样式
+ (void)setupBarButtonItemTheme {
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *barBtn = [UIBarButtonItem appearance]; //所有
    
//    /** 文字属性 */
//    [barBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(255, 0, 0, 1),NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName, nil] forState:UIControlStateNormal];
//
    // 设置高亮状态的文字属性
        [barBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName,nil] forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    [barBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24],NSFontAttributeName, nil] forState:UIControlStateDisabled];
    
    /** 按钮背景 */
//    [barBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}


// 背景颜色
- (void)setBgColor:(UIColor *)bgColor {
    if (_bgColor != bgColor) {
        _bgColor = bgColor;
        //
        self.navigationBar.barTintColor = _bgColor;
    }
}

// 背景图片
- (void)setBgImage:(UIImage *)bgImage {
    if (_bgImage != bgImage) {
        _bgImage = bgImage;
        [self.navigationBar setBackgroundImage:_bgImage forBarMetrics:UIBarMetricsDefault];
    }
}


- (void)setTitleFont:(NSFont *)titleFont {
    if (_titleFont != titleFont) {
        _titleFont = titleFont;
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    if (_titleColor != titleColor) {
           _titleColor = titleColor;
       }
    self.navigationBar.tintColor = titleColor;
}



- (void)navBarTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)attributes {
    [self.navigationBar setTitleTextAttributes:attributes];
}

/// 隐藏下划线
- (void)hideNavigationUnderline {
   [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
   [self.navigationBar setShadowImage:[UIImage new]];
}


//  push 方法
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (self.viewControllers.count > [nav]) {
//        viewController.hidesBottomBarWhenPushed = YES;
//        // 设置导航栏 返回？
//        UINavigationItem *vcBtnItem = [viewController navigationItem];
//
////         vcBtnItem.leftBarButtonItem = [UIBarButtonItem BarButtonItemWithImageName:@"navigationbar_back_withtext" highImageName:@"navigationbar_back_withtext_highlighted" title:[[self.childViewControllers lastObject] title] target:self action:@selector(back)];
//
//        //  vcBtnItem.leftBarButtonItem = [UIBarButtonItem BarButtonItemWithImageName:@"返回" highImageName:@"返回" title:@"" target:self action:@selector(back)];//navigationbar_back_withtext_highlighted  -navigationbar_back_withtext
//    }
//
//    [super pushViewController:viewController animated:YES];
//
//}
 

//- (void)back {
//    // 返回
//    [self popViewControllerAnimated:YES];
//}

// self.navigationItem.titleView = [UtilsBrandedOptions getCustomLabelForNavBarByName:[[self.currentFileDto.fileName stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
