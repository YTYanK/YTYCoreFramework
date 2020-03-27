//
//  UITextField+Length.h
//  zhengtang_baby
//
//  Created by YTYanK on 06/09/2019.
//  Copyright © 2019 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Length)
///  设置最大长度
@property (assign, nonatomic) NSInteger maxLength;


/// 添加监控 输入对象 键盘出现状态
- (void)addObserverForWillKeyBoard:(nullable id)obj;
/// 删除监控
- (void)removeObserverForKeyBoard:(nonnull id)obj;




@end

NS_ASSUME_NONNULL_END
