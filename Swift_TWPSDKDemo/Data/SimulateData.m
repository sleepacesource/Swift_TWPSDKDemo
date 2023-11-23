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
    obj.farmlyID=[NSNumber numberWithInteger:0];
    obj.memID=[NSNumber numberWithInteger:0];
    obj.date=@"2020-05-28";
    obj.duration=[NSNumber numberWithInteger:503];
    obj.startTime=[NSNumber numberWithInteger:1590678829];
    obj.score=[NSNumber numberWithInteger:80];
    obj.light=[NSNumber numberWithInteger:162];
    obj.rem=[NSNumber numberWithInteger:243];
    obj.deep=[NSNumber numberWithInteger:68];
    obj.wake=[NSNumber numberWithInteger:6];
    obj.MdDeepSleepPerc=[NSNumber numberWithInteger:13];
    obj.MdRemSleepPerc=[NSNumber numberWithInteger:49];
    obj.MdLightSleepPerc=[NSNumber numberWithInteger:32];
    obj.MdWakeSleepPerc=[NSNumber numberWithInteger:6];
    
    obj.MdWakeUpTime=[NSNumber numberWithInteger:18];
    obj.wake_times=[NSNumber numberWithInteger:0];
    obj.tdcs=[NSNumber numberWithInteger:21];
    obj.fscs=[NSNumber numberWithInteger:65];
    obj.pjxl=[NSNumber numberWithInteger:69];
    obj.pjhxl=[NSNumber numberWithInteger:20];
    obj.zgxl=[NSNumber numberWithInteger:77];
    obj.zghxl=[NSNumber numberWithInteger:24];
    obj.zdxl=[NSNumber numberWithInteger:56];
    obj.zdhxl=[NSNumber numberWithInteger:12];
    obj.xtghsc=[NSNumber numberWithInteger:0];
    obj.hxgssc=[NSNumber numberWithInteger:0];
    obj.hxghsc=[NSNumber numberWithInteger:0];
    obj.hxztcs=[NSNumber numberWithInteger:0];
    obj.hxztsc=[NSNumber numberWithInteger:0];
    obj.xtztcs=[NSNumber numberWithInteger:0];
    obj.xtztsc=[NSNumber numberWithInteger:0];
    obj.lccs=[NSNumber numberWithInteger:0];
    obj.lcsc=[NSNumber numberWithInteger:0];
    
    obj.timeStep=[NSNumber numberWithInteger:60];
    obj.recordCount=[NSNumber numberWithInteger:503];
    obj.stopMode=[NSNumber numberWithInteger:0];
    obj.isupload=[NSNumber numberWithInteger:1];
    obj.reportFlag=[NSNumber numberWithInteger:1];
    obj.breathRateString=@"[13,13,12,16,16,14,13,15,15,17,20,19,20,19,20,20,20,18,19,19,20,20,20,21,21,21,21,21,21,21,21,21,21,22,21,21,21,22,22,21,21,21,21,21,21,22,22,21,21,20,21,21,21,22,21,20,21,21,20,21,20,20,21,20,21,20,22,22,20,21,20,20,20,20,20,21,20,21,20,17,15,13,12,12,13,14,19,19,20,19,20,20,20,20,21,19,19,21,20,21,21,21,21,19,20,20,20,20,21,21,21,21,21,21,21,21,21,20,21,21,21,20,20,20,21,21,20,21,20,21,21,21,20,21,20,19,19,19,17,19,19,19,18,20,19,17,20,21,20,21,20,20,20,19,19,19,18,20,19,19,20,20,20,19,19,19,18,19,20,20,21,20,20,20,19,16,16,19,18,19,19,18,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,19,20,20,19,19,20,20,20,20,20,19,20,20,20,19,21,19,18,19,19,19,20,19,18,19,20,18,16,16,19,22,19,20,21,17,17,17,20,17,16,21,15,19,19,21,20,21,22,20,19,14,16,18,17,21,24,20,23,22,21,22,22,23,20,19,19,19,19,19,19,20,19,20,20,20,20,19,20,20,15,18,19,15,18,17,19,19,19,19,19,19,20,20,20,20,20,20,20,19,20,20,20,19,20,19,19,20,20,20,19,19,20,19,18,19,19,19,19,20,19,17,16,18,19,19,18,18,18,20,20,17,19,20,20,20,20,19,21,20,20,21,19,21,22,21,19,20,21,20,21,19,21,22,13,22,18,19,17,19,19,19,18,18,18,22,19,18,19,19,19,19,20,20,20,19,19,20,20,19,19,20,20,20,20,20,20,20,20,21,20,20,20,20,20,19,20,20,20,20,19,19,17,18,17,18,16,18,18,18,19,18,13,14,19,19,17,18,19,19,19,19,19,21,18,18,18,19,18,18,20,20,20,17,20,23,22,21,21,20,21,21,18,21,20,24,24,20,19,20,22,21,20,20,23,22,21,20,19,17,20,21,20,20,19,21,20,19,20,21,20,18,18,19,20,20,19,19,20,19,19,20,20,20,21,21,21,21,20,20,19,19,19]";
    obj.heartRateString=@"[61,61,68,70,65,69,62,65,67,66,75,72,69,69,65,63,65,67,70,74,72,71,70,71,72,73,75,71,75,75,72,73,71,73,70,74,71,69,70,70,74,64,71,70,69,68,71,70,73,69,73,71,71,70,71,72,69,64,69,72,63,66,72,74,75,74,70,74,65,70,69,64,64,56,64,68,66,67,58,67,67,70,67,70,66,67,75,75,75,73,75,74,73,74,72,73,74,74,73,73,73,73,73,71,73,72,70,71,71,72,71,69,71,68,71,68,69,66,71,71,66,72,68,71,72,71,70,69,66,69,70,72,70,73,69,68,69,69,67,70,69,68,70,71,73,72,72,72,75,75,74,75,75,75,74,75,76,71,73,74,71,72,72,69,68,72,70,71,72,72,70,71,72,72,70,67,67,65,71,68,67,67,67,69,68,70,69,70,64,67,68,67,65,68,67,72,68,68,69,65,66,64,57,62,61,57,63,66,66,68,67,68,74,67,65,67,68,68,66,67,69,68,63,69,68,67,63,68,69,68,70,73,65,70,70,68,69,74,68,72,66,57,66,64,73,72,74,71,65,63,60,56,66,73,73,71,72,68,74,77,74,72,75,74,76,77,74,76,72,72,74,74,74,72,72,72,73,72,69,68,68,67,64,68,66,67,66,67,66,66,67,65,68,66,65,66,68,67,68,67,65,67,66,67,65,67,65,63,64,66,68,68,68,66,64,65,67,67,67,67,67,66,65,66,66,66,65,66,67,64,64,65,67,65,69,66,66,70,70,66,60,65,65,67,67,66,71,69,71,68,65,68,72,68,65,67,68,70,74,69,69,71,70,72,71,69,69,70,68,70,70,67,71,68,69,69,70,70,69,70,70,69,70,70,70,69,69,70,70,70,69,70,70,70,65,73,64,64,69,71,70,68,68,68,71,69,67,68,69,67,65,65,66,65,64,68,68,67,60,62,63,57,69,68,68,71,66,65,66,66,71,71,66,66,64,61,66,61,64,65,60,63,63,59,64,63,68,62,63,64,63,65,66,62,68,65,66,67,68,68,71,70,71,68,68,72,69,72,69,69,69,71,70,68,70,70,70,71,71,69,70,71,69,70,69,68,70,64,64,65,64]";
    obj.statusString=	@"[6,6,6,6,6,6,6,6,6,0,0,6,4,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,6,6,0,0,0,6,0,0,0,0,6,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,4,4,6,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,6,6,0,6,0,0,0,0,6,0,0,0,6,6,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,4,0,6,0,0,0,0,6,0,0,0,0,0,6,0,6,0,6,0,0,0,0,6,4,0,0,6,6,0,0,0,0,0,4,0,0,4,0,0,4,6,6,4,0,0,6,0,0,6,0,6,0,0,6,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,6,6,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,6,6,0,6,0,0,0,6,0,0,6,0,0,6,0,0,0,4,0,0,0,0,0,0,0,0,0,0,6,0,0,0,6,0,0,0,0,0,6,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,6,0,6,0,0,0,4,6,0,0,0,0,6,6,0,0,0,4,0,0,0,0,0,0,6,0,0,0,6,0,0,0,0,0,6,0,0,0,0,0,0,0,0,6,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,6,0,0,0,4]";
    obj.statusValueString=	@"[1,1,2,1,2,1,1,1,1,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0,2,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,1,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,2,0,1,0,1,0,0,0,0,1,1,0,0,1,1,0,0,0,0,0,4,0,0,1,0,0,1,1,1,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,2,0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1]";
    obj.sleepStateStr=	@"[0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0]";
    obj.SleepCurveStr=@"[0.0,-0.02390194,-0.048755884,-0.0092663765,-0.030327082,-0.022876978,-0.009778738,-0.015239954,-0.015892982,-0.03026104,-0.023267984,0.0,0.41088653,0.4838357,0.5624666,0.64701104,0.73793054,0.83545613,0.9388273,1.0477833,1.1262244,1.2055237,1.2852142,1.3655045,1.4461082,1.5266601,1.6068257,1.6861652,1.7642564,1.8406931,1.9150833,1.9868163,2.0555234,2.1218374,2.1858997,2.2477946,2.307791,2.3659873,2.4218159,2.4749823,2.5255094,2.5729349,2.6172369,2.6583753,2.695948,2.7298849,2.7603347,2.7874355,2.8110838,2.8308628,2.8468835,2.8592496,2.8681924,2.8739429,2.8758907,2.8742669,2.8697643,2.8626142,2.8530471,2.8403378,2.824717,2.8061848,2.784741,2.7606168,2.734348,2.703791,2.6689448,2.6298099,2.5863864,2.5402822,2.4904256,2.4368162,2.3805265,2.321556,2.2609775,2.1971824,2.1301706,2.0599422,1.9864975,1.909836,1.8321024,1.7532966,1.6734186,1.5924685,1.5099101,1.4268156,1.3431852,1.2579463,1.1710991,1.0826436,0.9974048,0.9164548,0.83979344,0.76742077,0.69933677,0.6366136,0.58181906,0.53495336,0.49601603,0.4650073,0.44395876,0.4342246,0.43580508,0.4486997,0.47290897,0.5052161,0.54725766,0.5990336,0.6605439,0.73314285,0.81575847,0.90582323,1.003337,1.1082995,1.2193568,1.3337998,1.4495975,1.565395,1.6805153,1.793604,1.9046612,2.0082695,2.1028948,2.1885366,2.2638412,2.328808,2.3817236,2.4225876,2.4514,2.4695153,2.4776106,2.4729352,2.4568431,2.4300117,2.3929386,2.3456233,2.2907748,2.2299273,2.163081,2.0919492,2.0156758,1.9368311,1.8571296,1.7757138,1.6925844,1.6094548,1.5288961,1.4517655,1.3797771,1.3146445,1.2580822,1.2083759,1.1655257,1.1295315,1.0986793,1.0721122,1.047259,1.0224059,0.99840975,0.97441363,0.9487035,0.92213655,0.89385533,0.86214614,0.8261521,0.7850158,0.7404516,0.69245934,0.6427531,0.5930469,0.54334044,0.49620533,0.45078397,0.40536284,0.3616557,0.31966257,0.27938342,0.24253201,0.20910907,0.17911386,0.15254664,0.13304996,0.12062383,0.11355424,0.11376929,0.12298298,0.14398122,0.17762065,0.2256155,0.28710866,0.3639214,0.4560535,0.5617912,0.6738498,0.7922287,0.9124291,1.0308081,1.145286,1.2558626,1.358378,1.4523149,1.5345482,1.6040429,1.6605402,1.7040402,1.7329803,1.7468429,1.7456282,1.7366211,1.7198215,1.6988716,1.673513,1.6458257,1.615292,1.5824294,1.5472379,1.5089413,1.4685745,1.4279491,1.3868061,1.3448869,1.3021914,1.2589784,1.2152479,1.1720349,1.1288218,1.0863851,1.0452423,1.0061696,0.96916676,0.93423414,0.90214777,0.8729079,0.8449619,0.81882715,0.79450345,0.77173257,0.75077295,0.7326596,0.7163577,0.7023845,0.6905534,0.6803472,0.67084503,0.6637008,0.6600938,0.6601677,0.66458416,0.6733432,0.68486285,0.70013547,0.71993756,0.74441266,0.77285695,0.8052702,0.842314,0.8843188,0.9312849,0.9838736,1.0401007,1.0993044,1.1621463,1.2266421,1.2914685,1.3586103,1.427075,1.4968628,1.5676428,1.6390843,1.7098643,1.7793213,1.8467938,1.9119511,1.9747932,2.0356507,2.094193,2.1484356,2.19904,2.2469985,2.2916493,2.3329928,2.3703673,2.403442,2.4322171,2.4580154,2.4808369,2.5000203,2.5165577,2.5311105,2.5430174,2.5526092,2.560547,2.567162,2.5734463,2.5800614,2.587007,2.594945,2.6032135,2.6114824,2.619751,2.6254094,2.629119,2.6302183,2.6280456,2.6217432,2.6113105,2.5967479,2.5768666,2.5510044,2.5185006,2.4778352,2.429008,2.3726807,2.309184,2.237758,2.1610131,2.0789492,1.9915664,1.897345,1.7962849,1.6883862,1.5751684,1.459671,1.342654,1.2241174,1.1071006,0.9916034,0.8776257,0.76668763,0.66106844,0.5607681,0.46864343,0.38584852,0.3139031,0.25432658,0.20827365,0.17422414,0.14950418,0.13450837,0.12981343,0.13389993,0.14792228,0.17188,0.20425367,0.24352312,0.29026628,0.34047174,0.39298534,0.4478073,0.50493765,0.56437635,0.62612295,0.69133234,0.75769544,0.82463574,0.89215326,0.9579396,1.0219947,1.0843184,1.1449109,1.2043494,1.2637879,1.3243805,1.3849732,1.4455658,1.5050043,1.5632886,1.6204188,1.6787031,1.7381415,1.7981571,1.8599038,1.9233818,1.988591,2.054377,2.1195862,2.1842184,2.2471192,2.3082888,2.3677273,2.4242802,2.4767938,2.5252676,2.5685482,2.6060839,2.636249,2.6590433,2.6744666,2.682519,2.684355,2.6788723,2.663868,2.6393418,2.6053464,2.5618815,2.5095506,2.4495077,2.381753,2.3062863,2.22476,2.139378,2.0501401,1.9559444,1.8578929,1.7559853,1.6535268,1.5505176,1.4469572,1.3439479,1.2431419,1.1461921,1.0541998,0.9660635,0.881783,0.80025697,0.7231376,0.65262866,0.58983135,0.53364444,0.48406744,0.43952513,0.40222073,0.37340903,0.35309076,0.33961272,0.33187366,0.32814407,0.33078074,0.33978367,0.35515332,0.3739817,0.3965757,0.42293525,0.45431566,0.48946166,0.5277457,0.5679126,0.6112175,0.6576605,0.7072413,0.7593324,0.81330657,0.8679085,0.92439294,0.9827602,1.0442656,1.1063987,1.167904,1.2275265,1.2865216,1.3448888,1.4045113,1.464134,1.5237564,1.583379,1.6436291,1.7057621,1.771033,1.8369317,1.9022027,1.9668462,2.030862,2.0942502,2.157011,2.2170706,2.2744288,2.321446,2.356866,2.380471,2.3922608,2.3922355,2.380395,2.3590374,2.328801,2.2898407,2.240669,2.179567,2.1044376,1.9323946,1.7599146,1.5869977,1.4206567,1.2608914,1.1079205,0.948879,0.0,-0.003945112,-0.03508711,-0.040005922,-0.015654087,-0.03130102]";
    obj.sleepCurveStatusStr=@"[0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0]";
    
    obj.deductionName=@[@"deduction_breathe_fast",@"restless",@"start_sleep_time_too_latter",@"wake_times_too_much",@"benign_sleep"];
    obj.deductionValue=@[@"-1",@"-3",@"-1",@"-8",@"-7"];
    obj.breathPauseTimeString = @"";
    obj.asleepTime=[NSNumber numberWithInteger:12];
    obj.weekday=@"28";
    obj.week=@"30";
    obj.month=@"5";
    obj.year=@"2020";
    obj.bedTimeStr=@"23:13";
    obj.wakeUpTimeStr=@"07:18";
    //    obj.source=[NSNumber numberWithInteger:6];
    obj.timezone=[NSNumber numberWithInteger:28800];
    obj.arithmeticVer=@"";
    obj.eHumidityArray = [NSMutableArray arrayWithObjects:@(21), @(24), @(25), @(30), @(26), @(29), nil];
    obj.eTempArray = [NSMutableArray arrayWithObjects:@(46), @(63), @(49), @(55), @(66), @(57), nil];
    
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
    obj.sleepCurveStatusStr=[NSString stringWithFormat:@"[%@]",[[analysisDic objectForKey:@"sleepCurveStatusArray"] componentsJoinedByString:@","]];
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
