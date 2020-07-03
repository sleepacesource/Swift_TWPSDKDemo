//
//  SLPTCPPostHistoryAnalysisData.h
//  SDK
//
//  Created by San on 2/7/2020.
//  Copyright © 2020 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLPTCPPostHistoryAnalysisData : NSObject
//设备ID    字串    14    UTF-8 带结束符( 例: "Z1-1503000000" )
@property (nonatomic,copy) NSString *deviceID;
//设备类型    USHORT    2    设备类型号
@property (nonatomic,assign) NSInteger deviceType;
//编号    UINT8    1
@property (nonatomic,assign) NSInteger number;//编号
@property (nonatomic,assign) NSInteger userId;//用户id
@property (nonatomic,assign) NSInteger timestamp;//时间戳
@property (nonatomic,assign) NSInteger timezone;//时区，单位秒s
@property (nonatomic,assign) NSInteger sleepScore;//得分 (0 ~ 100)
@property (nonatomic,assign) NSInteger duration;//实际睡觉总时长，除掉入睡时间和清醒时间。
@property (nonatomic,assign) NSInteger averageBreathRate; //平均呼吸率
@property (nonatomic,assign) NSInteger averageHeartBeatRate;  //平均心率
@property (nonatomic,assign) NSInteger fallAlseepAllTime;//入睡时长 单位:分钟min
@property (nonatomic,assign) NSInteger gobedTimestamp;//上床时间戳
@property (nonatomic,assign) NSInteger fallsleepTimeStamp;//入睡的时间戳
@property (nonatomic,assign) NSInteger wakeupTimeStamp;//最后清醒的时间戳
@property (nonatomic,assign) NSInteger leftbedTimestamp;//起床时间戳
@property (nonatomic,assign) NSInteger bodyMovementTimes;//体动次数
@property (nonatomic,assign) NSInteger deepSleepAllTime;//深睡时长 单位：分钟min

@end

NS_ASSUME_NONNULL_END
