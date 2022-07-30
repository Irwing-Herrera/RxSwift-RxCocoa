//
//  SubjectBehaviorSubject.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift

class SubjectBehaviorSubject: NSObject {
    
    /// Un behaviorSubject dará a cualquier suscriptor el elemento más reciente y todo lo que emita esa secuencia después de que haya ocurrido la suscripción.
    
    static var instance = { SubjectBehaviorSubject() }()
    
    override init() {
        
        let disposeBag = DisposeBag()
        let behaviorSubject = BehaviorSubject<String>(value: "default")
        
        behaviorSubject.on(.next("a"))
        behaviorSubject.on(.next("b"))
        
        let subscriptorOne = behaviorSubject
            .subscribe { event in
                print("subscribe 1: ", event.element ?? event)
            }
        
        behaviorSubject.on(.next("c"))
        behaviorSubject.on(.next("d"))
        
        let subscriptorTwo = behaviorSubject
            .subscribe { event in
                print("subscribe 2: ", event.element ?? event)
            }
        
        behaviorSubject.on(.next("e"))
        behaviorSubject.on(.next("f"))
        behaviorSubject.on(.next("g"))
        
        subscriptorOne.disposed(by: disposeBag)
        subscriptorTwo.disposed(by: disposeBag)
        
    }
}
