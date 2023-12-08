//
//  SDCClockInfo.h
//  SDK
//
//  Created by San on 2023/12/6.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCClockInfo : NSObject

/**
 * 闹钟设置[0x2509]
 * id {number} 闹钟编号
 * enable {boolean} 闹钟开关
 * smart {boolean} 是否智能开启
 * offset {number} 智能开启偏移 智能开启时有效
 * hour {number} 时
 * minute {number} 分
 * repeat {number} 重复 1-7
 * angle {number} 抬高角度 0-60°
 * side {number} 唤醒位置 0：左侧 1：右侧 2 左侧和右侧
 * timestamp {number} 设置时间戳 设置/修改闹钟时的标准时间戳（用于单次闹钟）
 * deleted {boolean} 是否有效
 */
@property (nonatomic,assign) UInt8 id;
@property (nonatomic,assign) UInt8 enable;
@property (nonatomic,assign) UInt8 smart;
@property (nonatomic,assign) UInt8 offset;
@property (nonatomic,assign) UInt8 hour;
@property (nonatomic,assign) UInt8 minute;
@property (nonatomic,assign) UInt8 repeat;
@property (nonatomic,assign) UInt8 angle;
@property (nonatomic,assign) UInt8 side;
@property (nonatomic,assign) UInt32 timestamp;
@property (nonatomic,assign) UInt8 deleted;


@end

NS_ASSUME_NONNULL_END
