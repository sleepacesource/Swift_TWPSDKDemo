//
//  DataViewController.m
//  RestonSDKDemo
//
//  Created by San on 2017/8/1.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "DataViewController.h"
#import "Tool.h"
#import "FixView.h"
#import "SleepView.h"
#import "UserObj.h"
#import "SimulateData.h"
#import "ToolKit.h"
#import "SLPTitleValueArrowTableViewCell.h"
#import "DealWithData.h"
#import "FontColor.h"
#import <SLPCommon/SLPCommon.h>
#import "MBProgressHUD.h"

@interface DataViewController ()<UITableViewDelegate,UITableViewDataSource,SleepViewDelegate>
{
    NSArray *simulateLongTimeTitle;
    NSArray *simulateShortTimetitle;
    NSArray *titleArray;
    NSArray *valueArray;
    
    UIView *myView;
    FixView *fixView;
    SleepView *sleepview;
    
    NSMutableArray *historyArr;
    
    BOOL isLongData;
}

@property (weak, nonatomic) IBOutlet UIButton *simulateDataShortBT;
@property (weak, nonatomic) IBOutlet UIButton *simulateDataLongBT;
@property (weak, nonatomic) IBOutlet UIButton *laestBT;
@property (weak, nonatomic) IBOutlet UITableView *myDataTableview;
@property (weak, nonatomic) IBOutlet UIScrollView *myscorollview;
@property (weak, nonatomic) IBOutlet UIView *cView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUI];
}


- (void)setUI
{
    //    self.myscorollview.contentSize=self.cView.frame.size;
    [self.myscorollview addSubview:self.cView];
    [Tool configSomeKindOfButtonLikeNomal:self.simulateDataShortBT];
    [Tool configSomeKindOfButtonLikeNomal:self.simulateDataLongBT];
     [Tool configSomeKindOfButtonLikeNomal:self.laestBT];
    
    self.myDataTableview.delegate=self;
    self.myDataTableview.dataSource=self;
    self.myDataTableview.scrollEnabled=NO;
    self.myDataTableview.rowHeight=UITableViewAutomaticDimension;
    self.myDataTableview.estimatedRowHeight=55;
    self.myDataTableview.allowsSelection=NO;
    self.myDataTableview.backgroundColor=[UIColor whiteColor];
    
    myView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.myDataTableview.frame.size.width, 180)];
    myView.backgroundColor=[UIColor whiteColor];
    [self setGraphviewUI];
    
    historyArr=[[NSMutableArray alloc]initWithCapacity:0];
    [self.simulateDataLongBT setTitle:NSLocalizedString(@"imitate_data_long", nil) forState:UIControlStateNormal];
    [self.simulateDataShortBT setTitle:NSLocalizedString(@"imitate_data_short", nil) forState:UIControlStateNormal];
    [self.laestBT setTitle:NSLocalizedString(@"last_sleep_report", nil) forState:UIControlStateNormal];
    
    if (@available(iOS 13.0, *)) {
        self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    } else {
        // Fallback on earlier versions
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    //
}

