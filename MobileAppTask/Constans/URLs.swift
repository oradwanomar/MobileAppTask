//
//  URLs.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 21/04/2022.
//

import Foundation

struct URLs {
    
    static let shared = URLs()
    
    private let baseURL = "https://api.androidhive.info/json/"
    
    
    func getAllMovies() -> URL? {
        return URL(string: baseURL + "movies.json")
    }
}
