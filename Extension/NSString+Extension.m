//
//  NSString+Extension.m
//  Capture
//
//  Created by Nate X Zhang on 2022/10/13.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

NSString *getSafeString(id object){
    NSString *string = nil;
    if ([object isKindOfClass:[NSNull class]] || object == nil || [[NSString stringWithFormat:@"%@",object] isEqualToString:@"(null)"] || [[NSString stringWithFormat:@"%@",object] isEqualToString:@""] ) {
        string = @"";
    }else{
        string = [NSString stringWithFormat:@"%@",object];
    }
    return string;
}

-(NSDictionary *)jsonToDic{
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return dic;
}

 


@end
