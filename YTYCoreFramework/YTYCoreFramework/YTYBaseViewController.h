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
NS_ASSUME_NONNULL_BEGIN









@protocol YTYBaseViewControllerDelegate <NSObject>

@optional
/** 代理方法  更新本地化语言  */
- (void)baseUpdateLanguage;

@end


@interface YTYBaseViewController : UIViewController

typedef void(^CellAdditionalBlock)(UITableViewCell * cell);
typedef void(^BaseUpdateData)(id vc);

//@property (nonatomic, weak) id <YTYBaseViewControllerDelegate> baseDelegate;

/**
 *     没有实例对象， 需要自己初始化
 *     默认 Cell 高度 = 120， 数量 1个
 */
@property (nonatomic, strong) UITableView *baseTableView;
/// 是否自定义 Table 布局
@property (assign, nonatomic) BOOL isCustomTable;
/// 自带的 Cell 对象， 如果没有 baseTableView 实例对象 时， cell = nil;
@property (strong, nonatomic) YTYBaseTableViewCell *baseCell;
///  页数
@property (nonatomic, assign) int page;
/// 导航栏颜色
@property (strong, nonatomic) UIColor * baseNavBarBgColor;
@property (strong, nonatomic) NSFont * baseTitleFont;
@property (strong, nonatomic) UIImage * baseImage;
@property (assign, nonatomic) BOOL isShowNavigation;

@property (strong, nonatomic) UINavigationController * baseNC;



/// 更新操作
@property (nonatomic, strong) BaseUpdateData updateData;
/**
 *   更新操作 Cell 内部组件、或者手动添加组件
 *   添加 Cell 外部添加样式 操作
 *   注意  ( 如果重写 - tableView: cellForRowAtIndexPath: 方法， additionalBlock 不会执行)
 */
@property (strong, nonatomic) CellAdditionalBlock  additionalBlock;


//- (init)initNavigaionAddVC:(UIViewController *)vc;
////- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
//- (instancetype)initNavigaionWithViewController:(nonnull UIViewController *)viewController;


@end

NS_ASSUME_NONNULL_END
