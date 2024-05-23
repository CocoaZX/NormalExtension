//
//  NSDictionary+WriteToFile.h
//  
//
//  Created by Zhang Heng on 2020/4/20.
//  Copyright © 2020 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (WriteToFile)
- (BOOL)writeToPicPlistFile:(NSString *)filename;
+ (NSMutableDictionary *)readPicFromPlistFile:(NSString *)filename;

@end
