//
//  ObservableType+Extension.swift
//  RxTraining
//
//  Created by C330593 on 29/07/22.
//

import Foundation
import RxSwift

extension ObservableType {
    public func logObservable() -> RxSwift.Observable<Self.Element> {
        return self.do(onNext: { element in
            let threadName = getThreadName()
            print("\(element) in Observable received on \(threadName)")
        })
    }
    
    public func logObserver() -> Disposable {
        return self.subscribe(onNext: { element in
            let threadName = getThreadName()
            print("\(element) in Observer received on \(threadName)")
        })
    }
    
    // MARK: - Private Methods
    
    private func getThreadName() -> String {
        if Thread.current.isMainThread {
            return "Main Thread"
        } else if let name = Thread.current.name {
            if name == "" {
                return "Anonymous Thread"
            }
            return name
        } else {
            return "Unknown Thread"
        }
    }
}


