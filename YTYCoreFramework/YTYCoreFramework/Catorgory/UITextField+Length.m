//
//  UITextField+Length.m
//  zhengtang_baby
//
//  Created by YTYanK on 06/09/2019.
//  Copyright © 2019 YTYanK. All rights reserved.
//

#import "UITextField+Length.h"
#import <objc/runtime.h>


static const char kMaxLengthKey;
@implementation UITextField (Length)

/// 设置输入值最大长度
- (void)setMaxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, &kMaxLengthKey, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)maxLength {
    NSNumber * number = objc_getAssociatedObject(self, &kMaxLengthKey);
    return  [number integerValue];
}

- (void)addLengthObserverEvent {
    [self addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)valueChange {
    if (self.maxLength > 0 && self.text.length > self.maxLength) {
        self.text = [self.text substringToIndex:self.maxLength];
    }
}

+ (void)load {
    //使用Xib，StoryBoard创建的UITextField
    Method  method1 = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method  method2 = class_getInstanceMethod([self class], @selector(AdapterinitWithCoder:));
    
    //使用initWithFrame创建的UITextField
    Method method3 = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method method4 = class_getInstanceMethod([self class], @selector(AdapterinitWithFrame:));
    method_exchangeImplementations(method1, method2);
    
    method_exchangeImplementations(method3, method4);
    
}


///---------------------
/// @name Initialization
///---------------------

- (instancetype)AdapterinitWithFrame:(CGRect)frame {
    [self AdapterinitWithFrame:frame];
    if (self) {
        //注册观察UITextField输入变化的方法。
        [self addLengthObserverEvent];
    }
    return self;
}
- (instancetype)AdapterinitWithCoder:(NSCoder *)aDecoder {
    [self AdapterinitWithCoder:aDecoder];
    if (self) {
        [self addLengthObserverEvent];
    }
    return self;
}



// 键盘监控
- (void)addObserverForWillKeyBoard:(id)obj {
    
    //增加监听，当键盘出现或改变时接收出消息
    [[NSNotificationCenter defaultCenter] addObserver:obj selector:@selector(LTkeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键盘退出时接收出消息
    [[NSNotificationCenter defaultCenter] addObserver:obj selector:@selector(LTkeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)removeObserverForKeyBoard:(id)obj {
    [[NSNotificationCenter defaultCenter] removeObserver:obj name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:obj name:UIKeyboardWillShowNotification object:nil];
}
/** 子类重写 -当键盘出现或改变时调用 */
- (void)LTkeyboardWillShow:(NSNotification *)not {}
/** 子类重写 -当键盘退出时调用 */
- (void)LTkeyboardWillHide:(NSNotification *)not {}





@end
