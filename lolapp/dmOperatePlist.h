//
//  dmOperatePlist.h
//  lolapp
//
//  Created by 解云飞 on 14-5-26.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dmOperatePlist : NSObject

//write some information into plist
+ (void) writeToPlist:(NSString *)item key:(NSString *)key;

//read some information from plist with NSString return
+ (NSString *) read:(NSString *)temp;

//write array infomation into plist
+ (void) writeInfoToPlist:(NSMutableArray *)infoArray key:(NSString *)key;

//read array infomation from plist with NSArray return
+ (NSArray *) readInfoFromPlist:(NSString *)key;

@end
