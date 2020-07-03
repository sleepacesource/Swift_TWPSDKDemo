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
    @IBOutlet weak var tokeTextfield: UITextField!
    @IBOutlet weak var connectBT: UIButton!
    @IBOutlet weak var deviceIdTextfield: UITextField!
    @IBOutlet weak var versionTextfield: UITextField!
    @IBOutlet weak var upgradeBT: UIButton!
    @IBOutlet weak var bindBT: UIButton!
    @IBOutlet weak var unbindBT: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initUI()
        self.receiceData()
        
        self.urlTextfield.text = "http://172.14.0.111:8082"
        self.channelidTextfield.text = "13700"
        self.tokeTextfield.text = "jaker123"
        
        self.deviceIdTextfield.text = "jfbkwowszdm6d"
        self.versionTextfield.text = "2.49"
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
        
        self.progressLabel.text = ""
    }
    
    func receiceData() -> Void {
        //post realtime data
        NotificationCenter.default.addObserver(self, selector: #selector(receive_notifaction(notify:)), name: Notification.Name(kNotificationNameTCPDeviceUpdateRateChanged), object: nil)
    }
    
    
    @IBAction func connect(_ sender: Any) {
            
        let dic = ["url": self.urlTextfield.text!,"channelID" : self.channelidTextfield.text! ]
        SLPHTTPManager.sharedInstance().initHttpServiceInfo(dic);
        
        var connectStr = ""
        //http authorize
        SLPHTTPManager.sharedInstance().authorize(self.tokeTextfield.text!, timeout: 0) { (result: Bool, responseObject: Any, error: String?) in
            print("authorize result-->",result,responseObject)
            //              tcpDic = responseObject[@"data"][@"tcpServer"];
            //              userDic = responseObject[@"data"][@"user"];
            if result {
                //login device
                SLPLTcpManager.sharedInstance()?.loginHost("120.24.169.204", port: 27010, deviceID:"jfbkwowszdm6d", token: "sleepace_uBgfjEirX5uo2CEW7AQB", completion: { (succeed: Bool) in
                    
                    print("login tcp result ---",succeed)
                    if succeed
                    {
                        connectStr = "connected succeed"
                    }
                    else
                    {
                        connectStr = "connected failed"
                    }
                    
                    self.alertShow(message: connectStr as NSString)
                })
            }
            else{
                print("authorize failed")
                
                self.alertShow(message: "Authorize failed")
            }
        }
    }
    
    @IBAction func upgrade(_ sender: Any) {
        
        var upStr = ""
        SLPLTcpManager.sharedInstance()?.publicUpdateOperation(withDeviceID: self.deviceIdTextfield.text!, deviceType: SLPDeviceTypes.TWP2, firmwareType: 2, firmwareVersion: self.versionTextfield.text!, timeout: 10.0, callback: {(status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("notity update succeed")
                upStr = "通知升级成功"
            }
            else
            {
                print("notity update failed")
                upStr = "通知升级失败"
            }
            
            self.alertShow(message: upStr as NSString)
        })
    }
    
    @IBAction func bind(_ sender:Any){
        SLPHTTPManager.sharedInstance().bindDevice(withDeviceId: self.deviceIdTextfield.text!, timeOut: 10.0) { (result: Bool, responseObject: Any, error: String?)  in
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
             self.alertShow(message: bindStr as NSString)
        }
    }

    @IBAction func unbind(_ sneder:Any){
        SLPHTTPManager.sharedInstance().unBindDevice(withDeviceId: "EW22W20C00044", timeOut: 10.0) { (result: Bool, error: String?) in
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
            
            self.alertShow(message: unbindStr as NSString)
        }
    }
    
    @objc func receive_notifaction(notify: NSNotification) -> Void {
        
        let progress: SLPLTcpUpgradeInfo = notify.userInfo?[kNotificationPostData] as! SLPLTcpUpgradeInfo
        
        self.progressLabel.text = "\(progress.rate)%"
        
        print("update progress \(progress.rate)%")
    }
    
    
    func alertShow(message: NSString ) -> Void {
        let alert = UIAlertController.init(title: "", message: message as String, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resignTextfiled()
    }
    
    func resignTextfiled() -> Void {
        self.tokeTextfield.resignFirstResponder()
        self.urlTextfield.resignFirstResponder()
        self.channelidTextfield.resignFirstResponder()
        self.deviceIdTextfield.resignFirstResponder()
        self.versionTextfield.resignFirstResponder()
    }
}
