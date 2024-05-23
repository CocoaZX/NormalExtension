//
//  UIImage+WaterMark.h
//  Air Trace
//
//  Created by Yanwang Gu on 2021/2/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WaterMark)

+ (UIImage *)addWatermarkInImage:(UIImage *)image AtPonit:(CGPoint)point WithText:(NSString *)string;
+ (UIImage *)addWatermarkInImage:(UIImage *)image AtPonit:(CGPoint)point WithImage:(UIImage *)waterimage;

@end

NS_ASSUME_NONNULL_END
