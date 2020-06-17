//
//  SLPLTcpManager.h
//  Sleepace
//
//  Created by Martin on 10/26/16.
//  Copyright © 2016 com.medica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLPLTcp.h"

#define SLPSharedLTCP [SLPLTcpManager sharedInstance].lTcp
#define SLPSharedLTcpManager [SLPLTcpManager sharedInstance]

@class SLPLTcpServer;
@interface SLPLTcpManager : NSObject
{
}
@property (nonatomic,readonly) SLPConnectStatus status;
@property (nonatomic,assign) BOOL enable;
@property (nonatomic,readonly) SLPLTcp *lTcp;

+ (SLPLTcpManager *)sharedInstance;

- (void)toInit;

/*
 login tcp 
 */
- (BOOL)loginHost:(NSString *)host port:(NSInteger)port deviceID:(NSString *)deviceID token:(NSString *)token completion:(void(^)(BOOL succeed))completion;


- (void)disconnectTCPCompletion:(void(^)(void))completion;



@end
