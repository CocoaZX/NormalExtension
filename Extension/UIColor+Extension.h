//
//  UIColor+BBAEExtension.h
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
//alpha为1.0
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/** 适配暗黑模式颜色
 * @param lightColor (UIColor 对象) 普通模式颜色
 * @param darkColor (UIColor 对象) 暗黑模式颜色
 *
 * @return UIColor 对象
 */
+ (UIColor *)colorWithLightColor:(UIColor *)lightColor DarkColor:(UIColor *)darkColor;

/** 适配暗黑模式颜色
* @param lightColor (16进制字符串) 普通模式颜色
* @param darkColor (16进制字符串) 暗黑模式颜色
*
* @return UIColor 对象
*/
+ (UIColor *)colorWithLightColorString:(NSString *)lightColor DarkColorString:(NSString *)darkColor;

/** 适配暗黑模式颜色
 * @param lightColor (16进制字符串) 普通模式颜色
 * @param lightAlpha 普通模式颜色透明度
 * @param darkColor (16进制字符串) 暗黑模式颜色
 * @param darkAlpha 暗黑模式透明度
 *
 * @return UIColor 对象
*/
+ (UIColor *)colorWithLightColorString:(NSString *)lightColor WithLightColorAlpha:(CGFloat)lightAlpha DarkColorString:(NSString *)darkColor WithDarkColorAlpha:(CGFloat)darkAlpha;

@end
