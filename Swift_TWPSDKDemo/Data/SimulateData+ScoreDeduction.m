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


+(NSString *)backBreathPauseTimes:(NSString *)ahiArrayStr
{
//    ahiArrayStr = @"[4638,5916,6,2,22,9,8,44,64]";
    if(ahiArrayStr){
        NSMutableString *result=[[NSMutableString alloc]initWithCapacity:0];
        NSArray * ahiArray = [[ahiArrayStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]"]] componentsSeparatedByString:@","];
        if(ahiArray&&ahiArray.count >= 3){
            //            [4638,5916,6,2,22,9,8,44,64]"
            int start_hour = ([ahiArray[0] intValue] >> 8) & 0xff;
            int start_min =[ahiArray[0] intValue] & 0xff;
            int wake_hour = ([ahiArray[1] intValue] >> 8) & 0xff;
            int wake_min =[ahiArray[1] intValue] & 0xff;
            int duration = [ahiArray[2] intValue];//持续时长N小时
            for (int i=0 ; i<duration; i++) {
                NSString *start_time = [self minutesToTimeStr:start_hour*60 + start_min + i*60];
                NSString *end_time = [self minutesToTimeStr:start_hour*60 + start_min + 60 + i*60];
                if(i==duration-1 && ( (start_hour*60 + start_min + 60 + i*60)  >(wake_hour*60+wake_min))){//最后一个小时结束时间是否比实际清醒时间大，如果大，选择实际清醒时间
                    end_time = [self minutesToTimeStr:wake_hour*60+wake_min];
                    NSLog(@"实际清醒时间:%@",end_time);
                }
                NSString *ahi_time = [NSString stringWithFormat:@"%@~%@",start_time,end_time];
                NSString *ahi_seconds=[NSString stringWithFormat:@"%@%@",ahiArray[i+3],NSLocalizedString(@"unit_times", nil)];
                
                [result appendString:[NSString stringWithFormat:@"%@ %@\n",ahi_time,ahi_seconds]];
                
            }
            return result;
        }
        else
            return @"";
    }
    else
        return @"";
}


+ (NSString *)minutesToTimeStr:(int)min{
    return [NSString stringWithFormat:@"%02d:%02d",min/60>=24?min/60-24:min/60,min%60];
}

@end
