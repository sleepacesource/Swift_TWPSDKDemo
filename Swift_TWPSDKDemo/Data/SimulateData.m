//
//  simulateData.m
//  RestonSDKDemo
//
//  Created by San on 2017/8/9.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "SimulateData.h"
#import "SimulateData+ScoreDeduction.h"

@implementation SimulateData

+ (NSArray *)backDeductionArrayyFromAnalysis:(NSArray*)scoreDeductionArray
{
    NSMutableArray * deductionNameArr=[[NSMutableArray alloc]initWithCapacity:0];
    NSMutableArray * deductionValueArr=[[NSMutableArray alloc]initWithCapacity:0];
    
    for (int index=0; index<scoreDeductionArray.count; index++) {
        int score = [scoreDeductionArray[index] intValue];
        if (score > 0) {
            switch (index) {
                case 0:
                    [deductionNameArr addObject:@"restless"];
                    break;
                case 1:
                    [deductionNameArr addObject:@"deduction_breathe_fast"];
                    break;
                case 2:
                    [deductionNameArr addObject:@"deduction_breathe_slow"];
                    break;
                case 3:
                    [deductionNameArr addObject:@"respiration_pause"];
                    break;
                case 4:
                    [deductionNameArr addObject:@"fall_asleep_hard"];
                    break;
                case 5:
                    [deductionNameArr addObject:@"heartrate_too_fast"];
                    break;
                case 6:
                    [deductionNameArr addObject:@"heartrate_too_low"];
                    break;
                case 7:
                    [deductionNameArr addObject:@"heart_pause"];
                    break;
                case 8:
                    [deductionNameArr addObject:@"md_leave_bed_decrease_scale"];
                    break;
                case 9:
                    [deductionNameArr addObject:@"deep_sleep_time_too_short"];
                    break;
                case 10:
                    [deductionNameArr addObject:@"benign_sleep"];
                    break;
                case 11:
                    [deductionNameArr addObject:@"actual_sleep_short"];
                    break;
                case 12:
                    [deductionNameArr addObject:@"md_sleep_time_increase_scale"];
                    break;
                case 13:
                    [deductionNameArr addObject:@"start_sleep_time_too_latter"];
                    break;
                case 14:
                    [deductionNameArr addObject:@"wake_times_too_much"];
                    break;
                default:
                    break;
            }
            [deductionValueArr addObject:[NSString stringWithFormat:@"-%d",score]];
        }
    }
    return @[deductionNameArr,deductionValueArr];
}


