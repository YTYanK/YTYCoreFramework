//
//  YTYBaseViewController.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTYConfigure.h"
#import "YTYBaseTableViewCell.h"
#import <MJRefresh/MJRefresh.h>
#import "UIView+RGSize.h"


NS_ASSUME_NONNULL_BEGIN

@protocol YTYBaseViewControllerDelegate <NSObject>

@optional
///** 代理方法  更新本地化语言  */
//- (void)baseUpdateLanguage;

@end


@interface YTYBaseViewController : UIViewController
/// cell 额外扩展
typedef void(^CellAdditionalBlock)(UITableViewCell * cell, NSIndexPath *indexPath);
typedef void(^BaseUpdateData)(id vc);

//@property (nonatomic, weak) id <YTYBaseViewControllerDelegate> baseDelegate;

/**
 *     没有实例对象， 需要自己初始化
 *     默认 Cell 高度 = 120， 数量 1个
 */
@property (nonatomic, strong) UITableView *baseTableView;
/// 是否自定义 Table 布局, 需要自定义时，记得设置 true  默认 false, 并且需要使用 addSubview 到主页面
@property (assign, nonatomic) BOOL isCustomTable;
/// 自带的 Cell 对象， 如果没有 baseTableView 实例对象 时， cell = nil;
@property (strong, nonatomic) YTYBaseTableViewCell *baseCell;
/// 页数
@property (nonatomic, assign) int page;





/**
  更新操作 - 需要把繼承對象進行 傳入 即可在 初始化該對象之後調用
  例子：
  - (void)viewWillAppear:(BOOL)animated {
      [super viewWillAppear:animated];
      if (self.updateData != nil) {
          self.updateData(self);
      }
  }
 */
@property (nonatomic, strong) BaseUpdateData updateData;
/**
 *   更新操作 Cell 内部组件、或者手动添加组件
 *   添加 Cell 外部添加样式 操作
 *   注意  ( 如果重写 - tableView: cellForRowAtIndexPath: 方法， additionalBlock 不会执行)
 *    ⚠️該方適用 父類 YTYBaseViewController 的 baseTableView 對象
 *        ⚠️ 如需非 baseTableView 對象 調用方法請看demo案例
 */
@property (strong, nonatomic) CellAdditionalBlock  additionalBlock;


///  刷新对象
@property (strong, nonatomic) MJRefreshNormalHeader * header;
///  加载对象
@property (strong, nonatomic) MJRefreshBackNormalFooter * footer;



@end

NS_ASSUME_NONNULL_END
