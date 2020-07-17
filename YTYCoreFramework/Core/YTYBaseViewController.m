//
//  YTYBaseViewController.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYBaseViewController.h"
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
    // NSLog(@"查看%s",__func__);
    // Do any additional setup after loading the view.
    // 加载视图后执行任何其他设置
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // NSLog(@"查看%@", [UINavigationBar appearance]);
}

- (void)initConfigure {
  _page = 1;
  _isCustomTable = NO;
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



// 初始化 tableView
- (void)initTableView:(UITableView *)tableView {
    if (tableView != nil) {
        tableView.delegate = self;
        tableView.dataSource = self;
        if (self.isCustomTable == NO) { // 非自定义Table
            [self.view addSubview: tableView];
            [self.view bringSubviewToFront:tableView];
             tableView.frame = CGRectMake(self.view.frame.origin.x, SCREEN_NAV_BAR, self.view.frame.size.width, self.view.frame.size.height - SCREEN_NAV_BAR);
        }
        
        self.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(tableRefreshData)];
        self.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(tableLoadData)];
           _baseTableView.mj_header = self.header;
           _baseTableView.mj_footer = self.footer;
        
    }
}


#pragma mark - TableView DataSource / Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     self.baseCell = [YTYBaseTableViewCell initCellWithCellView:tableView reuseIdentifier:cellIdentifier];
     self.baseCell.nestingTableView = self.baseTableView;
    /**
         添加 Cell 内容，通过“additionlBlock ” 属性返回，进行添加样式操作
        一般用于纯代码操作，或者进行Cell 的内容更新
     */
    if(self.additionalBlock != nil) {
        self.additionalBlock(self.baseCell,indexPath);
    }
    return self.baseCell;
}

#pragma mark - TableView Refresh / Load
- (void)tableRefreshData {} // 刷新
- (void)tableLoadData {} // 加载

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
