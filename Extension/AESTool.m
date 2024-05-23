//
//  AESTool.m
//  test
//
//  Created by Yanwang Gu on 2021/3/9.
//  Copyright © 2021 Yanwang Gu. All rights reserved.
//

#import "AESTool.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation AESTool

// MARK:加密方法
+ (NSString *)ccic_encryptWithAES:(NSString *)enctyptString{
    NSData *contentData = [enctyptString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encrptData = [self AES128operation:kCCEncrypt data:contentData key:kkeyAESKey iv:kKeyAESValue];
    return [encrptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

// MARK:解密方法
+ (NSString *)ccic_decryptWithAES:(NSString *)decryptString{
    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:decryptString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *decryptedData = [self AES128operation:kCCDecrypt data:contentData key:kkeyAESKey iv:kKeyAESValue];
    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}
//MARK:AES128/ECB模式
/**
 *  AES128加解密算法
 *  @param operation kCCEncrypt（加密）kCCDecrypt（解密）
 *  @param data      待操作Data数据
 *  @param key       key
 */
+ (NSData *)AES128operation:(CCOperation)operation data:(NSData *)data key:(NSString *)key iv:(NSString *)iv{
    char keyPtr[kCCKeySizeAES256 + 1];  //kCCKeySizeAES128是加密位数 可以替换成256位的
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    size_t numBytesEncrypted = 0;
    void *buffer;
    size_t bufferSize;
    @try {
        bufferSize = [data length] + kCCBlockSizeAES128;
        buffer = malloc(bufferSize);
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    
    /**
     *这里设置的参数ios默认为CBC加密方式，
     *如果需要其他加密方式如ECB，在kCCOptionPKCS7Padding这个参数后边加上kCCOptionECBMode
     *即kCCOptionPKCS7Padding | kCCOptionECBMode。
     *但是记得修改上边的偏移量，因为只有CBC模式有偏移量之说
    */
    CCCryptorStatus cryptorStatus = CCCrypt(operation, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding,
                                            keyPtr, kCCKeySizeAES256,
                                            ivPtr,
                                            [data bytes], [data length],
                                            buffer, bufferSize,
                                            &numBytesEncrypted);
    
    if(cryptorStatus == kCCSuccess) {
        NSLog(@"cryptor Success");
        @try {
            return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
//        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    } else {
        NSLog(@"cryptor Error");
    }
    
    free(buffer);
    return nil;
}

@end
