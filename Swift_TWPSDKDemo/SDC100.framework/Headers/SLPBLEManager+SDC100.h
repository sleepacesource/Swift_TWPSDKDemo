//
//  SLPBLEManager-SDC100.h
//  SDK
//
//  Created by San on 2023/12/6.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <BluetoothManager/BluetoothManager.h>
#import <CoreBluetooth/CoreBluetooth.h> //
#import "SDCClockInfo.h"
#import "SDCBedConfig.h"
#import "SDCWorkMode.h"
#import "SDCSnoreStatus.h"
#import "SDCGlobalClock.h"
#import "SDCGoodNightMode.h"
#import "SDCLeftbedMode.h"
#import "SDCNightLight.h"
#import "SDCDeviceInfo.h"
#import "SDCSnoreMeddle.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLPBLEManager (SDC100)

/**
 连接设备
 @param peripheral 蓝牙句柄
 @param handle 回调 data类型为SABDeviceInfo
 */
- (void)bleSDC100:(CBPeripheral *)peripheral loginCallback:(SLPTransforCallback)handle;

/**
 获取设备信息
 @param peripheral 蓝牙句柄
 @param timeout 超时（单位秒）
 @param handle 回调
 */
- (void)bleSDC100:(CBPeripheral *)peripheral getDeviceInfoTimeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;

/**
 *params ={@keycode,@ctrlVal,@place}
 * 电动床控制
 * keycode {number} 0：停止
 1：下降（检测到长按开始和结束各发送一次）
 2: 上升
 3：观影模式
 4：阅读模式
 5：止鼾模式
 6：0重力模式
 7：FLAT 模式
 8：M1 自定义模式 调整到M1, 若当前不是已定义的状态则保存
 9：M2 自定义模式
 10：童锁
 * ctrlVal {number} 控制参数 控制码为1/2/8/9时，0-短按 1-长按, 控制码为10时，0-关闭童锁 1-打开童锁, 其他控制码，该字段无效
 * place {number} 控制位置 控制码为1/2时 0：背部 1：腿部 2：头部 3: 腰部
 */
-(void)bleSDC100:(CBPeripheral *)peripheral control:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 床底灯开关
 * @on {number} 开关状态 1 打开 ,  0 关闭
 */
-(void)bleSDC100:(CBPeripheral *)peripheral lightCtrl:(int)on timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 电动床参数设置(初始化)
 * @place {number} 控制位置 0：背部 1：腿部 2：头部 3: 腰部
 * @angle {number} 角度
 * @step {number} 步数
 */
-(void)bleSDC100:(CBPeripheral *)peripheral electricBedConfig:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 电动床参数获取
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getElectricBedConfigTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 获取电动床工作模式
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getWorkModeTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;


/**
 * 打鼾干预开关
 * @enable {number} 开关状态  1 打开 , 0 关闭
 * @side {number} 0 左侧, 1 右侧, 2 两侧
 */
-(void)bleSDC100:(CBPeripheral *)peripheral snoreMeddle:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 获取打鼾干预配置
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getSnoreMeddleTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 鼾声状态订阅开关
 */
-(void)bleSDC100:(CBPeripheral *)peripheral subSnoreStatus:(int)on timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 鼾声状态获取
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getSnoreStatusTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;


/**
 * 闹钟设置
 * @id {number} 闹钟编号
 * @enable {number} 闹钟开关
 * @smart {number} 是否智能开启
 * @offset {number} 智能开启偏移 智能开启时有效
 * @hour {number} 时
 * @minute {number} 分
 * @repeat {number} 重复 1-7
 * @angle {number} 抬高角度 0-60°
 * @side {number} 唤醒位置 0：左侧 1：右侧 2 左侧和右侧
 * @timestamp {number} 设置时间戳 设置/修改闹钟时的标准时间戳（用于单次闹钟）
 * @deleted {number} 是否有效
 */
-(void)bleSDC100:(CBPeripheral *)peripheral clock:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 闹钟列表获取
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getClockListTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 闹钟全局配置
 * @leftBed {number} 为1时 离床后闹钟有效,0 无效
 * @side {number} 0 左侧, 1 右侧, 2 两侧
 */
-(void)bleSDC100:(CBPeripheral *)peripheral globalClockConfig:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 闹钟全局配置获取
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getGlobalClockConfigTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 晚安模式设置
 * @enable {number} 晚安模式开关1启用，0不启用
 * @flat {number} 入睡放平开关1启用，0不启用
 */
-(void)bleSDC100:(CBPeripheral *)peripheral goodNightMode:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 晚安模式获取
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getGoodNightModeTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 离床模式设置
 * @enable {number} 离床模式开关1启用，0不启用
 * @flat {number} 离床放平1启用，0不启用
 * @time {Number} 离床时长
 */
-(void)bleSDC100:(CBPeripheral *)peripheral leftBedMode:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 离床模式获取
 */
-(void)bleSDC100:(CBPeripheral *)peripheral getLeftBedModeTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 离床夜灯设置
 * @enable {number} 离床夜灯开关，1开0关
 * @lamp {number} 床底灯开启开关，1开0关
 * @startHour {number} 开始小时（暂无效0）
 * @startMin {number} 开始分钟（暂无效0）
 * @endHour {number} 结束小时（暂无效0）
 * @endMin {number} 结束分钟（暂无效0）
 */
//-(void)bleSDC100:(CBPeripheral *)peripheral nightLight:(NSDictionary *)params timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 离床夜灯获取
 */
//-(void)bleSDC100:(CBPeripheral *)peripheral getNightLightTimeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;

/**
 * 打鼾干预演示
 * @on {number} 1 开始, 0 结束
 */
-(void)bleSDC100:(CBPeripheral *)peripheral snoringMeddleDemo:(int)on timeout:(CGFloat)timeout completion:(SLPTransforCallback)handle;


@end

NS_ASSUME_NONNULL_END
