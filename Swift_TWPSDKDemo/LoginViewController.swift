//
//  LoginViewController.swift
//  Swift_TWPSDKDemo
//
//  Created by San on 12/6/2020.
//  Copyright © 2020 medica. All rights reserved.
//

import UIKit
import SLPTCP

class LoginViewController: UIViewController {
    
    @IBOutlet weak var urlTextfield: UITextField!
    @IBOutlet weak var channelidTextfield: UITextField!
    @IBOutlet weak var connectBT: UIButton!
    @IBOutlet weak var deviceIdTextfield: UITextField!
    @IBOutlet weak var versionTextfield: UITextField!
    @IBOutlet weak var upgradeBT: UIButton!
    @IBOutlet weak var bindBT: UIButton!
    @IBOutlet weak var unbindBT: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initUI()
        self.receiceData()
        
        self.urlTextfield.text = "http://172.14.0.111:8082"
        self.channelidTextfield.text = "13700"
    }
    
    func initUI() -> Void {
        self.connectBT.layer.cornerRadius = 2.0;
        self.connectBT.layer.masksToBounds = true;
        self.upgradeBT.layer.cornerRadius = 2.0;
        self.upgradeBT.layer.masksToBounds = true;
        self.bindBT.layer.cornerRadius = 2.0;
        self.bindBT.layer.masksToBounds = true;
        self.unbindBT.layer.cornerRadius = 2.0;
        self.unbindBT.layer.masksToBounds = true;
    }
    
    func receiceData() -> Void {
        //post realtime data
        NotificationCenter.default.addObserver(self, selector: #selector(receive_notifaction(notify:)), name: Notification.Name(kNotificationNameTCPDeviceUpdateRateChanged), object: nil)
    }
    
    
    @IBAction func connect(_ sender: Any) {
        let dic = ["url":"http://172.14.0.111:8082","channelID" : "13700"]
        SLPHTTPManager.sharedInstance().initHttpServiceInfo(dic);
        
        //http authorize
        SLPHTTPManager.sharedInstance().authorize("r8xfa7hdjcm6", timeout: 10) { (result: Bool, responseObject: Any, error: String?) in
            print("authorize result-->",result,responseObject)
            //              tcpDic = responseObject[@"data"][@"tcpServer"];
            //              userDic = responseObject[@"data"][@"user"];
            
            if result {
                //login device
                SLPLTcpManager.sharedInstance()?.loginHost("ccc.sleepace.com", port: 9010, deviceID:"jfbkwowszdm6d", token: "sleepace_diXWK4YzweephfNAyGGx", completion: { (succeed: Bool) in
                    
                    print("login tcp result ---",succeed)
                    
                })
            }
            else{
                print("authorize failed")
            }
        }
        
        
    }
    
    @IBAction func upgrade(_ sender: Any) {
        
        SLPLTcpManager.sharedInstance()?.publicUpdateOperation(withDeviceID: "EW22W20C00044", deviceType: SLPDeviceTypes.EW202W, firmwareType: 0, firmwareVersion: 0, timeout: 10.0, callback: {(status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("notity update succeed")
            }
            else
            {
                print("notity update failed")
            }
        })
    }
    
    @IBAction func bind(_ sender:Any){
        SLPHTTPManager.sharedInstance().bindDevice(withDeviceId: "EW22W20C00044", userID: "33124", timeOut: 10.0) { (result: Bool, responseObject: Any, error: String?)  in
            var bindStr = ""
            if result
            {
                print("bind succeed")
                bindStr = "bind succeed"
            }
            else
            {
                print("bind failed")
                bindStr = "bind failed"
            }
            
            let alert = UIAlertController.init(title: "", message: bindStr, preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func unbind(_ sneder:Any){
        
        SLPHTTPManager.sharedInstance().unBindDevice(withDeviceId: "EW22W20C00044", userID: "33124", timeOut: 10.0) { (result: Bool, error: String?) in
            var unbindStr = ""
            if result
            {
                print("unbind succeed")
                unbindStr = "unbind succeed"
            }
            else
            {
                print("unbind failed")
                unbindStr = "unbind failed"
            }
            
            let alert = UIAlertController.init(title: "", message: unbindStr, preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func receive_notifaction(notify: NSNotification) -> Void {
        
        let progress: SLPLTcpUpgradeInfo = notify.userInfo?[kNotificationPostData] as! SLPLTcpUpgradeInfo
        
        print("update progress \(progress.rate)%")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resignTextfiled()
    }
    
    func resignTextfiled() -> Void {
        
        self.urlTextfield.resignFirstResponder()
        self.channelidTextfield.resignFirstResponder()
        self.deviceIdTextfield.resignFirstResponder()
        self.versionTextfield.resignFirstResponder()
    }
}
