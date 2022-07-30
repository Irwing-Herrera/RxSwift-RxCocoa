//
//  SubjectPublishSubject.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift

class SubjectPublishSubject: NSObject {
    
    /// Si se suscribe a él obtendrá todos los eventos que se produzcan después de haberse suscrito.
    
    static var instance = { SubjectPublishSubject() }()
    
    override init() {
        
        let disposeBag = DisposeBag()
        let publishSubjet = PublishSubject<String>()
        
        publishSubjet.on(.next("a"))
        publishSubjet.on(.next("b"))
        
        let subscriptorOne = publishSubjet
            .subscribe { event in
                print("subscribe 1: ", event.element ?? event)
            }
        
        publishSubjet.on(.next("c"))
        publishSubjet.on(.next("d"))
        
        let subscriptorTwo = publishSubjet
            .subscribe { event in
                print("subscribe 2: ", event.element ?? event)
            }
        
        publishSubjet.on(.next("e"))
        publishSubjet.on(.next("f"))
        publishSubjet.on(.next("g"))
        
        subscriptorOne.disposed(by: disposeBag)
        subscriptorTwo.disposed(by: disposeBag)
        
    }
}
