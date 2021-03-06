//
//  UIImage+Extension.h
//  新浪微博
//
//  Created by xc on 15/3/5.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GradientType) {
    GradientFromTopToBottom = 1,            //从上到下
    GradientFromLeftToRight,                //从做到右
    GradientFromLeftTopToRightBottom,       //从上到下
    GradientFromLeftBottomToRightTop        //从上到下
};

@interface UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *) imageName;
+ (UIImage *)resizableImageWithName:(NSString *)imageName;
- (UIImage*)scaleImageWithSize:(CGSize)size;
- (UIImage*)imageWithNewColor:(UIColor*)color;


/// UIImage -> Base64字符串 附帶類型 “data:  ——;base64,  ——”
+ (NSString *)conversionBase64AttachTypeFromImage:(UIImage *)image;
/// UIImage -> Base64字符串
+ (NSString *)conversionBase64FromImage:(UIImage *)image;
///  圖片url字符串 -> UIImage
+ (UIImage *)conversionImageFromImageUrl: (NSString *)imgSrc;
/// UIImage data -> Base64字符串
+ (NSString *)conversionBase64FromImageData:(NSData *)data;
/// base64字符串 -> UIImage图片
+ (UIImage *)conversionImageFromBase64String:(NSString *)b64;


/// 生成二维码
+ (UIImage *)createQRCodeWithData:(NSString *)dataString logoImage:(UIImage *)logoImage imageSize:(CGFloat)size;

/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param colors         渐变颜色的数组
 *  @param percents          渐变颜色的占比数组
 *  @param gradientType     渐变色的类型
 */
- (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colors percentage:(NSArray *)percents gradientType:(GradientType)gradientType;
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
