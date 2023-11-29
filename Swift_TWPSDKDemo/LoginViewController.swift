//
//  LoginViewController.swift
//  Swift_TWPSDKDemo
//
//  Created by San on 12/6/2020.
//  Copyright © 2020 medica. All rights reserved.
//

import UIKit
import SLPTCP
import Foundation

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
        self.initData()
    }
    
    func initData() -> Void {
        if  (UserDefaults.standard.string(forKey: "url") != nil) {
            self.urlTextfield.text = UserDefaults.standard.string(forKey: "url")
        }
//        else
//        {
//            self.urlTextfield.text = "http://120.24.68.136:8091"
//        }
     
        if  (UserDefaults.standard.string(forKey: "channelID") != nil) {
            self.channelidTextfield.text = UserDefaults.standard.string(forKey: "channelID")
        }
//        else
//        {
//            self.channelidTextfield.text = "10000"
//        }
        if  (UserDefaults.standard.string(forKey: "token") != nil) {
            self.tokeTextfield.text = UserDefaults.standard.string(forKey: "token")
        }
//        else
//        {
//            self.tokeTextfield.text = "z400twp3"
//        }
        if  (UserDefaults.standard.string(forKey: "deviceID") != nil) {
            self.deviceIdTextfield.text = UserDefaults.standard.string(forKey: "deviceID") 
        }
//        else
//        {
//            self.deviceIdTextfield.text = "9klrzu9i9o9lo"
//        }
        
//        self.urlTextfield.text = "http://120.24.68.136:8091"
//        self.channelidTextfield.text = "53500"
//        self.tokeTextfield.text = "test"
        
        if  (UserDefaults.standard.string(forKey: "version") != nil) {
            self.versionTextfield.text = UserDefaults.standard.string(forKey: "version")
        }
//        else
//        {
//            self.versionTextfield.text = "2.49"
//        }
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
        self.urlTextfield.placeholder = NSLocalizedString("server_http", comment: "")
        self.tokeTextfield.placeholder = NSLocalizedString("enter_token", comment: "")
        self.channelidTextfield.placeholder = NSLocalizedString("enter_id", comment: "")
        self.deviceIdTextfield.placeholder = NSLocalizedString("id_cipher", comment: "")
        self.versionTextfield.placeholder = NSLocalizedString("target_version", comment: "")
        self.upgradeBT.setTitle(NSLocalizedString("fireware_update", comment: ""), for: .normal)
        self.bindBT.setTitle(NSLocalizedString("bind", comment: ""), for: .normal)
        self.unbindBT.setTitle(NSLocalizedString("unbind", comment: ""), for: .normal)
        self.connectBT.setTitle(NSLocalizedString("connect_server", comment: ""), for: .normal)
        self.progressLabel.text = NSLocalizedString("upgrading_device", comment: "")
        
      
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        } else {
            // Fallback on earlier versions
        };
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        UserDefaults.standard.set(self.urlTextfield.text!, forKey: "url")
        UserDefaults.standard.set(self.channelidTextfield.text!, forKey: "channelID")
        UserDefaults.standard.set(self.tokeTextfield.text!, forKey: "token")
        UserDefaults.standard.set(self.deviceIdTextfield.text!, forKey: "deviceID")
        UserDefaults.standard.set(self.versionTextfield.text!, forKey: "version")
    }
    
    func receiceData() -> Void {
        //post realtime data
        NotificationCenter.default.addObserver(self, selector: #selector(receive_notifaction(notify:)), name: Notification.Name(kNotificationNameTCPDeviceUpdateRateChanged), object: nil)
    }
    
    @IBAction func connect(_ sender: Any) {
        
        
        
        let dic = ["url": self.urlTextfield.text!,"channelID" : self.channelidTextfield.text! ]
        SLPHTTPManager.sharedInstance().initHttpServiceInfo(dic);
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        var connectStr = ""
        //http authorize
        SLPHTTPManager.sharedInstance().authorize(self.tokeTextfield.text!, timeout: 0) { (result: Bool, responseObject: Any, error: String?) in
            print("authorize result-->",result,responseObject)
            if result {
                let dic = responseObject as![String:Any]
                let data = dic["data"] as! [String : Any]
                let tcpServer = data["tcpServer"]  as! [String : Any]
                let sid = data["sid"] as! String
                let ip = tcpServer["ip"] as! String
                let port = tcpServer["port"] as! String
                let user = data["user"]  as! [String : Any]
                let userid = user["userId"] as! UInt
                UserDefaults.standard.set(userid, forKey: "userId")

                
                //login device
                SLPLTcpManager.sharedInstance()?.loginHost(ip, port: NSInteger(port)!, token: sid, completion: { (succeed: Bool) in
                    MBProgressHUD.hide(for: self.view, animated: true)
                    print("login tcp result ---",succeed)
                    if succeed
                    {
                        connectStr = NSLocalizedString("connection_succeeded", comment: "")
                    }
                    else
                    {
                        connectStr = NSLocalizedString("Connection_failed", comment: "")
                    }
                    self.alertShow(message: connectStr as NSString)
                })
            }
            else{
                print("authorize failed")
                MBProgressHUD.hide(for: self.view, animated: true)
                self.alertShow(message: NSLocalizedString("authorize_failed", comment: "") as NSString)
            }
        }
    }
    
    @IBAction func upgrade(_ sender: Any) {
        
        var upStr = ""
        SLPLTcpManager.sharedInstance()?.publicUpdateOperation(withDeviceID: self.deviceIdTextfield.text!, deviceType: SLPDeviceTypes.TWP3, firmwareType: 2, firmwareVersion: self.versionTextfield.text!, timeout: 10.0, callback: {(status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("notity update succeed")
                upStr = NSLocalizedString("sent_successfully", comment: "") 
            }
            else
            {
                print("notity update failed")
                if status == SLPDataTransferStatus.failed
                {
                    let entity = data as! SLPTCPBaseEntity;
                    upStr = self.errorDes(errorCode: Int(entity.errorCode)) as String
                }
                else
                {
                    upStr = NSLocalizedString("failure", comment: "")
                }
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
                bindStr = NSLocalizedString("bind_account_success", comment: "")
            }
            else
            {
                print("bind failed")
                bindStr = NSLocalizedString("bind_fail", comment: "")
            }
            self.alertShow(message: bindStr as NSString)
        }
    }
    
    @IBAction func unbind(_ sneder:Any){
        SLPHTTPManager.sharedInstance().unBindDevice(withDeviceId: self.deviceIdTextfield.text!, timeOut: 10.0) { (result: Bool, error: String?) in
            var unbindStr = ""
            if result
            {
                print("unbind succeed")
                unbindStr = NSLocalizedString("unbind_success", comment: "")
            }
            else
            {
                print("unbind failed")
                unbindStr = NSLocalizedString("unbind_failed", comment: "")
            }
            
            self.alertShow(message: unbindStr as NSString)
        }
    }
    
    @objc func receive_notifaction(notify: NSNotification) -> Void {
        
        let progress: SLPLTcpUpgradeInfo = notify.userInfo?[kNotificationPostData] as! SLPLTcpUpgradeInfo
        
        self.progressLabel.text = NSLocalizedString("upgrading_device", comment: "") + "\(progress.rate)%"
        
        print("update progress \(progress.rate)%")
    }
    
    
    func alertShow(message: NSString ) -> Void {
        let alert = UIAlertController.init(title: "", message: message as String, preferredStyle: .alert)
        let cancel = UIAlertAction(title: NSLocalizedString("confirm", comment: ""), style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
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