+ (UserObj *)simulateLongData
{
    UserObj *obj=[[UserObj alloc]init];
    obj.ahiFlag = [NSNumber numberWithInteger:1];
    obj.farmlyID=[NSNumber numberWithInteger:0];
    obj.memID=[NSNumber numberWithInteger:0];
    obj.date=@"2023-11-28";
    obj.duration=[NSNumber numberWithInteger:342];
    obj.startTime=[NSNumber numberWithInteger:1701133867];
    obj.score=[NSNumber numberWithInteger:43];
    obj.light=[NSNumber numberWithInteger:170];
    obj.rem=[NSNumber numberWithInteger:127];
    obj.deep=[NSNumber numberWithInteger:27];
    obj.wake=[NSNumber numberWithInteger:3];
    obj.MdDeepSleepPerc=[NSNumber numberWithInteger:7];
    obj.MdRemSleepPerc=[NSNumber numberWithInteger:37];
    obj.MdLightSleepPerc=[NSNumber numberWithInteger:51];
    obj.MdWakeSleepPerc=[NSNumber numberWithInteger:5];
    
    obj.MdWakeUpTime=[NSNumber numberWithInteger:344];
    obj.wake_times=[NSNumber numberWithInteger:3];
    obj.tdcs=[NSNumber numberWithInteger:0];
    obj.fscs=[NSNumber numberWithInteger:0];
    obj.pjxl=[NSNumber numberWithInteger:58];
    obj.pjhxl=[NSNumber numberWithInteger:17];
    obj.zgxl=[NSNumber numberWithInteger:72];
    obj.zghxl=[NSNumber numberWithInteger:22];
    obj.zdxl=[NSNumber numberWithInteger:51];
    obj.zdhxl=[NSNumber numberWithInteger:12];
    obj.xtghsc=[NSNumber numberWithInteger:0];
    obj.hxgssc=[NSNumber numberWithInteger:0];
    obj.hxghsc=[NSNumber numberWithInteger:0];
    obj.hxztcs=[NSNumber numberWithInteger:0];
    obj.hxztsc=[NSNumber numberWithInteger:0];
    obj.xtztcs=[NSNumber numberWithInteger:0];
    obj.xtztsc=[NSNumber numberWithInteger:0];
    obj.lccs=[NSNumber numberWithInteger:2];
    obj.lcsc=[NSNumber numberWithInteger:0];
    
    obj.timeStep=[NSNumber numberWithInteger:60];
    obj.recordCount=[NSNumber numberWithInteger:348];
    obj.stopMode=[NSNumber numberWithInteger:0];
    obj.isupload=[NSNumber numberWithInteger:1];
    obj.reportFlag=[NSNumber numberWithInteger:1];
    obj.breathRateString=@"[0, 13, 12, 12, 13, 13, 14, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 15, 12, 14, 12, 14, 18, 17, 20, 21, 22, 19, 21, 20, 19, 20, 20, 18, 22, 18, 21, 18, 20, 18, 20, 19, 18, 19, 21, 20, 19, 20, 19, 18, 12, 18, 17, 16, 15, 17, 18, 19, 19, 18, 19, 16, 20, 15, 18, 16, 18,17, 16, 13, 15, 16, 17, 16, 18, 16, 18, 16, 17, 15, 17, 16, 15, 16, 19, 15, 16, 15, 17, 18, 20, 20, 19, 16, 17, 18, 18, 18, 16, 17, 18, 18, 19, 18, 17, 15, 19, 17, 19, 19, 17, 19, 17, 16, 17, 18, 17, 19, 18, 20, 22, 19, 22, 22, 22, 22, 21, 21, 18, 21, 20, 22, 20, 21, 22, 21, 19, 22,17, 22, 21, 19, 15, 17, 16, 16, 20, 18, 16, 18, 16, 16, 18, 17, 18, 15, 18, 18, 16, 20, 19, 18, 18, 16, 15, 17, 18, 18, 18, 18, 15, 19, 19, 19, 18, 17, 18, 17, 16, 17, 17, 18, 17, 17, 17, 18, 18, 18, 19, 18, 16, 17, 17, 17, 17, 17, 16, 20, 18, 17, 0, 15, 15, 19, 17, 17, 20, 13, 12,0, 13, 16, 16, 16, 0, 16, 14, 13, 18, 22, 16, 19, 22, 18, 19, 16, 12, 16, 17, 13, 0, 17, 18, 17, 18, 18, 13, 19, 17, 17, 18, 18, 17, 18, 18, 17, 14, 13, 17, 16, 15, 15, 17, 13, 12, 17, 17, 16, 19, 15, 17, 12, 16, 16, 17, 12, 19, 18, 12, 17, 16, 16, 20, 15, 20, 21, 19, 19, 19, 20, 19,18, 20, 21, 20, 18, 18, 17, 19, 17, 19, 17, 13, 13, 17, 15, 16, 17, 0, 0, 0, 16, 16, 17, 14, 19, 20, 21, 21, 21, 19, 18, 19, 19, 18, 19, 19, 17, 19, 20, 18, 13, 15, 15, 17, 17, 15, 19, 18, 18, 18, 19, 19, 18, 16, 19, 19, 17, 17, 19, 15, 18, 16, 16, 19, 18, 19, 18]";
    obj.heartRateString=@"[0, 66, 60, 61, 60, 62, 61, 66, 62, 68, 72, 72, 72, 72, 0, 0, 0, 66, 57, 60, 61, 61, 57, 61, 63, 60, 61, 60, 61, 62, 58, 59, 56, 61, 57, 62, 56, 56, 58, 55, 56, 59, 58, 56, 57, 58, 54, 57, 57, 63, 57, 60, 55, 59, 55, 58, 56, 52, 54, 60, 57, 55, 54, 59, 59, 59,57, 54, 60, 54, 56, 57, 61, 58, 58, 56, 60, 57, 60, 52, 56, 55, 60, 54, 56, 55, 58, 61, 57, 54, 58, 51, 57, 53, 55, 55, 53, 52, 57, 54, 54, 55, 60, 57, 55, 61, 57, 54, 54, 60, 61, 56, 60, 57, 56, 54, 57, 56, 56, 59, 66, 61, 59, 62, 63, 56, 55, 53, 54, 57, 58, 62, 54, 60, 64, 61, 61,60, 54, 53, 57, 57, 61, 62, 68, 56, 60, 58, 60, 57, 55, 57, 53, 60, 61, 60, 59, 57, 55, 57, 54, 54, 57, 57, 59, 56, 54, 57, 58, 56, 54, 55, 56, 53, 54, 55, 54, 54, 61, 53, 53, 56, 55, 59, 54, 57, 54, 55, 54, 57, 54, 52, 57, 54, 57, 52, 56, 58, 68, 61, 60, 62, 61, 57, 58, 59, 63, 57,63, 55, 57, 59, 53, 56, 53, 61, 59, 61, 58, 63, 55, 58, 64, 68, 66, 55, 55, 60, 60, 59, 56, 56, 57, 57, 55, 60, 59, 67, 56, 56, 58, 57, 53, 63, 52, 55, 62, 57, 60, 59, 64, 61, 62, 62, 56, 58, 58, 57, 62, 63, 57, 60, 61, 60, 62, 58, 62, 61, 59, 57, 60, 56, 60, 64, 66, 63, 61, 63, 58, 57, 58, 58, 56, 56, 57, 54, 63, 59, 67, 58, 54, 54, 60, 63, 60, 60, 56, 68, 0, 0, 0, 66, 59, 60, 58, 55, 55, 56, 61, 55, 54, 55, 55, 56, 56, 54, 59, 60, 57, 56, 58, 55, 54, 57, 60, 54, 57, 53, 56, 56, 55, 58, 56, 56, 58, 55, 58, 56, 56, 57, 60, 65, 55, 56, 54, 59, 57, 56 ]";
    obj.statusString=@"[0, 1, 1, 1, 1, 1, 1, 1, 1, 17, 17, 17, 17, 17, 0, 0, 0, 35, 34, 34, 35, 34, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 34, 1, 1, 1, 1, 1, 1, 1, 35, 1, 1, 35, 1, 1, 1, 34, 34, 34, 1, 34, 1, 1, 1, 1, 1, 1, 1, 1, 35, 34, 34, 1, 35, 1, 1, 1, 35, 1, 34, 34, 1, 1, 1, 1, 1, 34,34, 1, 34, 35, 1, 35, 1, 35, 1, 1, 34, 1, 1, 1, 1, 1, 1, 1, 35, 1, 1, 35, 35, 34, 34, 1, 1, 35, 1, 35, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 1, 35, 35, 1, 1, 34, 34, 1, 1, 1, 1, 1,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 35, 1, 17, 34, 1, 1, 34, 1, 1, 1, 1, 17, 1, 1, 1, 1, 17, 1, 1, 34, 35, 1, 1, 35, 1, 1, 1, 1, 1, 1, 1, 35, 17, 35, 34, 1, 1, 34, 1, 34, 1, 1, 1, 34, 1, 1, 35, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 34,35, 1, 34, 1, 34, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 35, 34, 35, 34, 34, 35, 0, 0, 0, 35, 34, 35, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 1, 1, 1, 34, 35, 34, 35, 1, 34, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 34, 34, 1, 34, 1, 1, 1, 1, 1 ]";
    obj.statusValueString =@"[24, 0, 0, 0, 0, 0, 0, 0, 0, 39, 60, 60, 60, 60, 42, 60, 41, 1, 1, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 2, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1,0, 1, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 2, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 12, 1, 0, 0, 1, 0, 0, 0, 0, 13, 0, 0, 0, 0, 11, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 12, 1, 1, 0, 0, 2, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 55, 60, 38, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 2, 0, 2, 0, 0, 0, 0, 0]";
    obj.SleepCurveStr=@"[0,0,0.90709543,1.0710061,1.1770587,1.2434365,1.2875129,1.3291332,1.4370048,1.4920353,1.5267947,1.5501891,1.5662099,1.4261433,0,0,0,0,0,0.037264824,0.14261603,0.29783726,0.47608972,0.6465516,0.7797487,0.8526497,0.8526497,0.7797487,0.6465516,0.47608995,0.2978375,0.14261627,0.037264824,0,0,0,0.14438295,0.2832799,0.41167784,0.52957654,0.63396525,0.7166753,0.7982397,0.87707186,0.952605,1.0249429,1.0948639,1.1616948,1.2257993,1.2878717,1.3482281,1.4057442,1.4604199,1.5103093,1.5551188,1.5941383,1.6270739,1.6542197,1.675698,1.692158,1.7036608,1.7094963,1.7106683,1.7064668,1.6963043,1.6804746,1.6598105,1.6357323,1.6095984,1.5819966,1.5532202,1.5223882,1.4897944,1.4560261,1.421377,1.3864341,1.3520786,1.3180165,1.2854228,1.2540035,1.2234653,1.1943953,1.1662061,1.1383107,1.1107087,1.0834005,1.0575604,1.0323077,1.0070549,0.9818022,0.95537496,0.927773,0.8992903,0.8699267000000001,0.8408568,0.81266737,0.7859218,0.7617698000000001,0.7413862,0.72503996,0.7121558,0.7024529,0.6967871,0.6951832999999999,0.6976168,0.7049687,0.71635795,0.7314906,0.7503178,0.77226496,0.7973068,0.8248813,0.8544252,0.8870644600000001,0.92336154,0.9644418,1.0105869,1.0609525,1.1161014,1.1757523,1.2393423,1.3074344,1.3794657,1.4543108,1.5311253,1.6093466,1.6889749,1.7694472,1.8496381,1.9284223,2.0049555,2.0792377,2.1515503,2.2218933,2.2899854,2.3558264,2.418291,2.477942,2.5342164,2.5865514,2.633717,2.675045,2.7110987,2.74121,2.7633758,2.777596,2.7825356,2.7781944,2.7645721,2.7416692,2.7100482,2.6702719,2.6223402,2.5668159,2.505387,2.4392846,2.3691757,2.2950606,2.217607,2.138818,2.0586936,1.9799047,1.902451,1.8263329,1.7528857,1.6834446,1.6180097,1.5579164,1.5041708,1.4577787,1.4207522,1.3951033,1.3808322,1.3779386,1.3874286,1.4103084,1.4452422,1.4902184,1.5452367,1.6069499,1.6740224,1.7464544,1.8219043,1.8993661,1.977834,2.0542898,2.1267219,2.1951296,2.2595136,2.3188674,2.3721852,2.4194672,2.4607131,2.495923,2.5271091,2.553076,2.5726287,2.5867734,2.5949125,2.5952532,2.5882041,2.5737655,2.5519369,2.5227184,2.4873054,2.4456978,2.397895,2.3465075,2.2927296,2.2365618,2.178601,2.1200428,2.0596921,1.9981464,1.9371982,1.877445,1.8182893,1.7597313,1.7011732,1.64142,1.5804718,1.5183284,1.4537951,1.3862741,1.3169606,1.2452568,1.171163,1.097069,1.0229752,0.9494786,0.8777749500000001,0.8084612,0.7415378,0.6776016,0.61665344,0.55869293,0.5037198000000001,0.45292974,0.40452957,0.35732484,0.3119123,0.2712798,0.23363543,0.20085192,0.17301035,0.14891553,0.12856793,0.11400223,0.10521865,0.1028955,0.108389616,0.12170076,0.14223146,0.17185545,0.2098937,0.25558782,0.30730653,0.36564708,0.42737985,0.49182606,0.56034255,0.6329293,0.70822954,0.7876003,0.87036276,0.9558387,1.0426714,1.1315392,1.2210854,1.3126668,1.4076401,1.50397,1.6003001,1.6973084,1.7936385,1.8865768,1.9754446,2.0588853,2.1347563,2.2028422,2.2622495,2.314012,2.357236,2.3924918,2.4189942,2.4367428,2.446416,2.4493706,2.4047482,2.2923949,2.1319323,1.931616,1.7012529,1.4514353,1.1837181,0.90121365,0.60781336,0.30663085,0,0,0,0,0,0.008953333000000001,0.035660505,0.07966447,0.1402123,0.21626782,0.30653024,0.4094541,0.52327967,0.6460581,0.77568984,0.9099555,1.0465592,1.1831626,1.3174286,1.44706,1.5698388,1.6836641,1.7865883,1.8768504,1.9529061,2.013454,2.057458,2.084165,2.0931187,2.089427,2.0796432,2.0684357,2.0553737,2.0399628,2.0208204,1.9960473,1.9631743,1.9194175,1.8615419,1.7176932,1.5730374,1.4275742,1.287342,1.1797023,1.054427,0.8782296000000001,0,-0.0052378178,-0.042135954,-0.04435301]";
    obj.sleepCurveStatusStr=@"[4,1,0,0,0,0,0,0,0,8,8,8,8,8,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,8,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0]";
    
    obj.deductionName=@[@"restless",@"deduction_breathe_slow",@"Apnea",@"md_leave_bed_decrease_scale",@"benign_sleep",@"actual_sleep_short",@"wake_times_too_much"];
    obj.deductionValue=@[@"-2",@"-1",@"-30",@"-2",@"-10",@"-10",@"-2"];
    obj.breathPauseTimeString = nil;
    obj.asleepTime=[NSNumber numberWithInteger:1];
    obj.weekday=@"28";
    obj.week=@"30";
    obj.month=@"11";
    obj.year=@"2023";
    obj.bedTimeStr=@"09:11";
    obj.wakeUpTimeStr=@"09:15";
    //    obj.source=[NSNumber numberWithInteger:6];
    obj.timezone=[NSNumber numberWithInteger:28800];
    obj.arithmeticVer=@"";
    obj.eHumidityArray = [NSMutableArray arrayWithObjects:@(44), @(48), nil];
    obj.eTempArray = [NSMutableArray arrayWithObjects:@(25), @(27), nil];
    
    obj.ahIndex = [NSNumber numberWithInteger:33];
    obj.ahiArrayStr = [self backBreathPauseTimes:@"[2316,3639,6,4,34,29,68,34,20]"];
    obj.breathPauseAllTime = [NSNumber numberWithInteger:5506];
    obj.breathPauseTimes = [NSNumber numberWithInteger:192];
    obj.csaDur = [NSNumber numberWithInteger:1994];
    obj.csaCnt = [NSNumber numberWithInteger:27];
    obj.csaMaxDur = [NSNumber numberWithInteger:155];
    obj.osaDur = [NSNumber numberWithInteger:3512];
    obj.osaCnt = [NSNumber numberWithInteger:165];
    obj.osaMaxDur = [NSNumber numberWithInteger:56];
    
    return obj;
}

