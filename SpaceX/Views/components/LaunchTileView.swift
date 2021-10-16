//
//  CardView.swift
//  CardView
//
//  Created by Kaedin Schouten on 19/09/2021.
//

import Foundation
import SwiftUI

struct LaunchTileView: View {
    var id, name, date, imageUrl : String
    var flightNumber: Int
    let backgroundColor = Color(.sRGB, red: 51/255, green: 51/255, blue: 255/255,
                                opacity: 0.5)
    
    var body: some View{
        DefaultCardView(backgroundColor: backgroundColor, content: AnyView(
            VStack{
                HStack{
                    if imageUrl != ""{
                        DefaultUrlImageView(url: imageUrl, maxWidth: 150)
                    }
                    VStack(alignment: .center){
                        Text(name).bold().font(.title2)
                        Text(date).font(.footnote)
                        Text("Flight number: \(String(flightNumber))").font(.system(size: 12))
                    }
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .center
                )
                
            }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
        ))
    }
}
