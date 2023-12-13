//
//  NetworkConstant.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation


class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        
    }
    
    
    public var apiKey: String {
        get {
            // api key from //https://www.themoviedb.org/
            return "083d72fc92cc61a6a2d2a63b57db2d50"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
