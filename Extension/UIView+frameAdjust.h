//
//  UIView+frameAdjust.h
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface UIView (frameAdjust)

// 左上角x坐标
- (CGFloat)x;
- (void)setX:(CGFloat)x;

// 左上角y坐标
- (CGFloat)y;
- (void)setY:(CGFloat)y;

// 宽
- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

// 高
- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

// 中心点x
- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)x;

// 中心点y
- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)y;

/** 获取最大x */
- (CGFloat)maxX;
/** 获取最小x */
- (CGFloat)minX;

/** 获取最大y */
- (CGFloat)maxY;
/** 获取最小y */
- (CGFloat)minY;

/** 设置最小x,相当于设置x */
- (void)setMinX:(CGFloat)minX;

/** 设置最大x */
- (void)setMaxX:(CGFloat)maxX;

/** 设置最小y,相当于设置y */
- (void)setMinY:(CGFloat)minY;

/** 设置最大y */
- (void)setMaxY:(CGFloat)maxY;

@end
