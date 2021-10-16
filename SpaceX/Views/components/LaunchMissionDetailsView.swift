//
//  LaunchMissionDetailsView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 16/10/2021.
//

import Foundation
import SwiftUI

struct LaunchMissionDetailsView: View {
    
    var details: String?
    var detailsFull: String?
    
    init(details: String?) {
        self.details = details
        if self.details != nil {
            self.detailsFull = self.details
            if self.details!.count > 300 {
                self.details = "\(String(self.details!.prefix(300)))... Click here to more!"
            }
        }
    }
    
    var body: some View{
        if details != nil {
            DefaultCardView(content: AnyView(
                VStack{
                    Text("Mission details").font(.system(size: 22, weight: .bold)).padding()
                    Text(details!).font(.footnote)
                }
            ), sheetContent: AnyView(
                VStack{
                    Text("Mission details").font(.system(size: 22, weight: .bold)).padding()
                    Text(detailsFull!).font(.footnote)
                }
            ), backgroundColor: nil)
        }
    }
}
