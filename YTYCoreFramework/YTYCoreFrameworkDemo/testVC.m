//
//  testVC.m
//  zhengtang_baby
//
//  Created by POP3mac on 2020/1/9.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "testVC.h"
#import "testVC2.h"
#import "UIViewController+BackButtonHandler.h"

@implementation testVC
- (void)test {
    NSLog(@"这里是一个测试方法");
}

- (BOOL)navigationShouldPopOnBackButton{
    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"确定返回上一界面?"
                               delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
    return NO;
}
// UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


//
//+ (void)load {
////    NSLog(@"testVC方法 处理？？%s", __func__);
//       UINavigationBar *bar = [UINavigationBar appearance];
//       bar.barTintColor = [UIColor blueColor];
//       [bar setTintColor:[UIColor redColor]]; //darkGrayColor // 返回按钮的字体颜色
//       bar.translucent = YES;
//
//      NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//
//    // 设置导航栏字体颜色
//       UIColor * naiColor = [UIColor greenColor];//YTYRGBA(0, 255, 0, 1);
//       attributes[NSForegroundColorAttributeName] = naiColor;
//       attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];;
//       bar.titleTextAttributes = attributes;
//
//       // 背景图片
////       [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
////       [bar setShadowImage:[UIImage new]];
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"text查看%s",__func__);
    self.title = @"测试";
    
    UITableView * newtestTableView = [[UITableView alloc] init];
    self.baseTableView = newtestTableView;
    
    self.additionalBlock = ^(UITableViewCell * _Nonnull cell) {
         cell.backgroundColor = [UIColor redColor];
         cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    };
    // Do any additional setup after loading the view.
    // 加载视图后执行任何其他设置
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
      NSLog(@"查看二次,%@",self.navigationController.navigationBar);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"Base->>%li",(long)indexPath.row);
    
    NSLog(@"xxxx===>%li",(long)indexPath.row);
    testVC2 * test2 = [[testVC2 alloc] init];
//     UINavigationController *newtestNav = [[UINavigationController alloc] initWithRootViewController:test2];
    [self.navigationController pushViewController:test2 animated:YES];
    
    
}

@end