+ (NSString *)simlateBreathPauseString
{
    NSArray *timeArray=@[@"09:30",@"09:58"];
    NSArray *timeVlaueArray=@[@"12",@"11"];
    NSMutableString *result=[[NSMutableString alloc]initWithCapacity:0];
    for (int i=0 ; i<2; i++) {
        NSString *second=[NSString stringWithFormat:@"%d",i+1];
        NSString *bstr=[NSString stringWithFormat:NSLocalizedString(@"sequence", nil), second];
        if (i==1) {
            [result appendString:[NSString stringWithFormat:@"%@ %@  %@s",bstr,timeArray[i],timeVlaueArray[i]]];
        }
        else
            [result appendString:[NSString stringWithFormat:@"%@ %@  %@s\n",bstr,timeArray[i],timeVlaueArray[i]]];
    }
    return result;
}

+ (UserObj *)simulateShortData
{
    UserObj *obj=[[UserObj alloc]init];
    obj.date=@"2020-06-02";
    obj.timezone=[NSNumber numberWithInteger:28800];
    obj.duration=[NSNumber numberWithInteger:34];
    obj.startTime=[NSNumber numberWithInteger:1591072247];
    obj.pjxl=[NSNumber numberWithInteger:68];
    obj.pjhxl=[NSNumber numberWithInteger:18];
    obj.tdcs=[NSNumber numberWithInteger:99];
    obj.fscs=[NSNumber numberWithInteger:26];
    obj.zgxl=[NSNumber numberWithInteger:0];
    obj.zghxl=[NSNumber numberWithInteger:20];
    obj.recordCount=[NSNumber numberWithInteger:34];
    obj.asleepTime=[NSNumber numberWithInteger:24];
    obj.reportFlag=[NSNumber numberWithInteger:2];
    obj.arithmeticVer=@"";
    obj.eHumidityArray = [NSMutableArray arrayWithObjects:@(22), @(19), @(27), @(30), @(24), @(28), nil];
    obj.eTempArray = [NSMutableArray arrayWithObjects:@(51), @(62), @(48), @(57), @(65), @(59), nil];
    return obj;
}


