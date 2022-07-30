//
//  Multicasting.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift

class Multicasting: NSObject {
    
    /// Capacidad de un `Observable` para emitir datos a multiples `Observers` usando un canal `(Data Stream)` compartido.
    ///
    /// Multicasting se modela a traves de:
    ///     - Subjects
    ///     - Operadores
    ///     - HOT observables
    
    static var instance = { Multicasting() }()
    
    override init() {
        
        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        
        let source = Observable<Int>.interval(.seconds(1), scheduler: scheduler)
            .take(20)
            .share(replay: 1, scope: .whileConnected)
        
        
        let suscriptionOne = source
            .subscribe { event in
                print("Suscribe 1", event.element ?? event)
            }
        
        let suscriptionTwo = source
            .subscribe { event in
                print("Suscribe 2", event.element ?? event)
            }
        
        Thread.sleep(forTimeInterval: 3.0)
        suscriptionOne.dispose()
        
        Thread.sleep(forTimeInterval: 3.0)
        suscriptionTwo.dispose()
        
        Thread.sleep(forTimeInterval: 3.0)
        let suscriptionThree = source
            .subscribe { event in
                print("Suscribe 3", event.element ?? event)
            }
        
        Thread.sleep(forTimeInterval: 6.0)
        suscriptionThree.dispose()
    }
    
}
