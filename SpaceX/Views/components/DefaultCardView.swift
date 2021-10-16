//
//  DefaultCardView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 15/10/2021.
//

import Foundation
import SwiftUI

struct DefaultCardView: View {
    
    var backgroundColor: Color = Color(.sRGB, red: 51/255, green: 51/255, blue: 255/255,
                                       opacity: 0.5)
    var cornerRadius: CGFloat = 10
    var content: AnyView
    var sheetContent: AnyView?
    var activateSheet = false
    @State var showSheet = false
    
    init(backgroundColor: Color?, content: AnyView){
        self.content = content
        self.sheetContent = content
        if backgroundColor != nil{
            self.backgroundColor = backgroundColor!
        }
    }
    
    init(backgroundColor: Color?, content: AnyView, contentIsSheet: Bool){
        self.content = content
        self.sheetContent = content
        self.activateSheet = contentIsSheet
        if backgroundColor != nil{
            self.backgroundColor = backgroundColor!
        }
    }
    
    init(content: AnyView){
        self.content = content
    }
    
    init(content: AnyView, contentIsSheet: Bool){
        self.content = content
        self.activateSheet = contentIsSheet
        self.sheetContent = content
    }
    
    init(content: AnyView, sheetContent: AnyView, backgroundColor: Color?){
        self.content = content
        self.activateSheet = true
        self.sheetContent = sheetContent
        if backgroundColor != nil{
            self.backgroundColor = backgroundColor!
        }
    }
    
    var body: some View{
        VStack{
            content
                .padding()
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(backgroundColor, lineWidth: 0)
                )
                .shadow(radius: cornerRadius)
        }.if(activateSheet){
            $0.onTapGesture {
                    showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet){
            ZStack{
                backgroundColor.edgesIgnoringSafeArea(.all)
                sheetContent?.padding()
            }
        }
    }
}
extension VStack {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
