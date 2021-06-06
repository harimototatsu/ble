//
//  bletooth.swift
//  ble
//
//  Created by 達 on 2021/05/30.
//
import Foundation
import CoreBluetooth


let seviceUUID = CBUUID(string: "180A")

class blemanager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    @Published var isSwitchedOn = false
    

    var myCentral: CBCentralManager!
    var peripheral: CBCentralManager!
    
        override init() {
            super.init()
     
            myCentral = CBCentralManager(delegate: self, queue: nil)
            myCentral.delegate = self
        }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
           case .unknown:
             print ( "central.state is .unknown" )

           case .resetting:
             print ( "central.state is .resetting" )
           case .unsupported:
             print ( "central.state is .unsupported" )
           case .unauthorized:
             print ( "central.state is .unauthorized" )
           case .poweredOff:
             print ( "central.state is .poweredOff" )
           case .poweredOn:
             print ("central.state 是 .powerOn" )
        @unknown default:
            fatalError()
        }
    }
    func scan(){
        myCentral.scanForPeripherals(withServices: [seviceUUID]  )

    }
    
    func stop() {
        myCentral.stopScan()
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
    }

}

