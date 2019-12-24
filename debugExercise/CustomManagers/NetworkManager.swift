//
//  NetworkManager.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getFamilyGuyCharacters(completion: @escaping ([Cast]) -> ()) {
        let url = URL(string: Constants.urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                    return
                }
                if let data = data {
                    completion(JsonHandler().decodeJson(data: data)!)
                }
            }
        }
        task.resume()
    }
    
    func downloadImage(from url: URL) -> UIImage {
        var imageData: Data?
        getData(from: url) { data, response, error in
            imageData = data
            
        }
        return UIImage(data: imageData ?? Data()) ?? UIImage()
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}
