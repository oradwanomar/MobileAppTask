//
//  Networking.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 21/04/2022.
//

import Foundation
import Alamofire

struct Networking {
    
    static let shared = Networking()
    
    func fetchMoviesFromAPI(completion: @escaping ([Movie]?,Error?)->Void){
        guard let url = URLs.shared.getAllMovies() else {return}
        AF.request(url)
            .validate()
            .responseDecodable(of: [Movie].self) { response in
                switch response.result {
                    
                    
                case .success(_):
                    guard let movies = response.value else {return}
                    completion(movies,nil)
                    
                    
                case .failure(let error):
                    print("error")
                    completion(nil,error)
                }
            }
    }
    
}
