//
//  CardView.swift
//  CardView
//
//  Created by Kaedin Schouten on 19/09/2021.
//

import Foundation
import SwiftUI

struct CardView: View {
    var imageUrl : String
    var name: String
    var id: String
    var date: String
    @ObservedObject var imageLoader = ImageLoader()
    @State var image = UIImage()
    
    var body: some View{
        VStack{
            VStack{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, alignment: .center)
                .onAppear(){
                    self.imageLoader.loadData(from: imageUrl)
                }
                .onReceive(imageLoader.$data) { data in
                    guard let data = data else { return }
                    self.image = UIImage(data: data) ?? UIImage()
                }
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .center
              )
            VStack(alignment: .center){
                Text(name).bold()
                Text(date).font(.system(size: 9)).foregroundColor(.gray)
            }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .topLeading
            )
        .cornerRadius(10)
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
                              opacity: 0.3), lineWidth: 5)
        )
        
    }
}
