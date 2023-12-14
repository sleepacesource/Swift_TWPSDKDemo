//
//  SDCWorkMode.h
//  SDK
//
//  Created by San on 2023/12/6.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCWorkMode : NSObject

@property (nonatomic,assign) UInt8 mode;
@property (nonatomic,assign) UInt8 adjusting;
@property (nonatomic,assign) UInt8 lock;
@property (nonatomic,assign) UInt8 light;
@property (nonatomic,assign) UInt16 angleBack;
@property (nonatomic,assign) UInt16 angleLeg;
@property (nonatomic,assign) UInt16 angleHead;
@property (nonatomic,assign) UInt16 angleWaist;

@end

NS_ASSUME_NONNULL_END
