//
//  NetworkController.swift
//  NetworkController
//
//  Created by Kaedin Schouten on 18/09/2021.
//

import Foundation
class NetworkController{
    
    func getLaunches(completion: @escaping (Result<[Launch], Error>) -> Void) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches/past") else {
            print("Invalid URL!"); return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do{
                let launches = try! JSONDecoder().decode([Launch].self, from: data!)
                completion(.success(launches))
                print("Succes!")
            } catch let jsonErrror{
                completion(.failure(jsonErrror.localizedDescription as! Error))
            }
        }.resume()
    }
}
