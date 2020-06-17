//
//  SLPLTcpDef.h
//  EW202W
//
//  Created by Michael on 2020/5/11.
//  Copyright © 2020 Martin. All rights reserved.
//

#ifndef SLPLTcpDef_h
#define SLPLTcpDef_h



#define kNotificationNameLTCPDisconnected @"kNotificationNameLTCPDisconnected"//长连接断开了
#define kNotificationNameLTCPConnected @"kNotificationNameLTCPConnected"//长连接连接上了
#define kNotificationNameNoxUpdateRateChanged @"kNotificationNameNoxUpdateRateChanged" //nox升级进度
#define kNotificationNameEW202WWorkModeChanged @"kNotificationNameEW202WWorkModeChanged" //EW202W的工作状态发生了变化

// MARK: - Device

/*设备在线状态
 */
#define kNotificationNameRequestDeviceOnlineStatusChanged @"kNotificationNameRequestDeviceOnlineStatusChanged"

/*设备采集状态变化
*/
#define kNotificationNameDeviceCollectStatusChanged @"kNotificationNameDeviceCollectStatusChanged"


#define kNotificationNameWiFiDeviceRealtimeData @"kNotificationNameWiFiDeviceRealtimeData" //实时数据


#endif /* SLPLTcpDef_h */