+ (UserObj *)dealwithDataWithHistory:(NSDictionary *)history
{
    UserObj *obj=[[UserObj alloc]init];
    obj.farmlyID=[NSNumber numberWithInteger:0];
    obj.memID=[NSNumber numberWithInteger:0];
    obj.timezone=[NSNumber numberWithInteger:[[NSTimeZone systemTimeZone] secondsFromGMT]];
    
    NSDictionary *summaryDic = [history objectForKey:@"summary"];
    NSDictionary *analysisDic = [history objectForKey:@"analysis"];
    NSDictionary *detailDic = [history objectForKey:@"detail"];
    
    NSDate *startDate= [NSDate dateWithTimeIntervalSince1970:[[summaryDic objectForKey:@"startTime"] integerValue]];
    NSDateFormatter *sd = [[NSDateFormatter alloc] init];
    [sd setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:obj.timezone.intValue]];
    sd.dateFormat = @"yyyy-MM-dd";
    obj.date= [sd stringFromDate:startDate];
    
    int flag = [[summaryDic objectForKey:@"recordCount"] integerValue] >= 180?1:2;
    obj.reportFlag=[NSNumber numberWithInteger:flag];
    
    obj.ahiFlag = [NSNumber numberWithInteger:[[summaryDic objectForKey:@"ahiFlag"] integerValue]];
    obj.arithmeticVer= [NSString stringWithFormat:@"%@",[summaryDic objectForKey:@"arithmeticVer"]];
    
    //short report
    if (flag == 2) {
        obj.eHumidityArray = [detailDic objectForKey:@"eHumidity"];
        obj.eTempArray = [detailDic objectForKey:@"eTemp"];
        obj.duration=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"duration"]integerValue]];
        obj.startTime=[NSNumber numberWithInteger:[[summaryDic objectForKey:@"startTime"] integerValue]];
        obj.pjxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"averageHeartBeatRate"]integerValue]];
        obj.pjhxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"averageBreathRate"]integerValue]];
        obj.tdcs=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"bodyMovementTimes"]integerValue]];
        obj.fscs=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"trunOverTimes"]integerValue]];
        obj.zgxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"maxHeartBeatRate"]integerValue]];
        obj.zghxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"maxBreathRate"]integerValue]];
        obj.recordCount= [NSNumber numberWithInteger:[[summaryDic objectForKey:@"recordCount"] integerValue]];
        [NSNumber numberWithInteger:[[analysisDic objectForKey:@"fallAlseepAllTime"]integerValue]];
        return obj;
    }
    
    obj.eHumidityArray = [detailDic objectForKey:@"eHumidity"];
    obj.eTempArray = [detailDic objectForKey:@"eTemp"];
    obj.breathRateString=[NSString stringWithFormat:@"[%@]",[[detailDic objectForKey:@"breathRate"] componentsJoinedByString:@","]];
    obj.heartRateString=[NSString stringWithFormat:@"[%@]",[[detailDic objectForKey:@"heartRate"] componentsJoinedByString:@","]];
    obj.statusString=[NSString stringWithFormat:@"[%@]",[[detailDic objectForKey:@"status"] componentsJoinedByString:@","]];
    obj.statusValueString=[NSString stringWithFormat:@"[%@]",[[detailDic objectForKey:@"statusValue"] componentsJoinedByString:@","]];
    obj.SleepCurveStr=[NSString stringWithFormat:@"[%@]",[[analysisDic objectForKey:@"sleepCurveArray"] componentsJoinedByString:@","]];
    obj.sleepCurveStatusStr=[NSString stringWithFormat:@"[%@]",[[analysisDic objectForKey:@"sleepEventArray"] componentsJoinedByString:@","]];
    obj.duration=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"duration"]integerValue]];
    obj.startTime=[NSNumber numberWithInteger:[[summaryDic objectForKey:@"startTime"] integerValue]];
    obj.score=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"sleepScore"]integerValue]];
    obj.light=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"lightSleepAllTime"]integerValue]];
    obj.rem=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"inSleepAllTime"]integerValue]];
    obj.deep=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"deepSleepAllTime"]integerValue]];
    obj.wake=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"wakeAllTime"]integerValue]];
    obj.MdDeepSleepPerc=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"deepSleepPerc"]integerValue]];
    obj.MdRemSleepPerc=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"inSleepPerc"]integerValue]];
    obj.MdLightSleepPerc=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"lightSleepPerc"]integerValue]];
    obj.MdWakeSleepPerc=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"wakeSleepPerc"]integerValue]];;
    obj.MdWakeUpTime=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"wakeAndLeaveBedBeforeAllTime"]integerValue]];
    obj.wake_times=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"wakeTimes"]integerValue]];
    obj.tdcs=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"bodyMovementTimes"]integerValue]];
    obj.fscs=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"trunOverTimes"]integerValue]];
    //新AHI体动，翻身合并为一个参数,废弃翻身
    if(obj.ahiFlag.boolValue){
        obj.tdcs=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"bmCnt"]integerValue]];
    }
    obj.pjxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"averageHeartBeatRate"]integerValue]];
    obj.pjhxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"averageBreathRate"]integerValue]];
    obj.zgxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"maxHeartBeatRate"]integerValue]];
    obj.zghxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"maxBreathRate"]integerValue]];
    obj.zdxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"minHeartBeatRate"]integerValue]];
    obj.zdhxl=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"minBreathRate"]integerValue]];
    obj.hxghsc=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"breathRateSlowAllTime"]integerValue]];
    obj.timeStep=[NSNumber numberWithInteger:60];
    obj.stopMode=[NSNumber numberWithInteger:0];
    obj.isupload=[NSNumber numberWithInteger:1];
    obj.asleepTime=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"fallAlseepAllTime"]integerValue]];
    obj.recordCount = [NSNumber numberWithInteger:[[summaryDic objectForKey:@"recordCount"] integerValue]];
    obj.lccs=[NSNumber numberWithInteger:[[analysisDic objectForKey:@"leaveBedTimes"]integerValue]];
