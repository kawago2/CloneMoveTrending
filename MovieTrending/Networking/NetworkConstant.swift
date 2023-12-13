//
//  NetworkConstant.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

class NetworkConstant {
    
    // MARK: - Singleton
    public static var shared: NetworkConstant = NetworkConstant()
    private init() {
        // Private initialization to enforce singleton pattern
    }
    
    // MARK: - API Key
    public var apiKey: String {
        // Replace the API key with your own from https://www.themoviedb.org/
        return "083d72fc92cc61a6a2d2a63b57db2d50"
    }
    
    // MARK: - Server Addresses
    public var serverAddress: String {
        return "https://api.themoviedb.org/3/"
    }
    
    public var imageServerAddress: String {
        return "https://image.tmdb.org/t/p/w500/"
    }
}
