//
//  AESTool.h
//  test
//
//  Created by Yanwang Gu on 2021/3/9.
//  Copyright © 2021 Yanwang Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AESTool : NSObject

/**
 * 加密方法
 * @param enctyptString 加密字段
 * @param key 秘钥
 * @param iv 偏移量
 * @return 加密后base64值
 */
+ (NSString *)ccic_encryptWithAES:(NSString *)enctyptString;

/**
 * 解密方法
 * @param decryptString 解密字段
 * @param key 秘钥
 * @param iv 偏移量
 * @return 解密后字符
*/
+ (NSString *)ccic_decryptWithAES:(NSString *)decryptString;


@end

NS_ASSUME_NONNULL_END
