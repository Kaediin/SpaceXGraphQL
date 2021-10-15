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
    
    var body: some View{
        ScrollView(.vertical){
            DetailHeadingView(
                launch: launch,
                showingImage: launch.links?.patch?.small != nil
            )
        }.padding()
            
    }
}
