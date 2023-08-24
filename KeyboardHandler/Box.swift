//
//  Box.swift
//  KeyboardHandler
//
//  Created by Chun-Li Cheng on 2023/8/24.
//

import Foundation


class Box<T> {
    typealias Listener = (T) -> Void
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    var listener: (Listener)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    
}
