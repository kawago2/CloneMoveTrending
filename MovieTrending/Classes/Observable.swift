//
//  Observable.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

class Observable<T> {
    
    // MARK: - Properties
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    // MARK: - Initialization
    init(_ value: T?) {
        self.value = value
    }
    
    // MARK: - Listener
    private var listener: ((T?) -> Void)?
    
    // MARK: - Binding
    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
