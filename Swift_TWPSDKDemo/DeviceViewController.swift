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
    @IBOutlet weak var realtimeSleepStatus: UILabel!
    @IBOutlet weak var realtimeDataLabel: UILabel!
    @IBOutlet weak var realtimeEnvironmentLabel: UILabel!
    
    @IBOutlet weak var checkEnviBT: UIButton!
    @IBOutlet weak var checkEnviLabel: UILabel!
    @IBOutlet weak var checkDeviceOnlineBT: UIButton!
    @IBOutlet weak var deviceOnlineStatusLabel: UILabel!
    @IBOutlet weak var checkSleepStatusBT: UIButton!
    @IBOutlet weak var sleepStatus: UILabel!
    
    let deviceID: String = "jfbkwowszdm6d"
    
    let str1 = NSLocalizedString("realtimeMonitorStatus", comment: "")
    let str2 = NSLocalizedString("realtimeRate", comment: "")
    let str3 = NSLocalizedString("realtimeEnvi", comment: "")
    let str4 = NSLocalizedString("envi", comment: "")
    let str5 = NSLocalizedString("deviceOnlineStatus", comment: "")
    let str6 = NSLocalizedString("monitorStatus", comment: "")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initUI()
        self.receiceData()
    }
    
    func initUI() -> Void {
        self.startRealtimeData.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        self.startRealtimeData.layer.cornerRadius = 2.0;
        self.startRealtimeData.layer.masksToBounds = true;
        self.stopRealtimeData.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        self.stopRealtimeData.layer.cornerRadius = 2.0;
        self.stopRealtimeData.layer.masksToBounds = true;
        self.stopCollect.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        self.stopCollect.layer.cornerRadius = 2.0;
        self.stopCollect.layer.masksToBounds = true;
        self.checkEnviBT.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        self.checkEnviBT.layer.cornerRadius = 2.0;
        self.checkEnviBT.layer.masksToBounds = true;
        self.checkSleepStatusBT.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        self.checkSleepStatusBT.layer.cornerRadius = 2.0;
        self.checkSleepStatusBT.layer.masksToBounds = true;
        self.checkDeviceOnlineBT.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        self.checkDeviceOnlineBT.layer.cornerRadius = 2.0;
        self.checkDeviceOnlineBT.layer.masksToBounds = true;
        
        
        self.startRealtimeData.setTitle(NSLocalizedString("startRealtimeData", comment: ""), for: UIControl.State.normal)
        self.stopRealtimeData.setTitle(NSLocalizedString("stopRealtimeData", comment: ""), for: UIControl.State.normal)
        self.stopCollect.setTitle(NSLocalizedString("stopMonitor", comment: ""), for: UIControl.State.normal)
        self.checkEnviBT.setTitle(NSLocalizedString("checkCurrentEnvi", comment: ""), for: UIControl.State.normal)
        self.checkDeviceOnlineBT.setTitle(NSLocalizedString("checkDeviceOnlineStatus", comment: ""), for: UIControl.State.normal)
        self.checkSleepStatusBT.setTitle(NSLocalizedString("checkMonitorStatus", comment: ""), for: UIControl.State.normal)
        
    }
    
    func receiceData() -> Void {
        //post realtime data
        NotificationCenter.default.addObserver(self, selector: #selector(receive_notifaction(notify:)), name: Notification.Name(kNotificationNameWiFiDeviceRealtimeData), object: nil)
    }
    
    @IBAction func startRealtimeData(_ sender: Any) {
        
        let time = UInt32(NSDate().timeIntervalSince1970)
        //start collect
//        SLPLTcpManager.sharedInstance()?.startCollection(withDeviceID: deviceID, deviceType: SLPDeviceTypes.TWP2, userID: "363590", timeStamp: time, timeout: 10.0, callback: {(status: SLPDataTransferStatus, data: Any?)  in
//            if status == SLPDataTransferStatus.succeed
//            {
//                 print("start collect data succeed !")
//            }
//            else{
//                print("start collect data failed !")
//            }
//        })
        
        SLPLTcpManager.sharedInstance()?.startRealTimeData(withDeviceID: self.deviceID, deviceType: SLPDeviceTypes.TWP2, timeout: 10.0, callback: { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("start realtime data succeed !")
            }
            else
            {
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
                print("stop realtime data failed !")
            }
            
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
                
                self.checkEnviLabel.text = self.str4 + "hum =\(enviInfo.humidity) tem=\(enviInfo.temperature)"
            }
            else
            {
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
                
                self.deviceOnlineStatusLabel.text =  self.str5 + "\(onlineInfo.isOnline)"
            }
            else
            {
                print("check device oneline status failed !")
            }
            
        })
    }
    
    @IBAction func checkMonitorStatus(_ sender: Any) {
        SLPLTcpManager.sharedInstance()?.getCollectionState(withDeviceID: deviceID, deviceType: SLPDeviceTypes.TWP2, timeout: 15.0, callback: { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("check monitor succeed !")
                let sleepInfo : SLPCollectStatus = data as! SLPCollectStatus
                
                self.sleepStatus.text = self.str6 + "\(sleepInfo.isCollecting)"
            }
            else
            {
                print("check monitor failed !")
            }
            
        })
    }
    
    @objc func receive_notifaction(notify: NSNotification) -> Void {
        
        let real: SLPTCPPostRealtimeData = notify.userInfo?[kNotificationPostData] as! SLPTCPPostRealtimeData
        
        let data: SLPRealtimeDataBase  = real.dataList[0]
        
        self.realtimeSleepStatus.text = str1 + "\(data.brStatus)"
        
        self.realtimeDataLabel.text = str2 + "br=\(data.br) hr=\(data.hr)"
        
        self.realtimeEnvironmentLabel.text = str3 + "hum =\(data.humidity) tem=\(data.temperature)"
    }
}

