//
//  NSString+Extension.h
//  Capture
//
//  Created by Nate X Zhang on 2022/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

NSString *getSafeString(id object);

-(NSDictionary *)jsonToDic;

@end

NS_ASSUME_NONNULL_END
