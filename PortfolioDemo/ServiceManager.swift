//
//  ServiceManager.swift
//  PortfolioDemo
//
//  Created by BBU on 23/06/22.
//

import Foundation
import UIKit
class ServiceManager {
    func itemFetch(_ offset: Int, limit: Int, completionHandler: @escaping (Data) -> Void){
        if let url = URL(string: "http://sd2-hiring.herokuapp.com/api/users?offset=10&limit=10"){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                            (200...299).contains(httpResponse.statusCode) else {
                    debugPrint("Error with the response, unexpected status code: \(response)")
                    return
                }
               
                if let data = data,
                        let response = try? JSONDecoder().decode(ResponseModel.self, from: data) {
                    if let result = response.data{
                        completionHandler(result)
                    }
                }
            
            }
            task.resume()
        }
    }
}
