//
//  RelayPublishRelay.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift
import RxCocoa

class RelayPublishRelay: NSObject {
    
    /// Emiten constantemente hasta que se realiza una des subscripcion
    /// Mantiene el mismo funcionamiento PublishSubject
    
    static var instance = { RelayPublishRelay() }()
    
    override init() {
        
        let disposeBag = DisposeBag()
        let publishRelay = PublishRelay<String>()
        
        publishRelay.accept("a")
        publishRelay.accept("b")
        
        let subscriptorOne = publishRelay
            .subscribe { event in
                print("subscribe 1: ", event.element ?? event)
            }
        
        publishRelay.accept("c")
        publishRelay.accept("d")
        
        let subscriptorTwo = publishRelay
            .subscribe { event in
                print("subscribe 2: ", event.element ?? event)
            }
        
        publishRelay.accept("e")
        publishRelay.accept("f")
        publishRelay.accept("g")
        
        subscriptorOne.disposed(by: disposeBag)
        subscriptorTwo.disposed(by: disposeBag)
    }
}