- (void)setGraphviewUI
{
    fixView = [[FixView alloc] initWithFrame:CGRectMake(30, 10,([[UIScreen mainScreen] bounds].size.width)-50, 140+13)];
    fixView.backgroundColor = [UIColor clearColor];
    [myView addSubview:fixView];
    
    sleepview = [[SleepView alloc] initWithFrame:CGRectMake(30, 13+10,([[UIScreen mainScreen] bounds].size.width)-50, 140)];
    sleepview.backgroundColor = [UIColor clearColor];
    sleepview.sleepDelegate = self;
    fixView.sleepView = sleepview;
    __weak FixView *myfixView = fixView;
    sleepview.PinBlock = ^(CGFloat x, CGFloat scale){
        myfixView.x = x;
        myfixView.scale = scale;
        [myfixView setNeedsDisplay];
    };
    [myView addSubview:sleepview];
    
    CGFloat h =kSleepViewGridHeight;
    NSArray *strings = [NSArray arrayWithObjects:NSLocalizedString(@"wake_", nil),NSLocalizedString(@"light_", nil),NSLocalizedString(@"mid_", nil),NSLocalizedString(@"deep_", nil), nil];
    CGSize labelSize = CGSizeMake(kDetailStatusWidth, h);
    UIFont *labelFont = [ToolKit fontWithSize:10.0];
    if ([ToolKit currentLangIsSimplifiedChinese]) {
        labelFont = [ToolKit fontWithSize:10.0];
    }else{
        labelFont = [ToolKit fontWithSize:8.0];
    }
    for (NSString *txt in strings){
        CGSize size = [ToolKit sizeOfString:txt font:labelFont];
        if (size.width > labelSize.width || size.height > labelSize.height){
            labelFont = [ToolKit fontWithSize:8.0];
            break;
        }
    }
    
    for (int i = 0; i<4; i++){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10+kFontHeight + kSleepViewGridHeight /2 + h * i, labelSize.width ,labelSize.height)];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [FontColor C3];
        label.text = strings[i];
        label.tag = 100+i;
        label.font = labelFont;
        [myView addSubview:label];
    }
}


///data
- (void)initData:(UserObj *)obj
{
    [fixView initDateTime:obj.startTime timeInterval:obj.recordCount timeZone:[obj.timezone intValue]];
    [fixView setNeedsDisplay];
    
    sleepview.frame = CGRectMake(30, 13+3+10, fixView.frame.size.width, fixView.frame.size.height);
    sleepview.asleepTime = [obj.asleepTime intValue];
    sleepview.currentObj = obj;
    //呼吸暂停、离床、心跳暂停都在这添加
    [sleepview sampleSleepData:obj.sleepStateStr status:obj.statusString];
    [sleepview setNeedsDisplay];
}

- (IBAction)simulateShortData:(id)sender {
    [self showReportwith:[SimulateData simulateShortData]];
}


- (IBAction)simulateLongData:(id)sender {
    [self showReportwith:[SimulateData simulateLongData]];
}


- (IBAction)getLaestReport:(id)sender {
    
    NSInteger startTime = [[NSDate date] timeIntervalSince1970];
    NSDictionary *dic = @{@"startTime":@(startTime) ,@"num": @(1) ,@"order": @(0),@"deviceType":@(SLPDeviceType_TWP2)};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [SLPSharedHTTPManager getDailyReport:dic timeOut:10.0 completion:^(BOOL result, id  _Nonnull responseObject, NSString * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (result) {
            if ([responseObject objectForKey:@"data"]&&[[responseObject objectForKey:@"status"] intValue] == 0) {
                NSArray *historyArr = [[responseObject objectForKey:@"data"] objectForKey:@"history"];
                NSDictionary *hisDic = [historyArr firstObject];
                [self showReportwith:[SimulateData dealwithDataWithHistory:hisDic]];
            }
        }
        else
        {
            NSLog(@"get report failed");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"getRpeortFailed", nil)  delegate:self cancelButtonTitle:NSLocalizedString(@"confirm", nil) otherButtonTitles: nil];
            [alert show];
        }
    }];
    
//    NSDictionary *dic = @{
//        @"startTime":@(1593573199),
//        @"endTime": @(startTime),
//        @"dateFormate": @"yyyy-MM-dd"
//    };
//
//    [SLPSharedHTTPManager getReportScore:dic timeOut:10.0 completion:^(BOOL result, id  _Nonnull responseObject, NSString * _Nonnull error) {
//        NSLog(@"response--------%@",responseObject);
//    }];
}


