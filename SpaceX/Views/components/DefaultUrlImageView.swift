//
//  DefaultImageView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 15/10/2021.
//

import Foundation
import SwiftUI

struct DefaultUrlImageView: View {
    
    var url: String
    var maxWidth: CGFloat
    var borderRadius: CGFloat = 0
    @ObservedObject var imageLoader = ImageLoader()
    @State var image = UIImage()
    
    var body: some View{
        VStack{
//            Text(url)
//            Text("Wdith: \(width)")
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: maxWidth, alignment: .center)
                .animation(.linear)
                .onAppear(){
                    self.imageLoader.loadData(from: url)
                }
                .onReceive(imageLoader.$data) { data in
                    guard let data = data else {
                        print("Something happened")
                        return
                    }
                    self.image = UIImage(data: data) ?? UIImage()
                }
                .cornerRadius(borderRadius)
        }
    }
}
