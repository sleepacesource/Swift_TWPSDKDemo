//
//  SimulateData+ScoreDeduction.m
//  RestonSDKDemo
//
//  Created by San on 2017/9/15.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "SimulateData+ScoreDeduction.h"

@implementation SimulateData (ScoreDeduction)

+(NSString *)backBreathPause:(NSArray *)breathArray user:(UserObj *)obj
{
    int index=0;
    NSMutableString *result=[[NSMutableString alloc]initWithCapacity:0];
    for (int i=0 ; i<breathArray.count; i++) {
        int  time=[[breathArray objectAtIndex:i] intValue];
        if (time!=0) {
            index++;
            NSTimeInterval timeInterval = obj.startTime.integerValue + i* 60;
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:obj.timezone.intValue]];
            df.dateFormat = @"HH:mm";
            NSString *timeStr = [df stringFromDate:date];
            NSString *second=[NSString stringWithFormat:@"%d",index];
            NSString *bstr=[NSString stringWithFormat:NSLocalizedString(@"sequence", nil), second];
            [result appendString:[NSString stringWithFormat:@"%@ %@  %ds\n",bstr,timeStr,time]];
        }
    }
    return result;
}

@end
