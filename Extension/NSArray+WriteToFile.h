//
//  NSMutableArray+WriteToFile.h
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (WriteToFile)

+ (BOOL) writeToPlistFile:(NSString *)filename DataArray:(NSArray *)array;
+ (NSArray*) readFromPlistFile:(NSString *)filename;
+ (void) removePlistFile:(NSString *)filename;


@end

NS_ASSUME_NONNULL_END
