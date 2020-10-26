//
//  SA1001TimeAromaInfo.h
//  SDK
//
//  Created by Michael on 2020/7/14.
//  Copyright © 2020 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SA1001TimeAromaInfo : NSObject

@property (nonatomic, assign) UInt64 ID;//定时香薰配置ID
@property (nonatomic, assign) BOOL enable;//是否启用香薰
@property (nonatomic, assign) UInt8 hour;//24小时制 时（0-23）
@property (nonatomic, assign) UInt8 minute;//分钟（0-59）
@property (nonatomic, assign) UInt8 flag;//重复1-7 开关(0-6位) 0:关， 1:开  第一位为周一
@property (nonatomic, assign) UInt16 duration;//持续时长 (单位分钟)
@property (nonatomic, assign) UInt8 rate;//1-3

@end

NS_ASSUME_NONNULL_END
