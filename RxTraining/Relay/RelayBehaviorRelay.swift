//
//  RelayPublishRelay.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift
import RxCocoa

class RelayBehaviorRelay: NSObject {
    
    /// Emiten constantemente hasta que se realiza una des subscripcion
    /// Mantiene el mismo funcionamiento BehaviorSubject
    
    static var instance = { RelayBehaviorRelay() }()
    
    override init() {
        
        let disposeBag = DisposeBag()
        let behaviorRelay = BehaviorRelay<String>(value: "default")
        
        behaviorRelay.accept("a")
        behaviorRelay.accept("b")
        
        let subscriptorOne = behaviorRelay
            .subscribe { event in
                print("subscribe 1: ", event.element ?? event)
            }
        
        behaviorRelay.accept("c")
        behaviorRelay.accept("d")
        
        let subscriptorTwo = behaviorRelay
            .subscribe { event in
                print("subscribe 2: ", event.element ?? event)
            }
        
        behaviorRelay.accept("e")
        behaviorRelay.accept("f")
        behaviorRelay.accept("g")
        
        subscriptorOne.disposed(by: disposeBag)
        subscriptorTwo.disposed(by: disposeBag)
    }
}
