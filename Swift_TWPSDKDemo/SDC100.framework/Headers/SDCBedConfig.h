//
//  SDCBedConfig.h
//  SDK
//
//  Created by San on 2023/12/6.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCBedConfig : NSObject

@property (nonatomic,assign) UInt8 place;
@property (nonatomic,assign) UInt16 angle;
@property (nonatomic,assign) UInt32 step;

@end

NS_ASSUME_NONNULL_END
