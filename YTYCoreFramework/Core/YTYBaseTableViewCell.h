//
//  YTYBaseTableViewCell.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/9.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTYConfigure.h"


NS_ASSUME_NONNULL_BEGIN
typedef void(^CellAdditionalFrameBlock)(CGRect frame);
@interface YTYBaseTableViewCell : UITableViewCell


/// 用来存放当前Cell 对象 对应的 TableView
@property (weak, nonatomic) UITableView *nestingTableView;
/** 额外扩展 cell  frame 值
     例子：
        if (self.indexPath.row == 0) { }else {
         frame.origin.y += 15;
          frame.size.height -= 15;
        }
 */
@property (strong, nonatomic) CellAdditionalFrameBlock additionalFrameBlock;

/**
 * Cell 初始化方法
 * @param tableView  列表对象
 * @param identifier 标记   ⚠️ identifier 与类名字一致
 */
+ (instancetype)initCellWithCellView:(UITableView *)tableView reuseIdentifier:(NSString *)identifier;

- (void)cellUpdateLanguage;



@end

NS_ASSUME_NONNULL_END
