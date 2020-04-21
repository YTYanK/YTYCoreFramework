//
//  UIView+YTYBorderLine.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/9.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "UIView+YTYBorderLine.h"

@implementation UIView (YTYBorderLine)


- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(YTYBorderSideType)borderType {
   
    return [self borderForColor:color border:UIEdgeInsetsMake(borderWidth, borderWidth, borderWidth, borderWidth) borderType:borderType];
}


- (UIView *)borderForColor:(UIColor *)color border:(UIEdgeInsets)borderEdge borderType:(YTYBorderSideType)borderType {
    
    if (borderType == YTYBorderSideTypeAll) {
        self.layer.borderWidth = borderEdge.bottom;
        self.layer.borderColor = color.CGColor;
        return self;
    }
      
      
    /// 左侧
    if (borderType & YTYBorderSideTypeLeft) {
        /// 左侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderEdge.left]];
    }
      
    /// 右侧
    if (borderType & YTYBorderSideTypeRight) {
        /// 右侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderEdge.right]];
    }
      
    /// top
    if (borderType & YTYBorderSideTypeTop) {
        /// top线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderEdge.top]];
    }
      
    /// bottom
    if (borderType & YTYBorderSideTypeBottom) {
        /// bottom线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderEdge.bottom]];
    }
    
    
    return self;
}


- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
  
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
      
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    return shapeLayer;
}

- (UIView *)borderForView:(UIView *)originalView color:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(YTYBorderSideType)borderType {
      
    if (borderType == YTYBorderSideTypeAll) {
        originalView.layer.borderWidth = borderWidth;
        originalView.layer.borderColor = color.CGColor;
        return originalView;
    }
      
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
      
    /// 左侧
    if (borderType & YTYBorderSideTypeLeft) {
        /// 左侧线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, originalView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake(0.0f, 0.0f)];
    }
      
    /// 右侧
    if (borderType & YTYBorderSideTypeRight) {
        /// 右侧线路径
        [bezierPath moveToPoint:CGPointMake(originalView.frame.size.width, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake( originalView.frame.size.width, originalView.frame.size.height)];
    }
      
    /// top
    if (borderType & YTYBorderSideTypeTop) {
        /// top线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake(originalView.frame.size.width, 0.0f)];
    }
      
    /// bottom
    if (borderType & YTYBorderSideTypeBottom) {
        /// bottom线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, originalView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake( originalView.frame.size.width, originalView.frame.size.height)];
    }
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
      
    [originalView.layer addSublayer:shapeLayer];
      
    return originalView;
}





@end
