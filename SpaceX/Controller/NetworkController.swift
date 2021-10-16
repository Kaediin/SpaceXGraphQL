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
            } catch let jsonErrror{
                completion(.failure(jsonErrror.localizedDescription as! Error))
            }
        }.resume()
    }
    
    func getRockets(completion: @escaping (Result<[Rocket], Error>) -> Void) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
            print("Invalid URL!"); return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do{
                let rockets = try! JSONDecoder().decode([Rocket].self, from: data!)
                completion(.success(rockets))
            } catch let jsonErrror{
                completion(.failure(jsonErrror.localizedDescription as! Error))
            }
        }.resume()
    }
    func getRocketById(rocketId: String, completion: @escaping (Result<Rocket, Error>) -> Void) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets/\(rocketId)") else {
            print("Invalid URL!"); return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do{
                let rocket = try! JSONDecoder().decode(Rocket.self, from: data!)
                completion(.success(rocket))
            } catch let jsonErrror{
                completion(.failure(jsonErrror.localizedDescription as! Error))
            }
        }.resume()
    }
}
