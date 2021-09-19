//
//  ContentView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 17/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var launches = [Launch]()
    
    var body: some View {
        List(launches, id: \.self.id){launch in
            VStack(spacing: 10){
                Text(launch.name ?? "").bold()
                Text(launch.dateUTC ?? "")
                Text(launch.id).foregroundColor(.gray)
            }.cornerRadius(10)
                .padding(20)
        }.onAppear(){
            getLaunchesData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView{
    
    func getLaunchesData(){
        NetworkController().getLaunches{ (result) in
            switch result{
            case.success(let launches):
                DispatchQueue.main.async {
                    self.launches = launches.reversed()
                    //                    for launch in launches{
                    //                        print(launch.flightNumber ?? "")
                    //                    }
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
