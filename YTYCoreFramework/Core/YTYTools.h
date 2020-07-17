//
//  YTYTools.h
//  YTYCoreFramework
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YTYConfigure.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTYTools : NSObject
/**
 *  获取一个手势对象
 *  @param action 方法
 *  @param target 对象
 *
 *  @return UITapGestureRecognizer
 */
+ (UITapGestureRecognizer* _Nonnull )obtainTapGestureRecognizerObjectWithAction:(nullable SEL)action withTarget:(nullable id)target;


/**
 *   给按钮加下划线
 *  @param string 对象
 *
 *  @return UIButton
 */
+ (UIButton * _Nonnull)obtainButtonObjectWithString:(nullable NSString *)string forState:(UIControlState)state;
/**
*   返回一个 NSMutableAttributedString 带下划线
*  @param string  字符串
*
*  @return NSMutableAttributedString
*/
+ (NSMutableAttributedString * _Nonnull)obtainUnderlineWithString:(nullable NSString *)string;

/**
 *  获取一个 渐变色 Layer  对象
 *  @param frame - 对象 frame
 *  @return CAGradientLayer
 */
+ (CAGradientLayer *)obtainGradientLayerWithFrame:(CGRect)frame;
+ (CAGradientLayer *)obtainGradientLayerWithFrame:(CGRect)frame cornerRadius:(CGFloat)radius;
+ (CAGradientLayer *)obtainGradientLayerWithFrame:(CGRect)frame cornerRadius:(CGFloat)radius  colors:(NSArray *)colors;


/**
 * 获取一个UIBarButtonItem 对象
 * @param target  接受事件的对象
 * @param action  事件方法
 * @param image 图片
 * @return UIBarButtonItem
 */

+ (UIBarButtonItem *)obtainBackItemWithTarget:(nullable id)target action:(nullable SEL)action image:(UIImage * _Nonnull)image;


/**
* 获取一个UIBarButtonItem 对象
*  @param customView  事件方法
* @return UIBarButtonItem
*/
+ (UIBarButtonItem *)obtainItemWithCustomView:(nullable UIView *)customView;


/**
 * 将数组拆分成固定长度 -后面抽离
 *  @param array  数组对象
 *   @param subSize  每组大小
 * @return NSMutableArray 拆分完的对象数组。
*/
+ (NSMutableArray *)splitArray: (NSArray *)array withSubSize : (int)subSize;


/// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)color;
@end

NS_ASSUME_NONNULL_END
