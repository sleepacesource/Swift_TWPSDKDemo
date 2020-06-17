//
//  SLPSleepStatus.h
//  SLPTCP
//
//  Created by San on 17/6/2020.
//  Copyright © 2020 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLPSleepStatus : NSObject

@property (nonatomic , copy) NSString *deviceID;
@property (nonatomic , assign) UInt16 deviceType;
//@property (nonatomic , assign) UInt8 number;
@property (nonatomic , assign) UInt8 sleepFlag;
@property (nonatomic , assign) UInt8 weakFlag;
@property (nonatomic , assign) UInt8 leftbedFlag;
@property (nonatomic , assign) UInt8 sleepStatus;
@property (nonatomic , assign) UInt8 sitStatus;

@end

NS_ASSUME_NONNULL_END
