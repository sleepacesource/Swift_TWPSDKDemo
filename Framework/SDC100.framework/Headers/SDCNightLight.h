//
//  SDCNightLight.h
//  SDK
//
//  Created by San on 2023/12/6.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCNightLight : NSObject

@property (nonatomic,assign) UInt8 enable;
@property (nonatomic,assign) UInt8 lamp;
@property (nonatomic,assign) UInt8 startHour;
@property (nonatomic,assign) UInt8 startMin;
@property (nonatomic,assign) UInt8 endHour;
@property (nonatomic,assign) UInt8 endMin;

@end

NS_ASSUME_NONNULL_END
