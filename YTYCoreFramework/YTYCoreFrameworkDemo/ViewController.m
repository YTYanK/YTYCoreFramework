//
//  ViewController.m
//  YTYCoreFrameworkDemo
//
//  Created by POP3mac on 2020/2/20.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ViewController.h"
#import "testVC2.h"
#import <YTYCoreFramework/YTYCoreFramework.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试例子";
//    NSLog(@"测试-》%.2f", self.view.maxX);
    // Do any additional setup after loading the view.
    
    // 参加一个对象
    UITableView * newtestTableView = [[UITableView alloc] init];
    self.baseTableView = newtestTableView;  //激活
    
    self.additionalBlock = ^(UITableViewCell * _Nonnull cell){
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.textLabel.text = @"测试例子1";
    };
    
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
