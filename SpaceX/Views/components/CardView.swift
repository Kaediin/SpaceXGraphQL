//
//  CardView.swift
//  CardView
//
//  Created by Kaedin Schouten on 19/09/2021.
//

import Foundation
import SwiftUI

struct CardView: View {
    var id, name, date, imageUrl : String
    var flightNumber: Int
    @ObservedObject var imageLoader = ImageLoader()
    @State var image = UIImage()
    let backgroundColor = Color(.sRGB, red: 51/255, green: 51/255, blue: 255/255,
                                opacity: 0.5)
    
    var body: some View{
        VStack{
            HStack{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, alignment: .center)
                    .animation(.easeInOut(duration: 1))
                    .onAppear(){
                        self.imageLoader.loadData(from: imageUrl)
                    }
                    .onReceive(imageLoader.$data) { data in
                        guard let data = data else { return }
                        self.image = UIImage(data: data) ?? UIImage()
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
        .padding()
        .background(backgroundColor)
        .cornerRadius(10.0)
        .overlay(
            RoundedRectangle(cornerRadius: 10.0).stroke(backgroundColor, lineWidth: 0)
        )
        .shadow(radius: 10)
    }
}
