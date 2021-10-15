//
//  DetailHeadingView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 15/10/2021.
//

import Foundation
import SwiftUI

struct DetailHeadingView: View{
    
    let launch: Launch
    var showingImage: Bool
    @State var mission_patch_image = UIImage()
    @ObservedObject var imageLoader = ImageLoader()
    @State private var backgroundColor: Color = Color.clear
    
    var body: some View{
        VStack{
            HStack(){
                VStack{
                    Text(launch.name).font(.system(size: 30, weight: .bold))
                }.frame(maxWidth: .infinity, alignment: .center)
                if showingImage {
                    VStack{
                        Image(uiImage: mission_patch_image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, alignment: .center)
                            .animation(.linear)
                            .onAppear(){
                                self.imageLoader.loadData(from: launch.links?.patch?.small)
                            }
                            .onReceive(imageLoader.$data) { data in
                                guard let data = data else { return }
                                self.mission_patch_image = UIImage(data: data) ?? UIImage()
                            }
                    }
                }
            }
            VStack{
                LaunchSuccessView(status: launch.success, date: LaunchesView().getDateString(dateString: launch.dateUTC))
            }
        }.onAppear(){
            backgroundColor = launch.success == true ?
            Color(.sRGB, red: 0/255, green: 153/255, blue: 51/255,
                  opacity: 1) : launch.success == false ?
            Color(.sRGB, red: 204/255, green: 0/255, blue: 0/255,
                  opacity: 1) : Color.clear
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(10.0)
        .overlay(
            RoundedRectangle(cornerRadius: 10.0).stroke(backgroundColor, lineWidth: 0)
        )
        .shadow(radius: 10)
        
    }
}
