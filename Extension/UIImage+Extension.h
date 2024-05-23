#import <UIKit/UIKit.h>


/************************对UIImage功能拓展的分类************************/
@interface UIImage (Extension)

/**
 *  按照0.5的比例拉伸图片
 *
 *  @param name 图片名字
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

/**
 *  根据指定参数拉伸图片
 *
 *  @param name 图片名
 *  @param left 距离左边的比例
 *  @param top  距离顶部的比例
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  根据颜色返回图片
 */
+(UIImage*)imageWithColor:(UIColor*)color;

/**
 *  返回指定透明度的图片
 */
- (UIImage *)imageWithAlpha:(CGFloat)alpha;


//根据文字，背景色，宽度渲染的图片，图片内容是圆形
+ (UIImage *)roundImageWithString:(NSString *)string width:(CGFloat )width backgroundColor:(UIColor *)color;


//改变图片颜色
- (UIImage*)imageChangeColor:(UIColor*)color;

- (NSString *)base64String;

+ (UIImage *)imageFromBase64String:(NSString *)string;

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

// UIImageView变灰效果
+ (UIImage*)getGrayImage:(UIImage*)sourceImage;
- (UIImage*)getSubImage:(CGRect)rect;

//缩略图
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;

//按宽度等比例压缩图片
- (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

+ (UIImage*)imageWithImage:(UIImage*)image
               scaledToSize:(CGSize)newSize;
+ (UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize;



@end
