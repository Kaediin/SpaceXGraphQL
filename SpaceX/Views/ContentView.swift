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
        ScrollView{
            LazyVStack{
                ForEach(launches, id: \.self.id){ launch in
                    CardView(
                        imageUrl: launch.links?.patch?.small ?? "",
                        name: launch.name ?? "",
                        id: launch.id,
                        date: launch.dateLocal ?? ""
                    ).padding(.vertical, 10)
                }
            }.padding(20)
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
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