//    new add pararms
    
//    obj.breathPauseTimeString=[self backBreathPause:[analysisDic objectForKey:@"breathRateStatusAry"] user:obj];
    obj.ahIndex = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"ahIndex"]integerValue]];
    obj.ahiArrayStr = [self backBreathPauseTimes:[analysisDic objectForKey:@"ahiArrayStr"]];
    obj.breathPauseAllTime = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"breathPauseAllTime"]integerValue]];
    obj.breathPauseTimes = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"breathPauseTimes"]integerValue]];
    obj.csaDur = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"csaDur"]integerValue]];
    obj.csaCnt = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"csaCnt"]integerValue]];
    obj.csaMaxDur = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"csaMaxDur"]integerValue]];
    obj.osaDur = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"osaDur"]integerValue]];
    obj.osaCnt = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"osaCnt"]integerValue]];
    obj.osaMaxDur = [NSNumber numberWithInteger:[[analysisDic objectForKey:@"osaMaxDur"]integerValue]];
    
    NSTimeInterval startTime = obj.startTime.integerValue;//上床时间
    NSTimeInterval endTime = startTime + obj.recordCount.integerValue * 60;//起床时间
    NSTimeInterval awakeTime = endTime - obj.MdWakeUpTime.integerValue * 60;//醒来时间
    NSDate *asleepDate = [NSDate dateWithTimeIntervalSince1970:startTime];
    NSDate *wakeupDate = [NSDate dateWithTimeIntervalSince1970:awakeTime];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:obj.timezone.intValue]];
    df.dateFormat = @"HH:mm";
    obj.bedTimeStr = [df stringFromDate:asleepDate];
    obj.wakeUpTimeStr = [df stringFromDate:wakeupDate];   
    obj.breathPauseTimeString=[self backBreathPause:[analysisDic objectForKey:@"breathRateStatusAry"] user:obj];
    
    NSMutableArray *scoreList = [NSMutableArray array];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_body_move_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_breath_high_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_breath_low_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_breath_stop_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_fall_asleep_time_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_heart_high_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_heart_low_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_heart_stop_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_leave_bed_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_perc_deep_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_perc_effective_sleep_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_sleep_time_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_sleep_time_increase_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_start_time_decrease_scale"]intValue]]];
    [scoreList addObject:[NSNumber numberWithInt:[[analysisDic objectForKey:@"md_wake_cnt_decrease_scale"]intValue]]];
    
    obj.deductionName=[self backDeductionArrayyFromAnalysis:scoreList][0];
    obj.deductionValue=[self backDeductionArrayyFromAnalysis:scoreList][1];
    
    
    return obj;
}



@end
