//
//  YTYMainLists.m
//  YTYCoreFrameworkDome
//
//  Created by POP3mac on 2020/4/23.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYMainLists.h"
#import "YTYMainCell.h"

@interface YTYMainLists ()

@end

@implementation YTYMainLists

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    // Do any additional setup after loading the view.
    self.title = @"功能展示列表";
    if(IS_IPHONE_X) {
        NSLog(@"YES");
    }else {
        NSLog(@"NO");
    }
//    [YTYTools obtainBackItemWithTarget:self action:@selector(logout) image:[UIImage imageNamed:@"error"]]; imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    self.navigationItem.rightBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(logout) image:[UIImage imageNamed:@"error"]];
    if (@available(iOS 10.0, *)) {
      [self.navigationController.navigationBar setBarTintColor:UIColor.blueColor];
    }else {
      [self.navigationController.navigationBar setTintColor:UIColor.redColor];
    }
    
    self.isCustomTable = YES;
    self.baseTableView = [[UITableView alloc] init];
    if (IS_IPHONE_X) {
      self.baseTableView.frame = CGRectMake(0,  94, SCREEN_WIDTH,  self.view.size.height - 94 -  40 - SCREEN_NAV_BAR);
    }else {
      self.baseTableView.frame = CGRectMake(0,  94, SCREEN_WIDTH,  self.view.size.height - 94 -  40 - SCREEN_NAV_BAR);
    }
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.baseTableView];
    
    self.additionalBlock = ^(UITableViewCell *cell, NSIndexPath *indexPath) {
        UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(200, 0, 100, 40)];
        label.text = [NSString stringWithFormat:@"测试-->%ld",(long)indexPath.row];
        [cell addSubview:label];

    };
   
}
- (void)logout {
    NSLog(@"退出方法");
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
    return  nil;//[HeaderVIew obtainGradientLayerViewFrame:frame viewFrame:frame];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YTYMainCell *cell = [YTYMainCell initCellWithCellView:tableView reuseIdentifier:@"YTYMainCell"];
    cell.nestingTableView = tableView;
    self.additionalBlock(cell, indexPath);
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"--->>%ld",(long)indexPath.row);
 }


#pragma mark - 加载刷新
// 刷新
- (void)tableRefreshData {
    [self tableRefreshDataWithPage:1];
}
- (void)tableLoadData {
    [self tableLoadDataWithPage:1];
}

// 刷新
- (void)tableRefreshDataWithPage:(int)page {
//    NSMutableDictionary * dic =[NSMutableDictionary dictionary];
//    [dic setObject:isLogin forKey:@"session_token"];

    [self.baseTableView.mj_header endRefreshing];
    [self.baseTableView reloadData];
}

// 加载
- (void)tableLoadDataWithPage:(int)page {
    [self.baseTableView.mj_footer endRefreshing];
}


- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end