//
//  SLPLTcpManager+TWP.h
//  SLPTCP
//
//  Created by San on 16/6/2020.
//  Copyright © 2020 Martin. All rights reserved.
//

#import <SLPTCP/SLPTCP.h>
#import "SLPCollectStatus.h"
#import "SLPEnvironmentInfo.h"
#import "SLPSleepStatus.h"
#import "SLPTCPBaseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLPLTcpManager (TWP)

/**
 *@param deviceID 设备id
 *@param deviceType 设备类型
 *@param side 位置左边left(0)，右边right(1) ,默认default0
 *@param timeout 超时时间（秒s）
 *@param handle 回调
 */
- (void)startRealTimeDataWithDeviceID:(NSString *)deviceID deviceType:(SLPDeviceTypes)deviceType leftRight:(int)side timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;

/**
 *@param deviceID 设备id
 *@param deviceType 设备类型
 *@param side 位置左边left(0)，右边right(1) ,默认default0
 *@param timeout 超时时间（秒s）
 *@param handle 回调
 */
- (void)stopRealTimeDataWithDeviceID:(NSString *)deviceID deviceType:(SLPDeviceTypes)deviceType leftRight:(int)side timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;

//接口废弃
//- (void)startCollectionWithDeviceID:(NSString *)deviceID deviceType:(SLPDeviceTypes)deviceType userID:(NSString *)userID timeStamp:(UInt32)timeStamp timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;

/**
 *@param deviceID 设备id
 *@param deviceType 设备类型
 *@param side 位置左边left(0)，右边right(1) ,默认default0
 *@param timeout 超时时间（秒s）
 *@param handle 回调
 */
- (void)stopCollectionWithDeviceID:(NSString *)deviceID deviceType:(SLPDeviceTypes)deviceType leftRight:(int)side userID:(NSString *)userID timeStamp:(UInt32)timeStamp timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;

// MARK: - Query

/**
 *@param deviceID 设备id
 *@param deviceType 设备类型
 *@param side 位置左边left(0)，右边right(1) ,默认default0
 *@param timeout 超时时间（秒s）
 *@param handle 回调
 */
- (void)getCollectionStatusWithDeviceID:(NSString *)deviceID deviceType:(SLPDeviceTypes)deviceType leftRight:(int)side timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;

/**
 *@param deviceID 设备id
 *@param deviceType 设备类型
 *@param side 位置左边left(0)，右边right(1) ,默认default0
 *@param timeout 超时时间（秒s）
 *@param handle 回调
 */
- (void)getSleepStatusWithDeviceID:(NSString *)deviceID deviceType:(SLPDeviceTypes)deviceType leftRight:(int)side timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;

- (void)getEnvironmentInfoWithDeviceID:(NSString *)deviceID timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;


@end


NS_ASSUME_NONNULL_END
