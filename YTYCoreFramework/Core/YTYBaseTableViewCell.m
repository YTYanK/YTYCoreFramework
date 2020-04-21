//
//  YTYBaseTableViewCell.m
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/1/9.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYBaseTableViewCell.h"

@implementation YTYBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/**
 * Cell 初始化方法
 */
+ (instancetype)initCellWithCellView:(UITableView *)tableView reuseIdentifier:(NSString *)identifier {
    // 因为identifier 与类名字一致
    YTYBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *nibPath = [mainBundle pathForResource:identifier ofType:@"nib"];
        
        // 判断文件是否存在
        if(nibPath) {
            cell = [[mainBundle loadNibNamed:identifier owner:self options:nil] firstObject];
            // bundle 可以直接去 xib注册
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
        }else {
//            NSLog(@"--%@",nibPath);
            cell =[[YTYBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaultCell"];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//取消点击效果
    return cell;
}

// 用于语言切换
- (void)cellUpdateLanguage {}

//  更新 frame
- (void)setFrame:(CGRect)frame {
    if(self.additionalFrameBlock != nil) {
       self.additionalFrameBlock(frame);
    }
    [super setFrame:frame];
}


@end
