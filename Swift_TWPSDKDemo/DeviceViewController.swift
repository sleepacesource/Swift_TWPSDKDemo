//
//  DeviceViewController.swift
//  Swift_TWPSDKDemo
//
//  Created by San on 12/6/2020.
//  Copyright © 2020 medica. All rights reserved.
//

import UIKit
import SLPTCP

class DeviceViewController: UIViewController {
    
    @IBOutlet weak var startRealtimeData: UIButton!
    @IBOutlet weak var stopRealtimeData: UIButton!
    @IBOutlet weak var stopCollect: UIButton!
    @IBOutlet weak var checkEnviBT: UIButton!
    @IBOutlet weak var checkEnviLabel: UILabel!
    @IBOutlet weak var checkDeviceOnlineBT: UIButton!
    @IBOutlet weak var checkSleepStatusBT: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    
    var deviceID = ""
    let str1 = NSLocalizedString("sleep_state", comment: "")
    let str2 = NSLocalizedString("heartrate", comment: "")
    let str3 = NSLocalizedString("breathrate", comment: "")
    let str4 = NSLocalizedString("temp", comment: "")
    let str5 = NSLocalizedString("humidity", comment: "")
    let str6 = NSLocalizedString("cur_temp", comment: "")
    let str7 = NSLocalizedString("cur_humidity", comment: "")
    let str8 = NSLocalizedString("device_online_state", comment: "")
    let str9 = NSLocalizedString("cur_sleep_state", comment: "")
    let str10 = NSLocalizedString("Current_real_time_sleep", comment: "")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initUI()
        self.receiceData()
    }
    
    func initUI() -> Void {
        self.startRealtimeData.layer.cornerRadius = 2.0;
        self.startRealtimeData.layer.masksToBounds = true;
        
        self.stopRealtimeData.layer.cornerRadius = 2.0;
        self.stopRealtimeData.layer.masksToBounds = true;
        
        self.stopCollect.layer.cornerRadius = 2.0;
        self.stopCollect.layer.masksToBounds = true;
        
        self.checkEnviBT.layer.cornerRadius = 2.0;
        self.checkEnviBT.layer.masksToBounds = true;
        
        self.checkSleepStatusBT.layer.cornerRadius = 2.0;
        self.checkSleepStatusBT.layer.masksToBounds = true;
        
        self.checkDeviceOnlineBT.layer.cornerRadius = 2.0;
        self.checkDeviceOnlineBT.layer.masksToBounds = true;
        
        self.startRealtimeData.setTitle(NSLocalizedString("view_data", comment: ""), for: UIControl.State.normal)
        self.stopRealtimeData.setTitle(NSLocalizedString("off_data", comment: ""), for: UIControl.State.normal)
        self.stopCollect.setTitle(NSLocalizedString("off_collection", comment: ""), for: UIControl.State.normal)
        self.checkEnviBT.setTitle(NSLocalizedString("query_envir_data", comment: ""), for: UIControl.State.normal)
        self.checkDeviceOnlineBT.setTitle(NSLocalizedString("query_device_online_state", comment: ""), for: UIControl.State.normal)
        self.checkSleepStatusBT.setTitle(NSLocalizedString("query_sleep_state", comment: ""), for: UIControl.State.normal)
        self.deviceID =  UserDefaults.standard.string(forKey: "deviceID")!
        self.label1.text = self.str1
        self.label2.text = self.str2
        self.label3.text = self.str3
        self.label4.text = self.str4
        self.label5.text = self.str5
        self.label6.text = self.str6
        self.label7.text = self.str7
        self.label8.text = self.str8
        self.label9.text = self.str9
        self.label10.text = self.str10
        if #available(iOS 13.0, *) {
              self.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
          } else {
              // Fallback on earlier versions
          };
    }
    
    func receiceData() -> Void {
        //post realtime data
        NotificationCenter.default.addObserver(self, selector: #selector(receive_notifaction(notify:)), name: Notification.Name(kNotificationNameWiFiDeviceRealtimeData), object: nil)
        
        //历史数据上传完成
        NotificationCenter.default.addObserver(self, selector: #selector(receive_historyUploadFinished(notify:)), name: Notification.Name(kNotificationNameHistoryDataUploadFinished), object: nil)
        
        //睡眠状态发生改变
        NotificationCenter.default.addObserver(self, selector: #selector(receive_sleepStatusChanged(notify:)), name: Notification.Name(kNotificationNameDeviceSleepStatusChanged), object: nil)
        
    }
    
    @IBAction func startRealtimeData(_ sender: Any) {
        SLPLTcpManager.sharedInstance()?.startRealTimeData(withDeviceID: self.deviceID, deviceType: SLPDeviceTypes.TWP2, timeout: 10.0, callback: { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("start realtime data succeed !")
            }
            else
            {
                var error = ""
                if status == SLPDataTransferStatus.failed {
                    let entity = data as! SLPTCPBaseEntity;
                    error = self.errorDes(errorCode: Int(entity.errorCode)) as String
                    
                }
                else
                {
                    error = NSLocalizedString("failure", comment: "")
                }
                self.alertShow(message: error as NSString)
                print("start realtime data failed !")
            }
        })
    }
    
    @IBAction func stopRealtimeData(_ sender: Any) {
        
        SLPLTcpManager.sharedInstance()?.stopRealTimeData(withDeviceID: deviceID, deviceType: SLPDeviceTypes.TWP2, timeout: 10, callback: { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("stop realtime data succeed !")
            }
            else
            {
                var error = ""
                if status == SLPDataTransferStatus.failed{
                    let entity = data as! SLPTCPBaseEntity;
                    error = self.errorDes(errorCode: Int(entity.errorCode)) as String
                }
                else
                {
                    error = NSLocalizedString("failure", comment: "")
                }
                self.alertShow(message: error as NSString)
                print("stop realtime data failed !")
            }
            
            self.label1.text = self.str1
            self.label2.text = self.str2
            self.label3.text = self.str3
            self.label4.text = self.str4
            self.label5.text = self.str5
        })
    }
    
    @IBAction func stopMonitor(_ sender: Any) {
        let time = UInt32(NSDate().timeIntervalSince1970)
        SLPLTcpManager.sharedInstance()?.stopCollection(withDeviceID: deviceID, deviceType: SLPDeviceTypes.TWP2, userID: "363590", timeStamp:time, timeout: 10, callback: { (status: SLPDataTransferStatus, data: Any?) in
            
            if status == SLPDataTransferStatus.succeed
            {
                print("stop monitor succeed !")
            }
            else
            {
                var error = ""
                if status == SLPDataTransferStatus.failed
                {
                    let entity = data as! SLPTCPBaseEntity;
                    error = self.errorDes(errorCode: Int(entity.errorCode)) as String
                    
                }
                else
                {
                    error = NSLocalizedString("failure", comment: "")
                }
                self.alertShow(message: error as NSString)
                print("stop monitor  failed !")
            }
        })
    }
    
    @IBAction func checkEnvironment(_ sender: Any) {
        
        SLPLTcpManager.sharedInstance()?.getEnvironmentInfo(withDeviceID: deviceID, timeout: 15.0, callback: { (status: SLPDataTransferStatus, data: Any?)  in
            if status == SLPDataTransferStatus.succeed
            {
                print("check environment info succeed !")
                
                let enviInfo : SLPEnvironmentInfo = data as! SLPEnvironmentInfo;
                
                self.label6.text = self.str6 + ":" + "\(enviInfo.temperature)"
                self.label7.text = self.str7 + ":" + "\(enviInfo.humidity)"
            }
            else
            {
                self.label6.text = self.str6
                self.label7.text = self.str7
                var error = ""
                if status == SLPDataTransferStatus.failed
                {
                    let entity = data as! SLPEnvironmentInfo;
                    error = self.errorDes(errorCode: Int(entity.errorCode)) as String
                }
                else
                {
                    error = NSLocalizedString("failure", comment: "")
                }
                self.alertShow(message: error as NSString)
                print("check environment info  failed !")
            }
        })
    }
    
    @IBAction func checkOnlineStatus(_ sender: Any) {
        
        SLPLTcpManager.sharedInstance()?.publicGetOnlineStatus(withDeviceID: deviceID, deviceType: SLPDeviceTypes.TWP2, timeout: 15.0, callback: { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("check device oneline status succeed !")
                let onlineInfo : SLPTCPOnlineStatus = data as! SLPTCPOnlineStatus
                
                let onlineStr = onlineInfo.isOnline ? NSLocalizedString("online", comment: "在线") : NSLocalizedString("offline", comment: "不在线")
                self.label8.text =  self.str8 + ":" + onlineStr
            }
            else
            {
                self.label8.text =  self.str8
                var error = ""
                if status == SLPDataTransferStatus.failed
                {
                    let entity = data as! SLPTCPOnlineStatus;
                    error = self.errorDes(errorCode: Int(entity.errorCode)) as String
                }
                else
                {
                    error = NSLocalizedString("failure", comment: "")
                }
                self.alertShow(message: error as NSString)
                print("check device oneline status failed !")
            }
        })
    }
    
    @IBAction func checkMonitorStatus(_ sender: Any) {
        SLPLTcpManager.sharedInstance()?.getSleepStatus(withDeviceID: deviceID, deviceType: SLPDeviceTypes.TWP2, timeout: 10.0, callback: { (status: SLPDataTransferStatus, data: Any?)in
            if status == SLPDataTransferStatus.succeed
            {
                print("check monitor succeed !")
                let sleepInfo : SLPSleepStatus = data as! SLPSleepStatus
                
                var str : String = "--"
                if sleepInfo.weakFlag == 1 {
                    str = NSLocalizedString("wake", comment: "唤醒")
                }
                else if sleepInfo.sleepFlag == 1{
                    str = NSLocalizedString("sleep", comment: "入睡")
                }
                else if sleepInfo.leftbedFlag == 0{
                    str = NSLocalizedString("in_bed", comment: "在床")
                }
                else if sleepInfo.leftbedFlag == 1{
                    str = NSLocalizedString("out_bed", comment: "离床")
                }
                self.label9.text =  self.str9 + ":" + str
            }
            else
            {
                self.label9.text =  self.str9
                var error = ""
                if status == SLPDataTransferStatus.failed
                {
                    let entity = data as! SLPSleepStatus;
                    error = self.errorDes(errorCode: Int(entity.errorCode)) as String
                }
                else
                {
                    error = NSLocalizedString("failure", comment: "")
                }
                self.alertShow(message: error as NSString)
                
                print("check monitor failed !")
            }
        })
    }
    
    @objc func receive_notifaction(notify: NSNotification) -> Void {
        
        let real: SLPTCPPostRealtimeData = notify.userInfo?[kNotificationPostData] as! SLPTCPPostRealtimeData
        let data: SLPRealtimeDataBase  = real.dataList[0]
        let statusStr: String = self.statusDes(statusCode: data.brStatus) as String
        self.label1.text = str1 + ":" +  statusStr
        self.label2.text = str2 + ":" +  "\(data.hr)"
        self.label3.text = str3 + ":" +  "\(data.br)"
        self.label4.text = str4 + ":" + "\(data.temperature)"
        self.label5.text = str5 + ":" + "\(data.humidity)"
    }
    
    @objc func receive_historyUploadFinished(notify: NSNotification) -> Void {
        
        self.alertShow(message: NSLocalizedString("upload_data_finish", comment: "") as NSString)
    }
    
    @objc func receive_sleepStatusChanged(notify: NSNotification) -> Void {
        
        let sleepInfo: SLPSleepStatus = notify.userInfo?[kNotificationPostData] as! SLPSleepStatus
        
        var str : String = "--"
        if sleepInfo.weakFlag == 1 {
            str = NSLocalizedString("wake", comment: "唤醒")
        }
        else if sleepInfo.sleepFlag == 1{
            str = NSLocalizedString("sleep", comment: "入睡")
        }
        else if sleepInfo.leftbedFlag == 0{
            str = NSLocalizedString("in_bed", comment: "在床")
        }
        else if sleepInfo.leftbedFlag == 1{
            str = NSLocalizedString("out_bed", comment: "离床")
        }
        self.label10.text = self.str10 + ":" +  str
    }
    
    func errorDes(errorCode: Int) -> NSString {
        var error = ""
        switch errorCode {
        case 0x00:
            error = NSLocalizedString("succeed", comment: "")
        case 0x01:
            error = NSLocalizedString("server_error", comment: "")
        case 0x02:
            error = NSLocalizedString("twp_not_login", comment: "")
        case 0x04:
            error = NSLocalizedString("twp_not_bind", comment: "")
        case 0x08:
            error = NSLocalizedString("twp_not_online", comment: "")
        case 0x0d:
            error = NSLocalizedString("twp_connected_failed", comment: "")
        case 0x0f:
            error = NSLocalizedString("twp_upgrading", comment: "")
        case 0xff:
            error = NSLocalizedString("unknow", comment: "")
        default:
            error = ""
        }
        return error as NSString
    }
    
    func statusDes(statusCode: Int) -> NSString {
        var des = ""
        switch statusCode {
        case 0x00:
            des = NSLocalizedString("normal_status", comment: "")
        case 0x01:
            des = NSLocalizedString("Initializing", comment: "")
        case 0x02:
            des = NSLocalizedString("Apnea", comment: "")
        case 0x03:
            des = NSLocalizedString("Pause_heartbeat", comment: "")
        case 0x04:
            des = NSLocalizedString("Body_movement", comment: "")
        case 0x05:
            des = NSLocalizedString("Out_of_bed", comment: "")
        case 0x06:
            des = NSLocalizedString("Turn_over", comment: "")
         case 0x07:
            des = NSLocalizedString("Body_motion_range", comment: "")
        default:
            des = NSLocalizedString("invalid", comment: "")
        }
        return des as NSString
    }
    
    func alertShow(message: NSString ) -> Void {
        let alert = UIAlertController.init(title: "", message: message as String, preferredStyle: .alert)
        let cancel = UIAlertAction(title: NSLocalizedString("confirm", comment: ""), style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}

