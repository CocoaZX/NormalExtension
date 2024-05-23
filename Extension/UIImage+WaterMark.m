//
//  UIImage+WaterMark.m
//  Air Trace
//
//  Created by Yanwang Gu on 2021/2/7.
//

#import "UIImage+WaterMark.h"

@implementation UIImage (WaterMark)

+ (UIImage *)addWatermarkInImage:(UIImage *)image AtPonit:(CGPoint)point WithText:(NSString *)string{
    
    if (string.length <= 0) {
        string = @"test";
    }
    
    //开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //绘制上下文：1-绘制图片
    CGFloat w = image.size.width;
    CGFloat h = image.size.height;
    [image drawInRect:CGRectMake(0, 0, w, h)];
    //绘制上下文：2-添加文字到上下文
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
//    [string drawInRect:CGRectMake(0, 0.9*h, w, 0.2*h) withAttributes:dic];
    [string drawAtPoint:CGPointMake(point.x, point.y) withAttributes:dic];
    //从图形上下文中获取合成的图片
    UIImage *watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return watermarkImage;
}

+ (UIImage *)addWatermarkInImage:(UIImage *)image AtPonit:(CGPoint)point WithImage:(UIImage *)waterimage{
    //开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //绘制上下文：1-绘制图片
    CGFloat w = image.size.width;
    CGFloat h = image.size.height;
    [image drawInRect:CGRectMake(0, 0, w, h)];
    //绘制上下文：2-添加图片到上下文
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, 70)];
    backView.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.4];
    
    [waterimage drawAtPoint:CGPointMake(point.x, point.y)];
    //从图形上下文中获取合成的图片
    UIImage *watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return watermarkImage;
}

- (UIImage *)yp_getNewImageWithOriginalImage:(UIImage *)originalImage  waterImage:(UIImage *)waterImage waterString:(NSString *)waterString  {

    UIGraphicsBeginImageContext(originalImage.size);
    // 原始图片渲染
    [originalImage drawInRect:CGRectMake(0, 0, originalImage.size.width, originalImage.size.height)];
    CGFloat waterX = 0;
    CGFloat waterY = 0;
    CGFloat waterW = originalImage.size.width;
    CGFloat waterH = 70;
    
    // 打入的水印图片 渲染
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 打入的水印的文字渲 染
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary * dic = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:14],
                           NSParagraphStyleAttributeName : paragraphStyle,
                           NSForegroundColorAttributeName : [UIColor whiteColor]
                           };
    
    [waterString drawInRect:CGRectMake(originalImage.size.width-140, 20, 120, 20) withAttributes:dic];
    
    UIGraphicsEndPDFContext();
    
    // UIImage
    UIImage * imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    return imageNew;
}
@end
