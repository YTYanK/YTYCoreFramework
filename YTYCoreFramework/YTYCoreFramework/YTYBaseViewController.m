//
//  YTYBaseViewController.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYBaseViewController.h"
//#import <UIView+RGSize.h> //--没有用。。
#import "UIView+RGSize.h"
@interface YTYBaseViewController ()<UITableViewDelegate, UITableViewDataSource>

@end




@implementation YTYBaseViewController

static NSString *cellIdentifier = @"YTYBaseTableViewCell";

- (instancetype)init
{
    self = [super init];
    if (self) {
       [self initConfigure];
        // 优先初始化父类
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initConfigure];
    }
    return self;
}




// 会先加载父类 viewDidLoad ， 再加载子类 viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"查看%s",__func__);
    // Do any additional setup after loading the view.
    // 加载视图后执行任何其他设置
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"查看%@", [UINavigationBar appearance]);
}


//+ (void)load {
//   // [super load];
//    NSLog(@"处理？？？");
//    //
//}
//
//
//
//+ (void)initialize {
//    // 不明白为什么加载两次？
//    NSLog(@"处理-->%s",__func__);
//}

- (void)initConfigure {
  _page = 1;
  _isCustomTable = NO;
  _isShowNavigation = NO;
}


// 设置 table 并且初始化
- (void)setBaseTableView:(UITableView *)baseTableView {
    if (_baseTableView != baseTableView) {
        _baseTableView = baseTableView;
    }
    if (_baseTableView != nil) {
         [self initTableView: _baseTableView];
    }
   
}

- (void)setPage:(int)page {
    if (_page != page) {
        _page = page;
    }
}

- (void)setIsCustomTable:(BOOL)isCustomTable {
    if (_isCustomTable != isCustomTable) {
        _isCustomTable = isCustomTable;
    }
}

//- (void)setIsShowNavigation:(BOOL)isShowNavigation {
//    if (_isShowNavigation != isShowNavigation) {
//        _isShowNavigation = isShowNavigation;
//
//
//    }
//}
//
//
//- (void)setBaseNC:(UINavigationController *)baseNC {
//    if (_baseNC != baseNC) {
//        _baseNC = baseNC;
//    }
//}
//
//
//
//- (void)setBaseImage:(UIImage *)baseImage {
//    if (_baseImage != baseImage) {
//        _baseImage = baseImage;
//    }
//
//    if (self.baseNC != nil) {
//          [self.baseNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"矩形.png"] forBarMetrics:UIBarMetricsDefault];
//    }
//
//}


//// 初始化 Navigattion
//- (void)initNavigaionAddVC:(UIViewController *)vc {
////       [UINavigationBar appearance];
//
//    UINavigationController *newtestNav = [[UINavigationController alloc] initWithRootViewController:vc];
//
//    newtestNav.navigationBar.barTintColor = [UIColor redColor];
//    [newtestNav.navigationBar setTintColor:[UIColor greenColor]];
//    newtestNav.navigationBar.translucent  = YES;
//
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];;
//    newtestNav.navigationBar.titleTextAttributes = attributes;
//
//    [newtestNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"矩形.png"] forBarMetrics:UIBarMetricsDefault];
//    self.baseNC = newtestNav;
//}






// 初始化 table
- (void)initTableView:(UITableView *)tableView {
    if (tableView != nil) {
        tableView.delegate = self;
        tableView.dataSource = self;
        if (self.isCustomTable == NO) {
            [self.view addSubview: tableView];
            [self.view bringSubviewToFront:tableView];
//            tableView.frame = CGRectMake(self.view.left, SCREEN_NAV_BAR, self.view.width, self.view.height - SCREEN_NAV_BAR);
             tableView.frame = CGRectMake(self.view.frame.origin.x, SCREEN_NAV_BAR, self.view.frame.size.width, self.view.frame.size.height - SCREEN_NAV_BAR);
        }
    }
}


#pragma mark - TableView DataSource / Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"Base->>%li",(long)indexPath.row);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.baseCell = [YTYBaseTableViewCell initCellWithCellView:tableView reuseIdentifier:cellIdentifier];
    self.baseCell.nestingTableView = self.baseTableView;
    // 添加 Cell 外部添加样式 操作
    if(self.additionalBlock != nil) {
        self.additionalBlock(self.baseCell);
    }
    return self.baseCell;
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
