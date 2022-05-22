//
//  HomeViewModel.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 21/04/2022.
//

import Foundation


class HomeViewModel : NSObject {
    
    var network = Networking()
    var bindSuccessToView : (()->()) = {}
    var movies : [Movie]! {
        didSet {
            self.bindSuccessToView()
        }
    }
    var bindFailedToView : (()->()) = {}
    var error : String!{
        didSet{
            self.bindFailedToView()
        }
    }

    override init(){
        super.init()
        self.fetchMoviesDataFromAPI()
    }
    
    func fetchMoviesDataFromAPI(){
        network.fetchMoviesFromAPI { movies, error in
            if let movies = movies {
                self.movies = movies
            }else {
                self.error = error?.localizedDescription
            }

        }
    }
}
