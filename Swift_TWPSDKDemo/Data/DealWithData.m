//
//  DealWithData.m
//  RestonSDKDemo
//
//  Created by San on 2017/8/31.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "DealWithData.h"

@implementation DealWithData

+(NSArray *)backDataArray:(UserObj *)dataObj
{
    if ([dataObj.reportFlag integerValue]==1)
    {
        return [self backLongDataArray:dataObj];
    }
    else
        return [self backShortDataArray:dataObj];
}

+ (NSArray *)backShortDataArray:(UserObj *)obj
{
    NSString *date=[NSString stringWithFormat:@"%@",obj.date];
    NSString *duration=[NSString stringWithFormat:@"%02d%@%02d%@",[obj.recordCount integerValue]/60,NSLocalizedString(@"unit_h", nil),[obj.recordCount integerValue]%60,NSLocalizedString(@"unit_m", nil)];
    
    NSString *averageHeartRate=[NSString stringWithFormat:@"%@ %@",obj.pjxl,NSLocalizedString(@"unit_heart", nil)];
    NSString *averageBreathRate=[NSString stringWithFormat:@"%@ %@",obj.pjhxl,NSLocalizedString(@"unit_respiration", nil)];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
//    formatter.timeZone=[NSTimeZone localTimeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[obj.startTime integerValue]];
    NSString *startTime = [formatter stringFromDate:confromTimesp];
    NSInteger startTimeNum=[[[startTime componentsSeparatedByString:@":"] objectAtIndex:0] integerValue]*60+[[[startTime componentsSeparatedByString:@":"] objectAtIndex:1] integerValue];
//    NSInteger startSleepTime=[obj.asleepTime integerValue]+startTimeNum;
    NSInteger endSleepTime=[obj.recordCount integerValue]+startTimeNum;
    NSString *startTimeStr=startTime;
    NSString *endTimeStr =[NSString stringWithFormat:@"%02d:%02d",endSleepTime/60>=24?endSleepTime/60-24:endSleepTime/60,endSleepTime%60];
     NSString *sleepTime=[NSString stringWithFormat:@"%@(%@)~%@(%@)",startTimeStr,NSLocalizedString(@"starting_point", nil),endTimeStr,NSLocalizedString(@"end_point", nil)];
    
    NSString *tempRangeStr = [self rangeString:obj.eTempArray];
    tempRangeStr = [NSString stringWithFormat:@"%@℃", tempRangeStr];
    
    NSString *humRangeStr = [self rangeString:obj.eHumidityArray];
    humRangeStr = [NSString stringWithFormat:@"%@%@", humRangeStr, @"%"];
    
    return  @[date,sleepTime,duration,averageHeartRate,averageBreathRate, tempRangeStr, humRangeStr];
}

+ (NSString *)rangeString:(NSArray *)arr {
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i  = 0; i < arr.count; i++) {
        int value = [[arr objectAtIndex:i] intValue];
        if (value != 255) {
            [tempArr addObject:@(value)];
        }
    }
    
    int max = 0, min = 0;
    if (tempArr && tempArr.count > 0) {
        max = [[tempArr objectAtIndex:0] intValue];
        min = [[tempArr objectAtIndex:0] intValue];
        for (int i = 1; i < tempArr.count; i++) {
            int value = [[tempArr objectAtIndex:i] intValue];
            if (value > max) {
                max = value;
            }
            
            if (value < min) {
                min = value;
            }
        }
    }
    
    NSString *str = [NSString stringWithFormat:@"%d-%d", min, max];
    
    return  str;
}

