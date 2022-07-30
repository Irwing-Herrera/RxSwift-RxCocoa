//
//  SubjectReplaySubject.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift

class SubjectReplaySubject: NSObject {
    
    /// Obtiene los ultiimos `N datos` en memoria al relizar la subscripsion al Observable
    /// Si desea reproducir más que el elemento más reciente a los nuevos suscriptores en la suscripción inicial, debe utilizar un ReplaySubject.
    /// Con un ReplaySubject, puede definir cuántos elementos recientes quiere emitir a los nuevos suscriptores.
    
    static var instance = { SubjectReplaySubject() }()
    
    override init() {
        
        let disposeBag = DisposeBag()
        let replaySubject = ReplaySubject<String>.create(bufferSize: 3)
        
        replaySubject.on(.next("a"))
        replaySubject.on(.next("b"))
        
        let subscriptorOne = replaySubject
            .subscribe { event in
                print("subscribe 1: ", event.element ?? event)
            }
        
        replaySubject.on(.next("c"))
        replaySubject.on(.next("d"))
        
        let subscriptorTwo = replaySubject
            .subscribe { event in
                print("subscribe 2: ", event.element ?? event)
            }
        
        replaySubject.on(.next("e"))
        replaySubject.on(.next("f"))
        replaySubject.on(.next("g"))
        
        subscriptorOne.disposed(by: disposeBag)
        subscriptorTwo.disposed(by: disposeBag)
        
    }
}
