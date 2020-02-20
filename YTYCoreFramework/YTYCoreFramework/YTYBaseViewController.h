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
 *  没有实例对象， 需要自己初始化
 *     默认 Cell 高度 = 120， 数量 1个
 */
@property (nonatomic, strong) UITableView *baseTableView;
/// 是否自定义 Table 布局
@property (assign, nonatomic) BOOL isCustomTable;
/// 自带的 Cell
@property (strong, nonatomic) YTYBaseTableViewCell *baseCell;
///  页数
@property (nonatomic, assign) int page;


@property (strong, nonatomic) UIColor * baseNavBarBgColor;
@property (strong, nonatomic) NSFont * baseTitleFont;
@property (strong, nonatomic) UIImage * baseImage;
@property (assign, nonatomic) BOOL isShowNavigation;

@property (strong, nonatomic) UINavigationController * baseNC;



/// 更新操作
@property (nonatomic, strong) BaseUpdateData updateData;
/**
 *   更新操作 -- cell
 *   添加 Cell 外部添加样式 操作
 */
@property (strong, nonatomic) CellAdditionalBlock  additionalBlock;


//- (init)initNavigaionAddVC:(UIViewController *)vc;
////- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
//- (instancetype)initNavigaionWithViewController:(nonnull UIViewController *)viewController;


@end

NS_ASSUME_NONNULL_END
