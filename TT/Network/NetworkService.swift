//
//  NetworkService.swift
//  TT
//
//  Created by Tak on 27/01/2019.
//  Copyright © 2019 MashUpTT. All rights reserved.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    private let session = URLSession.shared
    
    private init() { }

    public func fetchImage(imageURL: URL, completion: @escaping (UIImage, Int) -> ()) {
        
        session.dataTask(with: imageURL) { (data, response, error) in
            guard
                let data = data,
                let image = UIImage(data: data) else {
                    
                    return
            }
            
            DispatchQueue.main.async {
                completion(image, data.count)
            }
        }.resume()
    }
    
}


