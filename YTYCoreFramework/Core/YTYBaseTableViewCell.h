//
//  YTYBaseTableViewCell.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/9.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface YTYBaseTableViewCell : UITableViewCell


/// 用来存放当前Cell 对象 对应的 TableView
@property (weak, nonatomic) UITableView *nestingTableView;

/**
 * Cell 初始化方法
 * @param tableView  列表对象
 * @param identifier 标记   ⚠️ identifier 与类名字一致
 */
+ (instancetype)initCellWithCellView:(UITableView *)tableView reuseIdentifier:(NSString *)identifier;

- (void)cellUpdateLanguage;

@end

NS_ASSUME_NONNULL_END
