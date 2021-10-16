//
//  Details.swift
//  Details
//
//  Created by Kaedin Schouten on 21/09/2021.
//

import Foundation
import SwiftUI
import MapKit

struct LauchDetails: View {
    
    let launch: Launch
    @State private var showingDetailsSheet = false
    
    var body: some View{
        ScrollView(.vertical){
            DetailHeadingView(launch: launch)
            LaunchMissionDetailsView(details: launch.details)
            LaunchRocketView(rocketId: launch.rocketId)
        }.padding()
        
    }
}