- (void)initTableviewTitle:(BOOL)longReport
{
    if (longReport) {
        titleArray=@[NSLocalizedString(@"collection_date", nil),
                     NSLocalizedString(@"sleep_scores", nil),
                     NSLocalizedString(@"deduction_points", nil),
                     NSLocalizedString(@"sleeping_time", nil),
                     NSLocalizedString(@"sleep_duration", nil),
                     NSLocalizedString(@"fall_asleep_duration", nil),
                     NSLocalizedString(@"heart_rate", nil),
                     NSLocalizedString(@"respiration_rate", nil),
                     NSLocalizedString(@"respiration_pause", nil),
                     NSLocalizedString(@"deep_sleep_proportion", nil),
                     NSLocalizedString(@"medium_sleep_proportion", nil),
                     NSLocalizedString(@"light_sleep_proportion", nil),
                     NSLocalizedString(@"sober_proportion", nil),
                     NSLocalizedString(@"wake_times", nil),
                     NSLocalizedString(@"turn_times", nil),
                     NSLocalizedString(@"body_times", nil),
                     NSLocalizedString(@"out_times", nil)
                     ];
    }
    else
    {
        titleArray=@[NSLocalizedString(@"collection_date", nil),
                     NSLocalizedString(@"sleeping_time", nil),
                     NSLocalizedString(@"inbed_time", nil),
                     NSLocalizedString(@"heart_rate", nil),
                     NSLocalizedString(@"respiration_rate", nil)
                     ];
        
    }
}

#pragma mark -UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return titleArray.count?2:0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section==0) {
        return 1;
    }
    else
        return titleArray.count-1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height=0.0001;
    switch (section) {
        case 1:
        {
            if (isLongData)
            {
                height=180.0f;
            }
        }
            break ;
        default:
            break;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=nil;
    switch (section) {
        case 1:
        {
            if (isLongData)
            {
                headView=myView;
            }
        }
            break ;
        default:
            break;
    }
    return headView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLPTitleValueArrowTableViewCell *cell = [SLPTitleValueArrowTableViewCell cellWithTableView:tableView];
    switch (indexPath.section) {
        case 0:
        {
            cell.titleLabel.text=titleArray[indexPath.row];
            cell.detailInfoLabel.text=[NSString stringWithFormat:@"%@",valueArray[indexPath.row]];
        }
            break;
        case 1:
        {
            if (isLongData) {
                cell.titleLabel.text=titleArray[indexPath.row+1];
                switch (indexPath.row) {
                    case 1:
                    {
                        cell.detailInfoLabel.text=[NSString stringWithFormat:@"%@",[self backDeductionStringFromName:[valueArray[indexPath.row+1] objectAtIndex:0] value:[valueArray[indexPath.row+1] objectAtIndex:1]]];
                    }
                        break;
                    default:
                    {
                        cell.detailInfoLabel.text=[NSString stringWithFormat:@"%@",valueArray[indexPath.row+1]];
                    }
                        break;
                }
            }
            else
            {
                cell.titleLabel.text=titleArray[indexPath.row+1];
                cell.detailInfoLabel.text=[NSString stringWithFormat:@"%@",valueArray[indexPath.row+1]];
            }
        }
            break ;
        default:
            break;
    }
    
    return cell;
    
}


- (void)showReportwith:(UserObj*)obj
{
    NSString *versionStr=[NSString stringWithFormat:NSLocalizedString(@"generate_sleep_report", nil),obj.arithmeticVer];
    int space=-120;
    if ([obj.reportFlag integerValue]==2) {
        isLongData=NO;
    }
    else
    {
        space=180;
        isLongData=YES;
        [self initData:obj];
    }
    valueArray=[DealWithData backDataArray:obj];
    [self initTableviewTitle:isLongData];
    CGRect rect=self.view.frame;
    int  height=titleArray.count*40+rect.size.height+space;
    rect.size.height=height;
    self.myscorollview.contentSize=rect.size;
    [self.myDataTableview reloadData];
}

- (NSString*)backDeductionStringFromName:(NSArray *)nameArr value:(NSArray *)valueArr
{
    NSMutableString *result=[[NSMutableString alloc]initWithCapacity:0];
    for (int i=0; i<nameArr.count; i++) {
        if (i==nameArr.count-1) {
            [result appendString:[NSString stringWithFormat:@"%@  %@",NSLocalizedString(nameArr[i], nil),valueArr[i]]];
        }
        else
            [result appendString:[NSString stringWithFormat:@"%@  %@\n",NSLocalizedString(nameArr[i], nil),valueArr[i]]];
    }
    return result;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
