//
//  SLPLTcpManager+SDC100.h
//  SDK
//
//  Created by San on 2023/12/14.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <SLPTCP/SLPTCP.h>
#import "SDC100CurrentStatus.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLPLTcpManager (SDC100)

/**
 获取鼾睡及传感器连接状态
 */
- (void)sdc100GetDeviceCurrentStatusWithDeviceID:(NSString *)deviceID timeout:(CGFloat)timeout callback:(SLPTransforCallback)handle;



@end

NS_ASSUME_NONNULL_END
