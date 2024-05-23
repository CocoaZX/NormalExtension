//
//  NSMutableArray+WriteToFile.m
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import "NSArray+WriteToFile.h"

@implementation NSArray (WriteToFile)

+ (BOOL)writeToPlistFile:(NSString *)filename DataArray:(NSArray *)array {
    NSData * data;
    if (@available(iOS 12.0, *)) {
        NSError *error;
        data = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:NO error:&error];
    }else {
        data = [NSKeyedArchiver archivedDataWithRootObject:array];
    }
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString *pathname = [NSString stringWithFormat:@"%@-%@",[[NSUserDefaults standardUserDefaults]objectForKey:KeyStaffID],filename];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:pathname];
    BOOL didWriteSuccessful = [data writeToFile:path atomically:YES];
    return didWriteSuccessful;
}

+ (void)removePlistFile:(NSString *)filename{
    NSFileManager *fileMger = [NSFileManager defaultManager];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",filename]];
    //如果文件路径存在的话
    BOOL bRet = [fileMger fileExistsAtPath:filePath];
    if (bRet) {
        NSError *err;
        [fileMger removeItemAtPath:filePath error:&err];
     }
}


+ (NSArray *)readFromPlistFile:(NSString *)filename {
    NSError *error;
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString *pathname = [NSString stringWithFormat:@"%@-%@",[[NSUserDefaults standardUserDefaults]objectForKey:KeyStaffID],filename];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:pathname];
    NSData * data = [NSData dataWithContentsOfFile:path];
    return [NSKeyedUnarchiver unarchivedObjectOfClass:self fromData:data error:&error];
//    if (@available(iOS 12.0, *)) {
//        return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSObject class] fromData:data error:&error];
//    }else
//        if (data) {
//            @try {
//                return [NSKeyedUnarchiver unarchiveObjectWithData:data];
//            }
//            @catch (NSException *exception) {
//                NSLog(@"%@", exception);
//            }
//            @finally {
//                
//            }
//        }
//         return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
@end
