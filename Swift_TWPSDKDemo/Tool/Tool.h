//
//  Tool.h
//  RestonSDKDemo
//
//  Created by San on 2017/8/2.
//  Copyright © 2017年 medica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FontColor.h"

@interface Tool : NSObject

+ (void)configSomeKindOfButtonLikeNomal:(UIButton *)button;

+ (void)configureLabelBorder:(UILabel *)label;

+ (void)outputResultWithStr:(NSString *)str textView:(UITextView *)textview;

+ (BOOL)bleIsOpenShowToTextview:(UITextView *)textview;

+ (NSInteger)backDeviceTypeFromDeviceNumber:(NSString*)number;

+ (NSInteger)backDeviceMaterialFromDeviceNumber:(NSString*)number;


+(void)writeStringToDocument:(NSString *)stirng;

@end
