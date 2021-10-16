//
//  ContentView.swift
//  SpaceX
//
//  Created by Kaedin Schouten on 17/09/2021.
//

import SwiftUI

struct LaunchesView: View{
    @State var launches = [Launch]()
    
    var body: some View{
        ScrollView{
            LazyVStack{
                ForEach(launches, id: \.self.id){ launch in
                    NavigationLink(destination: LauchDetails(launch: launch)){
                        LaunchTileView(
                            id: launch.id,
                            name: launch.name,
                            date: getDateString(dateString: launch.dateUTC),
                            imageUrl: launch.links?.patch?.small ?? "",
                            flightNumber: launch.flightNumber
                        ).padding(.vertical, 10)
                    }.foregroundColor(.white)
                }
            }.padding(20)
        }.onAppear(){
            getLaunchesData()
        }
        .navigationTitle("Launches")
    }
}


struct ContentView: View {
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: LaunchesView()){Text("Launches")}
        }.navigationTitle("SpaceX App by Kaedin Schouten")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension LaunchesView{
    
    func getDateString(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let localDate = formatter.date(from: dateString)
        let nFormatter = DateFormatter()
        nFormatter.dateFormat = "EEEE, MMM d, yyyy - HH:mm"
        let nDate = nFormatter.string(from: localDate!)
        return nDate
    }
    
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
