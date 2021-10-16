//
//  LaunchRocketView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 15/10/2021.
//

import Foundation
import SwiftUI

struct LaunchRocketView: View{
    
    var rocketId: String
    @State var rocket = Rocket()
    
    var body: some View{
        DefaultCardView(content: AnyView(
            VStack{
                Text(rocket.name ?? "No rocket name found").font(.system(size: 22, weight: .bold)).padding()
                DefaultUrlImageView(url: "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg",
                                    maxWidth: .greatestFiniteMagnitude,
                                    borderRadius: 10)
            }.onAppear(){
                getRocketData(rocketId: rocketId)
            }))
    }
}

extension LaunchRocketView{
    func getRocketData(rocketId: String){
        NetworkController().getRocketById(rocketId: rocketId){ (result) in
            switch result{
            case.success(let rocket):
                DispatchQueue.main.async {
                    self.rocket = rocket
                    print(rocket.flickrImages?.first ?? "No image found")
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
