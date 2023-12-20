//
//  ControlViewController.swift
//  Swift_TWPSDKDemo
//
//  Created by San on 2023/12/8.
//  Copyright © 2023 medica. All rights reserved.
//

import UIKit
import BluetoothManager
import SDC100
import SLPCommon

class ControlViewController: UIViewController {
    @IBOutlet weak var connectBT: UIButton!
    @IBOutlet weak var disconnectBT: UIButton!
    @IBOutlet weak var angleLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var backUpBT: UIButton!
    @IBOutlet weak var backDownBT: UIButton!
    @IBOutlet weak var legLabel: UILabel!
    @IBOutlet weak var legUpBT: UIButton!
    @IBOutlet weak var legkDownBT: UIButton!
    @IBOutlet weak var tipsLabel1: UILabel!
    @IBOutlet weak var tipsLabel2: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var movieBT: UIButton!
    @IBOutlet weak var readingBT: UIButton!
    @IBOutlet weak var zeroGravityBT: UIButton!
    @IBOutlet weak var layBT: UIButton!
    @IBOutlet weak var m1BT: UIButton!
    @IBOutlet weak var saveM1BT: UIButton!
    @IBOutlet weak var m2BT: UIButton!
    @IBOutlet weak var saveM2BT: UIButton!
    @IBOutlet weak var lockLabel: UILabel!
    @IBOutlet weak var lockSwitch: UISwitch!
    @IBOutlet weak var lockTipsLabel: UILabel!
    @IBOutlet weak var snoringLabel: UILabel!
    @IBOutlet weak var snoringSwitch: UISwitch!
    @IBOutlet weak var snoringTipsLabel: UILabel!
    @IBOutlet weak var nightLightLabel: UILabel!
    @IBOutlet weak var nightLightSwitch: UISwitch!
    @IBOutlet weak var nightLightTipsLabel: UILabel!
    @IBOutlet weak var intervalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initUI()
        
        
    }
    
    func initUI() -> Void {
        self.connectBT.setTitle(NSLocalizedString("connect_device", comment: ""), for: .normal)
        self.disconnectBT.setTitle(NSLocalizedString("disconnect", comment: ""), for: .normal)
        self.angleLabel.text = NSLocalizedString("angle_Adjustment", comment: "")
        self.backLabel.text = NSLocalizedString("back", comment: "")
        self.backUpBT.setTitle(NSLocalizedString("up", comment: ""), for: .normal)
        self.backDownBT.setTitle(NSLocalizedString("down", comment: ""), for: .normal)
        self.legLabel.text = NSLocalizedString("legs", comment: "")
        self.legUpBT.setTitle(NSLocalizedString("up", comment: ""), for: .normal)
        self.legkDownBT.setTitle(NSLocalizedString("down", comment: ""), for: .normal)
        self.tipsLabel1.text = NSLocalizedString("press1", comment: "")
        self.tipsLabel2.text = NSLocalizedString("press2", comment: "")
        self.modeLabel.text = NSLocalizedString("mode_Selection", comment: "")
        self.movieBT.setTitle(NSLocalizedString("viewing_Mode", comment: ""), for: .normal)
        self.readingBT.setTitle(NSLocalizedString("reading_Mode", comment: ""), for: .normal)
        self.zeroGravityBT.setTitle(NSLocalizedString("gravity_mode_0", comment: ""), for: .normal)
        self.layBT.setTitle(NSLocalizedString("flatten", comment: ""), for: .normal)
        self.m1BT.setTitle(NSLocalizedString("m1", comment: ""), for: .normal)
        self.saveM1BT.setTitle(NSLocalizedString("save_as_m1", comment: ""), for: .normal)
        self.m2BT.setTitle(NSLocalizedString("m2", comment: ""), for: .normal)
        self.saveM2BT.setTitle(NSLocalizedString("save_as_m2", comment: ""), for: .normal)
        self.lockLabel.text = NSLocalizedString("child_lock", comment: "")
        self.lockTipsLabel.text = NSLocalizedString("child_lock_mode", comment: "")
        self.snoringLabel.text = NSLocalizedString("intelligent_Stop_Snoring", comment: "")
        self.snoringTipsLabel.text = NSLocalizedString("turn_on", comment: "")
        self.nightLightLabel.text = NSLocalizedString("wake_up_night_light", comment: "")
        
        self.connectBT.layer.cornerRadius = 2.0;
        self.connectBT.layer.masksToBounds = true;
        self.disconnectBT.layer.cornerRadius = 2.0;
        self.disconnectBT.layer.masksToBounds = true;
        self.backUpBT.layer.cornerRadius = 2.0;
        self.backUpBT.layer.masksToBounds = true;
        self.backDownBT.layer.cornerRadius = 2.0;
        self.backDownBT.layer.masksToBounds = true;
        self.legUpBT.layer.cornerRadius = 2.0;
        self.legkDownBT.layer.masksToBounds = true;
        self.movieBT.layer.cornerRadius = 2.0;
        self.movieBT.layer.masksToBounds = true;
        self.readingBT.layer.cornerRadius = 2.0;
        self.readingBT.layer.masksToBounds = true;
        self.zeroGravityBT.layer.cornerRadius = 2.0;
        self.zeroGravityBT.layer.masksToBounds = true;
        self.layBT.layer.cornerRadius = 2.0;
        self.layBT.layer.masksToBounds = true;
        self.m1BT.layer.cornerRadius = 2.0;
        self.m1BT.layer.masksToBounds = true;
        self.saveM1BT.layer.cornerRadius = 2.0;
        self.saveM1BT.layer.masksToBounds = true;
        self.m2BT.layer.cornerRadius = 2.0;
        self.m2BT.layer.masksToBounds = true;
        self.saveM2BT.layer.cornerRadius = 2.0;
        self.saveM2BT.layer.masksToBounds = true;
        
    
        let backUpLongPress = UILongPressGestureRecognizer(target: self, action:#selector(backUPLongPress(longPress:)))
        backUpLongPress.minimumPressDuration = 1.0;
        self.backUpBT.addGestureRecognizer(backUpLongPress)
        let backdownLongPress = UILongPressGestureRecognizer(target: self, action:#selector(backDownLongPress(longPress:)))
        backdownLongPress.minimumPressDuration = 1.0;
        self.backDownBT.addGestureRecognizer(backdownLongPress)
        let legUpLongPress = UILongPressGestureRecognizer(target: self, action:#selector(legUPLongPress(longPress:)))
        legUpLongPress.minimumPressDuration = 1.0;
        self.legUpBT.addGestureRecognizer(legUpLongPress)
        let legdownLongPress = UILongPressGestureRecognizer(target: self, action:#selector(legDownLongPress(longPress:)))
        legdownLongPress.minimumPressDuration = 1.0;
        self.legkDownBT.addGestureRecognizer(legdownLongPress)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isconnected =  (DataManager.shared().peripheral != nil) && SLPBLEManager.shared().peripheralIsConnected(DataManager.shared()?.peripheral)
        if(isconnected){
            SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, getSnoreMeddleTimeout: 0) {  (status: SLPDataTransferStatus, data: Any?)  in
                if status == SLPDataTransferStatus.succeed
                {
                    print("getSnoreMeddle succeed")
                }
                else
                {
                    print("getSnoreMeddle failed")
                }
            }
        }
    }
    
    @IBAction func connectDevice(_ sender: Any) {
        
        let searchVC = SearchViewController ()
        searchVC.title = NSLocalizedString("search_ble", comment: "")
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @IBAction func disConnected(_ sender: Any) {
        let isconnected =  (DataManager.shared().peripheral != nil) && SLPBLEManager.shared().peripheralIsConnected(DataManager.shared()?.peripheral)
        if(isconnected){
            SLPBLEManager.shared().disconnectPeripheral(DataManager.shared()?.peripheral, timeout: 0) { (status: SLPBLEDisconnectReturnCodes, data: Any?)  in
                
                if status ==  SLPBLEDisconnectReturnCodes.succeed
                {
                    print("disconect succeed")
                    let tipstr = NSLocalizedString("disconnect", comment: "")
                    self.alertShow(message: tipstr as NSString)
                }
            }
        }
    }
    
    
     @objc func backUPLongPress(longPress: UILongPressGestureRecognizer) {
         if longPress.state == .began
         {
             print("long press start")
             
             let par = ["keycode" : 2,"ctrlVal": 1,"place": 0]
             SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
                 if status == SLPDataTransferStatus.succeed
                 {
                     print("back up succeed")
                 }
                 else
                 {
                     print("back up failed")
                 }
             }
         }
         else if longPress.state == .ended
         {
             print("long press end")
             self.backUp("")
         }
         else{
             print("long press else")
         }
    }
    
    @objc func backDownLongPress(longPress: UILongPressGestureRecognizer) {
        if longPress.state == .began
        {
            print("long press start")
            let par = ["keycode" : 1,"ctrlVal": 1,"place": 0]
            SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
                if status == SLPDataTransferStatus.succeed
                {
                    print("back up succeed")
                }
                else
                {
                    print("back up failed")
                }
            }
        }
        else if longPress.state == .ended
        {
            print("long press end")
            self.backDown("")
        }
        else{
            print("long press else")
        }
   }
    
    @IBAction func backUp(_ sender: Any) {
        let par = ["keycode" : 2,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("back up succeed")
            }
            else
            {
                print("back up failed")
            }
        }
    }
    
    @IBAction func backDown(_ sender: Any) {
        
        let par = ["keycode" : 1,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("back up succeed")
            }
            else
            {
                print("back up failed")
            }
        }
    }
    
    
    @objc func legUPLongPress(longPress: UILongPressGestureRecognizer) {
        if longPress.state == .began
        {
            print("long press start")
            
            let par = ["keycode" : 2,"ctrlVal": 1,"place": 1]
            SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
                if status == SLPDataTransferStatus.succeed
                {
                    print("back up succeed")
                }
                else
                {
                    print("back up failed")
                }
            }
        }
        else if longPress.state == .ended
        {
            print("long press end")
            self.legUp("")
        }
        else{
            print("long press else")
        }
   }
   
   @objc func legDownLongPress(longPress: UILongPressGestureRecognizer) {
       if longPress.state == .began
       {
           print("long press start")
           let par = ["keycode" : 1,"ctrlVal": 1,"place": 1]
           SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
               if status == SLPDataTransferStatus.succeed
               {
                   print("back up succeed")
               }
               else
               {
                   print("back up failed")
               }
           }
       }
       else if longPress.state == .ended
       {
           print("long press end")
           self.legDown("")
       }
       else{
           print("long press else")
       }
  }
    
    @IBAction func legUp(_ sender: Any) {
        
        let par = ["keycode" : 2,"ctrlVal": 0,"place": 1]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("leg up succeed")
            }
            else
            {
                print("leg up failed")
            }
        }
    }
    
    @IBAction func legDown(_ sender: Any) {
        
        let par = ["keycode" : 1,"ctrlVal": 0,"place": 1]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("leg down succeed")
            }
            else
            {
                print("leg down failed")
            }
        }
    }
    /**
     keycode: 3
     */
    @IBAction func movie(_ sender: Any) {
        
        let par = ["keycode" : 3,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("movie succeed")
            }
            else
            {
                print("movie failed")
            }
        }
        
    }
    /**
     keycode: 4
     */
    @IBAction func reading(_ sender: Any) {
        let par = ["keycode" : 4,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("movie succeed")
            }
            else
            {
                print("movie failed")
            }
        }
        
    }
    /**
     keycode: 6
     */
    @IBAction func zeroGravity(_ sender: Any) {
        
        let par = ["keycode" : 6,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("zeroGravity succeed")
            }
            else
            {
                print("zeroGravity failed")
            }
        }
    }
    
    /**
     keycode: 7
     */
    @IBAction func layFlat(_ sender: Any) {
        
        let par = ["keycode" : 7,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("layFlat succeed")
            }
            else
            {
                print("layFlat failed")
            }
        }
    }
    
    /**
     keycode: 8
     ctrlVal： 0
     */
    @IBAction func clickM1(_ sender: Any) {
        let par = ["keycode" : 8,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("clickM1 succeed")
            }
            else
            {
                print("clickM1 failed")
            }
        }
        
    }
    /**
     keycode: 8
     ctrlVal： 1
     */
    @IBAction func saveM1(_ sender: Any) {
        
        let par = ["keycode" : 8,"ctrlVal": 1,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("saveM1 succeed")
            }
            else
            {
                print("saveM1 failed")
            }
        }
    }
    /**
     keycode: 9
     ctrlVal： 0
     */
    @IBAction func clickM2(_ sender: Any) {
        
        let par = ["keycode" : 9,"ctrlVal": 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("clickM2 succeed")
            }
            else
            {
                print("clickM2 failed")
            }
        }
        
    }
    /**
     keycode: 9
     ctrlVal： 1
     */
    @IBAction func saveM2(_ sender: Any) {
        let par = ["keycode" : 9,"ctrlVal": 1,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("saveM2 succeed")
            }
            else
            {
                print("saveM2 failed")
            }
        }
        
    }
    
    /**
     keycode: 10
     ctrlVal： 1 or 0
     */
    @IBAction func lockChange(_ sender: UISwitch) {
        let par = ["keycode" : 10,"ctrlVal": sender.isOn ? 1 : 0,"place": 0]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, control: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("lockChange succeed")
            }
            else
            {
                print("lockChange failed")
            }
        }
    }
    
    @IBAction func snoringChange(_ sender: UISwitch) {
        let par = ["enable" : sender.isOn ? 1 : 0,"side": 2]
        SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, snoreMeddle: par, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("snoringChange succeed")
            }
            else
            {
                print("snoringChange failed")
            }
        }
    }
    
    @IBAction func nightLightChange(_ sender: UISwitch) {

                SLPBLEManager.shared().bleSDC100(DataManager.shared().peripheral, lightCtrl: sender.isOn ? 1 : 0, timeout: 0) { (status: SLPDataTransferStatus, data: Any?) in
                    if status == SLPDataTransferStatus.succeed
                    {
                        print("under bed light succeed")
                    }
                    else
                    {
                        print("under bed light failed")
                    }
                }
    }
    
    
    func alertShow(message: NSString ) -> Void {
        let alert = UIAlertController.init(title: "", message: message as String, preferredStyle: .alert)
        let cancel = UIAlertAction(title: NSLocalizedString("confirm", comment: ""), style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}
