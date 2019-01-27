//
//  RemoteRepository.swift
//  TT
//
//  Created by Tak on 27/01/2019.
//  Copyright © 2019 MashUpTT. All rights reserved.
//

import UIKit

class RemoteRepository {
    
    static let shared = RemoteRepository()
    
    private let baseUrl = ""
    
    private init() { }
    
    func fetchImage(imageURL: String, completion: @escaping (UIImage) -> ()) {
        guard let imageURL = URL(string: imageURL) else {
            return
        }
        
        NetworkService.shared.fetchImage(imageURL: imageURL) { (image, dataCount) in
            completion(image)
        }
    }
}
