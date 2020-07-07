//
//  simulateData.h
//  RestonSDKDemo
//
//  Created by San on 2017/8/9.
//  Copyright © 2017年 medica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserObj.h"

@interface SimulateData : NSObject

+ (UserObj *)simulateLongData;

+ (UserObj *)simulateShortData;

+ (UserObj *)dealwithDataWithHistory:(NSDictionary *)history;

@end
