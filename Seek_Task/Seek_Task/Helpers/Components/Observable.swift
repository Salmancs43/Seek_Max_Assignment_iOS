//
//  Observable.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import Foundation

class Observable<T> {
    // The value to be observed
    var value: T {
        didSet {
            notifyObservers()
        }
    }

    // Array of observer callbacks
    private var observers: [((T) -> Void)?] = []

    // Initializer
    init(_ value: T) {
        self.value = value
    }

    // Function to add an observer
    func addObserver(_ observer: @escaping (T) -> Void) {
        observers.append(observer)
    }

    // Function to remove an observer
    func removeObserver(_ observer: @escaping (T) -> Void) {
        observers.removeAll { $0 == nil }
    }

    // Function to notify all observers of a change
    private func notifyObservers() {
        for observer in observers {
            observer?(value)
        }
    }
}
