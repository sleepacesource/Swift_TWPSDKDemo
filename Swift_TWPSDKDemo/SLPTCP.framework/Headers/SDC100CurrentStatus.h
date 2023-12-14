//
//  SDC100CurrentStatus.h
//  SLPTCP
//
//  Created by San on 2023/12/14.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDC100CurrentStatus : NSObject

@property (nonatomic , assign) UInt8 leftMICStatus;//左侧MIC模块状态    0：正常 1：未插入 2：接触不良
@property (nonatomic , assign) UInt8 rightMICStatus;//右侧MIC模块状态    0：正常 1：未插入 2：接触不良
@property (nonatomic , assign) UInt8 leftSensorStatus;//左侧传感器模块状态  0：正常 1：未插入 2：接触不良
@property (nonatomic , assign) UInt8 rightSensorStatus;//右侧传感器模块状态  0：正常 1：未插入 2：接触不良
@property (nonatomic , assign) UInt8 leftThreshold;//左侧阈值 左侧鼾声算法判断噪声过滤阈值
@property (nonatomic , assign) UInt8 rightThreshold;//右侧阈值 右侧鼾声算法判断噪声过滤阈值

@end

NS_ASSUME_NONNULL_END
