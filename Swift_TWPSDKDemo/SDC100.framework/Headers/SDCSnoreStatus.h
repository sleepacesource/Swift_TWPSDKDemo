//
//  SDCSnoreStatus.h
//  SDK
//
//  Created by San on 2023/12/6.
//  Copyright © 2023 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCSnoreStatus : NSObject

@property (nonatomic,assign) UInt8 currentStatus;
@property (nonatomic,assign) UInt16 left;
@property (nonatomic,assign) UInt16 right;

@end

NS_ASSUME_NONNULL_END
