//
//  SearchViewController.swift
//  BLENOX2Demo-Swift
//
//  Created by San on 12/9/2019.
//  Copyright © 2019 medica. All rights reserved.
//

import UIKit
import SDC100
import BluetoothManager
import SLPCommon


class SearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var selectIdLabel: UILabel!
    
    @IBOutlet weak var refreshBtn: UIButton!
    
    @IBOutlet weak var refreshLabel: UILabel!
    var deviceList = NSMutableArray.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellID")
        
        self.selectIdLabel.text = NSLocalizedString("select_device_id", comment: "")
        self.refreshLabel.text = NSLocalizedString("refresh", comment: "")
        
        self.scan()
        
    }
    
    @IBAction func clickBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func scan() -> Void {
        let bleOpen = SLPBLEManager.shared()?.blueToothIsOpen()
        if !bleOpen! {
            print("ble not open!")
            return ;
        }
        
        deviceList.removeAllObjects()
        self.tableview.reloadData()

        let ret = SLPBLEManager.shared()?.scanBluetooth(withTimeoutInterval: 3.0, completion: { (code: SLPBLEScanReturnCodes, handleID: Int, peripheralInfo: SLPPeripheralInfo?) in
            if code == SLPBLEScanReturnCodes.normal{//SLPBLEScanReturnCode_Normal
                self.appendPeripheral(info: peripheralInfo!)
            }
            else if code == SLPBLEScanReturnCodes.disable{
                print("ble not open!")
            }
        })
        
        if !ret! {
            print("ble not open!")
        }
    }
    
    func appendPeripheral(info:SLPPeripheralInfo) -> Void {
        if info.name.count == 0 {
            return ;
        }
        
//        if !info.name.hasPrefix("SN21") {
//            return ;
//        }
        
        for ainfo in deviceList {
            if info.name == (ainfo as AnyObject).name
            {
                return ;
            }
        }
        
        deviceList.add(info)
        self.tableview.reloadData()
    }
    
    
    @IBAction func refresh(_ sender: Any) {
        
        self.scan()
    }
    
    ///连接设备
    func connectDevice(device:SLPPeripheralInfo) -> Void {
        let bleOpen = SLPBLEManager.shared()?.blueToothIsOpen()
        if !bleOpen! {
            print("ble not open!")
            let isOpen = SLPBLEManager.shared()?.blueToothIsOpen()
            if !(isOpen!) {
                var tipStr = NSLocalizedString("phone_bluetooth_not_open", comment: "")
                self.alertShow(message: tipStr as NSString);
                return
            }
            return ;
        }
        SLPBLEManager.shared()?.bleSDC100(device.peripheral, loginCallback: { (status: SLPDataTransferStatus,data: Any?) in
            if status == SLPDataTransferStatus.succeed
            {
                print("connect succeed")
                let deviceInfo: SDCDeviceInfo = data as! SDCDeviceInfo
                DataManager.shared()?.deviceID = deviceInfo.deviceID
                DataManager.shared()?.deviceName = device.name
                DataManager.shared()?.peripheral = device.peripheral
                self.navigationController?.popViewController(animated: true)
            }
            else
            {
                var tipStr = NSLocalizedString("Connection_failed", comment: "")
                self.alertShow(message: tipStr as NSString);
                print("connect failed")
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return deviceList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = (deviceList[indexPath.row] as AnyObject).name
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let per : SLPPeripheralInfo = deviceList[indexPath.row] as! SLPPeripheralInfo
        self.connectDevice(device: per)
    }
    
    func alertShow(message: NSString ) -> Void {
        let alert = UIAlertController.init(title: "", message: message as String, preferredStyle: .alert)
        let cancel = UIAlertAction(title: NSLocalizedString("confirm", comment: ""), style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}
