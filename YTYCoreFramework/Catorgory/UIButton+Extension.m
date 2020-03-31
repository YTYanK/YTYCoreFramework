//
//  UIButton+Extension.m
//  QiChang
//
//  Created by POP3mac on 2020/2/28.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "UIButton+Extension.h"

//#import <AppKit/AppKit.h>


@implementation UIButton (Extension)

- (void)startWithTime:(NSInteger )timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color {
    
    
    // 倒计时时间
    __block NSInteger timeOut =timeLine;
    // dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 *NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        // 倒计时结束，关闭
        if(timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(),^{
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else {
            int allTime = (int)timeLine + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
        
    });
    dispatch_resume(_timer);
}


- (void)startWithTime:(NSInteger )timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle titleColor:(UIColor *)color {

    


    // 倒计时时间
    __block NSInteger timeOut =timeLine;
    // dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 *NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        // 倒计时结束，关闭
        if(timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(),^{
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title];
                NSRange strRange = {0,[str length]};
                [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
                [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [str length])];
                [self setAttributedTitle:str forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else {
            int allTime = (int)timeLine + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",timeStr,subTitle]];
                NSRange strRange = {0,[str length]};
                [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
                [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [str length])];
                [self setAttributedTitle:str forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
        
    });
    dispatch_resume(_timer);
}
@end