+(NSArray *)backLongDataArray:(UserObj *)obj
{
    NSString *date=[NSString stringWithFormat:@"%@",obj.date];
    NSString *score=[NSString stringWithFormat:@"%@",obj.score];
    NSString *duration=[NSString stringWithFormat:@"%02d%@%02d%@",[obj.duration integerValue]/60,NSLocalizedString(@"unit_h", nil),[obj.duration integerValue]%60,NSLocalizedString(@"unit_m", nil)];
   
    NSString *asleepTime=[NSString stringWithFormat:@"%02d%@%02d%@",[obj.asleepTime integerValue]/60,NSLocalizedString(@"unit_h", nil),[obj.asleepTime integerValue]%60,NSLocalizedString(@"unit_m", nil)];
    NSString *averageHeartRate=[NSString stringWithFormat:@"%@ %@",obj.pjxl,NSLocalizedString(@"unit_heart", nil)];
    NSString *averageBreathRate=[NSString stringWithFormat:@"%@ %@",obj.pjhxl,NSLocalizedString(@"unit_respiration", nil)];
    NSString *wakes=[NSString stringWithFormat:@"%@ %@",obj.wake_times,NSLocalizedString(@"unit_times", nil)];
    NSString *turnOver=[NSString stringWithFormat:@"%@ %@",
                        obj.fscs,NSLocalizedString(@"unit_times", nil)];
    NSString *bodyMovement=[NSString stringWithFormat:@"%@ %@",obj.tdcs,NSLocalizedString(@"unit_times", nil)];
    NSString *leaveBed=[NSString stringWithFormat:@"%@ %@",obj.lccs,
                        NSLocalizedString(@"unit_times", nil)];
    NSArray *deArr=@[obj.deductionName,obj.deductionValue];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    formatter.timeZone=[NSTimeZone localTimeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[obj.startTime integerValue]];
    NSString *startTime = [formatter stringFromDate:confromTimesp];
    NSInteger startTimeNum=[[[startTime componentsSeparatedByString:@":"] objectAtIndex:0] integerValue]*60+[[[startTime componentsSeparatedByString:@":"] objectAtIndex:1] integerValue];
    NSInteger startSleepTime=[obj.asleepTime integerValue]+startTimeNum;
    NSInteger endSleepTime=[obj.duration integerValue]+[obj.asleepTime integerValue]+startTimeNum;
    NSString *startTimeStr=[NSString stringWithFormat:@"%02d:%02d",startSleepTime/60>=24?startSleepTime/60-24:startSleepTime/60,startSleepTime%60];
    NSString *endTimeStr =[NSString stringWithFormat:@"%02d:%02d",endSleepTime/60>=24?endSleepTime/60-24:endSleepTime/60,endSleepTime%60];
    NSString *sleepTime=[NSString stringWithFormat:@"%@(%@)~%@(%@)",startTimeStr,NSLocalizedString(@"asleep_point", nil),endTimeStr,NSLocalizedString(@"awake_point", nil)];
    NSString *deepPre=[NSString stringWithFormat:@"%d%%",[obj.MdDeepSleepPerc integerValue]];
    NSString *remPre=[NSString stringWithFormat:@"%d%%",[obj.MdRemSleepPerc integerValue]];
    NSString *lightPre=[NSString stringWithFormat:@"%d%%",[obj.MdLightSleepPerc integerValue]];
    NSString *wakePre=[NSString stringWithFormat:@"%d%%",[obj.MdWakeSleepPerc integerValue]];
//    NSString *breathPauseStr=[NSString stringWithFormat:@"%@",obj.breathPauseTimeString.length?obj.breathPauseTimeString:NSLocalizedString(@"nothing", nil)];
    
    NSString *tempRangeStr = [self rangeString:obj.eTempArray];
    tempRangeStr = [NSString stringWithFormat:@"%@℃", tempRangeStr];
    
    NSString *humRangeStr = [self rangeString:obj.eHumidityArray];
    humRangeStr = [NSString stringWithFormat:@"%@%@", humRangeStr, @"%"];
    
    //ahi
    NSString *ahIndex = obj.ahIndex ? [NSString stringWithFormat:@"%@",obj.ahIndex] : NSLocalizedString(@"nothing", nil);
    NSString *ahiArrayStr = obj.ahiArrayStr ? [NSString stringWithFormat:@"%@",obj.ahiArrayStr] : NSLocalizedString(@"nothing", nil);
    NSString *breathPauseAllTime = obj.breathPauseAllTime ? [NSString stringWithFormat:@"%@ %@",obj.breathPauseAllTime,NSLocalizedString(@"unit_s", nil)]: NSLocalizedString(@"nothing", nil);
    NSString *breathPauseTimes =obj.breathPauseTimes ? [NSString stringWithFormat:@"%@ %@",obj.breathPauseTimes,NSLocalizedString(@"unit_times", nil)]: NSLocalizedString(@"nothing", nil);
    NSString *csaDur = obj.csaDur ? [NSString stringWithFormat:@"%@ %@",obj.csaDur,NSLocalizedString(@"unit_s", nil)]: NSLocalizedString(@"nothing", nil);
    NSString *csaCnt = obj.csaCnt ? [NSString stringWithFormat:@"%@ %@",obj.csaCnt,NSLocalizedString(@"unit_times", nil)]: NSLocalizedString(@"nothing", nil);
    NSString *csaMaxDur = obj.csaMaxDur ? [NSString stringWithFormat:@"%@ %@",obj.csaMaxDur,NSLocalizedString(@"unit_s", nil)]: NSLocalizedString(@"nothing", nil);
    NSString *osaDur = obj.osaDur ? [NSString stringWithFormat:@"%@ %@",obj.osaDur,NSLocalizedString(@"unit_s", nil)]: NSLocalizedString(@"nothing", nil);
    NSString *osaCnt = obj.osaCnt ? [NSString stringWithFormat:@"%@ %@",obj.osaCnt,NSLocalizedString(@"unit_times", nil)]: NSLocalizedString(@"nothing", nil);
    NSString *osaMaxDur = obj.osaMaxDur ? [NSString stringWithFormat:@"%@ %@",obj.osaMaxDur,NSLocalizedString(@"unit_s", nil)]: NSLocalizedString(@"nothing", nil);
    
    return  @[date,score,deArr,sleepTime,duration,asleepTime,averageHeartRate,averageBreathRate,ahIndex,ahiArrayStr,breathPauseAllTime,breathPauseTimes,csaDur,csaCnt,csaMaxDur,osaDur,osaCnt,osaMaxDur,deepPre,remPre,lightPre,wakePre,wakes,turnOver,bodyMovement,leaveBed, tempRangeStr, humRangeStr];
}


@end
