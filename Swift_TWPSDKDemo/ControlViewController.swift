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
                }
            }
        }
    }
    
    @IBAction func backUp(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func backDown(_ sender: Any) {
        
        
    }
    
    
    @IBAction func legUp(_ sender: Any) {
        
        
    }
    
    @IBAction func legDown(_ sender: Any) {
        
        
    }
    
    @IBAction func movie(_ sender: Any) {
        
        
    }
    
    @IBAction func reading(_ sender: Any) {
        
        
        
    }
    
    @IBAction func zeroGravity(_ sender: Any) {
        
        
        
    }
    
    @IBAction func layFlat(_ sender: Any) {
        
        
    }
    
    
    @IBAction func clickM1(_ sender: Any) {
        
        
    }
    
    @IBAction func saveM1(_ sender: Any) {
        
        
    }
    
    @IBAction func clickM2(_ sender: Any) {
        
        
    }
    
    @IBAction func saveM2(_ sender: Any) {
        
        
    }
    
    @IBAction func lockChange(_ sender: Any) {
        
        
    }
    
    @IBAction func snoringChange(_ sender: Any) {
        
        
    }
    
    
    @IBAction func nightLightChange(_ sender: Any) {
        
        
        
    }
}
