//
//  ContentView.swift
//  ble
//
//  Created by 達 on 2021/05/30.
//
import SwiftUI
import CoreBluetooth
import UIKit
 
struct ContentView: View {
   
    @ObservedObject var bleManager = blemanager()
   
    var body: some View {
        VStack{
            Text("Bluetooth Devices")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .center)
        Button(action:{
            bleManager.scan()
        }){
            Text("start")
        }
            Button(action:{
                bleManager.stop()
            }){
                Text("stop")
            }
//            List{
//            Text("\()")
//            }
        }
                    
        }
    }

 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
