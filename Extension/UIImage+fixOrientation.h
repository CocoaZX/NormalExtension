//
//  UIImage+fixOrientation.h
//  Capture
//
//  Created by Zhang Heng on 2021/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (fixOrientation)
- (UIImage *)fixOrientation;
- (UIImage *)normalizedImage;
@end

NS_ASSUME_NONNULL_END
