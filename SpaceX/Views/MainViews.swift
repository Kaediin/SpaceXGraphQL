////
////  MainViews.swift
////  MainViews
////
////  Created by Kaedin Schouten on 21/09/2021.
////
//
//import Foundation
//import SwiftUI
//
//struct LaunchTile: View {
//    let launch: Launch
//    var body: some View{
//        CardView(
//            id: launch.id,
//            name: launch.name,
//            date: getDateString(dateString: launch.dateUTC),
//            imageUrl: launch.links?.patch?.small ?? "",
//            flightNumber: launch.flightNumber
//        ).padding(.vertical, 10)
//    }
//}
//
//extension LaunchTile{
//
//    func getDateString(dateString: String) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        let localDate = formatter.date(from: dateString)
//        let nFormatter = DateFormatter()
//        nFormatter.dateFormat = "EEEE, MMM d, yyyy - HH:mm"
//        let nDate = nFormatter.string(from: localDate!)
//        return nDate
//    }
//
//    func getLaunchesData(){
//        NetworkController().getLaunches{ (result) in
//            switch result{
//            case.success(let launches):
//                DispatchQueue.main.async {
//                    self.launches = launches.reversed()
//                }
//            case.failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
