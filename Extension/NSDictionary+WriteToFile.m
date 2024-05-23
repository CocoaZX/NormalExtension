//
//  NSDictionary+WriteToFile.m
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import "NSDictionary+WriteToFile.h"

@implementation NSMutableDictionary (WriteToFile)

- (BOOL)writeToPicPlistFile:(NSString *)filename {
    NSData * data;
    if (@available(iOS 12.0, *)) {
        NSError *error;
        data = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:YES error:&error];
    }else {
        data = [NSKeyedArchiver archivedDataWithRootObject:self];
    }
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:filename];
    BOOL didWriteSuccessfull = [data writeToFile:path atomically:YES];
    return didWriteSuccessfull;
}

+ (NSMutableDictionary *)readPicFromPlistFile:(NSString *)filename {
    NSError *error;
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:filename];
    NSData * data = [NSData dataWithContentsOfFile:path];
    return [NSKeyedUnarchiver unarchivedObjectOfClass:self fromData:data error:&error];
//    if (@available(iOS 12.0, *)) {
//        return [NSKeyedUnarchiver unarchivedObjectOfClass:self fromData:data error:&error];
//    }else {
//        if (data) {
//                    @try {
//                        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
//                    }
//                    @catch (NSException *exception) {
//                        NSLog(@"%@", exception);
//                    }
//                    @finally {
//                        
//                    }
//        }
////         return [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    }
}

// !!!!: 模型转字典
+ (NSDictionary *)changeToDictionaryWithHintDic:(NSDictionary *)hintDic{
    NSMutableDictionary *resDic = [NSMutableDictionary dictionary];
    unsigned int numIvars; // 成员变量个数
    Ivar *vars = class_copyIvarList([self class], &numIvars);
    NSString *key=nil;
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];  // 获取成员变量的名字
        key = [key hasPrefix:@"_"]?[key substringFromIndex:1]:key;
        id value = [self valueForKey:key];
        if (value!=nil) {
            // 映射字典,转换key
            if (hintDic) {
                key = [hintDic objectForKey:key]?[hintDic objectForKey:key]:key;
            }
            [resDic setValue:value forKey:key];
        }
    }
    free(vars);
    return resDic;
}


@end
