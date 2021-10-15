//
//  LaunchSuccessView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 15/10/2021.
//

import Foundation
import SwiftUI

struct LaunchSuccessView: View {
    
    var status: Bool?
    var date: String
    @State var statusText: String = ""
    
    var body: some View{
        VStack{
            Text("\(statusText) on \(date)").font(.footnote)
        }.onAppear(){
            self.statusText = status == true ? "Launch Success" : status == false ? "Launch Failed" : ""
        }
    }
}
