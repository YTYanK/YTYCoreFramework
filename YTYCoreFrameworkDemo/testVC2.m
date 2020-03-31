//
//  testVC2.m
//  zhengtang_baby
//
//  Created by POP3mac on 2020/1/9.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "testVC2.h"
#import "UIViewController+BackButtonHandler.h"

@interface testVC2 ()
{
    NSDictionary<NSAttributedStringKey, id> *  _selfNavigationAttributed;
}
@end

@implementation testVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"测试2";
    UITableView * newtestTableView = [[UITableView alloc] init];
        self.baseTableView = newtestTableView;
    
        _selfNavigationAttributed = self.navigationController.navigationBar.titleTextAttributes;
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSForegroundColorAttributeName] = [UIColor greenColor];
        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];;
        self.navigationController.navigationBar.titleTextAttributes = attributes;
    
        self.additionalBlock = ^(UITableViewCell * _Nonnull cell) {
             cell.backgroundColor = [UIColor greenColor];
             cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        };
}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
////
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.titleTextAttributes = _selfNavigationAttributed;
}


//- (BOOL)navigationShouldPopOnBackButton {
//   [[[UIAlertView alloc] initWithTitle:@"提示" message:@"确定返回上一界面?"
//                                 delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
//      return NO;
//}
//// UIAlertViewDelegate
//- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
//    if (buttonIndex==1) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//}



@end
