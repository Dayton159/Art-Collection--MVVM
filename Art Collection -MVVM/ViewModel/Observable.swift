//
//  Observable.swift
//  Art Collection -MVC
//
//  Created by Dayton on 02/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import Foundation


class Observable<T> {
    typealias Listener = (T) -> Void
    
    var listener:Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?){
        self.listener = listener
        listener?(value)
    }
}
