//
//  OperatorsMulticasting.swift
//  RxTraining
//
//  Created by C330593 on 28/07/22.
//

import Foundation
import RxSwift

class OperatorsMulticasting: NSObject {
    
    static var instance = { OperatorsMulticasting() }()
    let scheduler = SerialDispatchQueueScheduler(qos: .default)
    
    override init() {
        super.init()
        
        self.operatorShare()
    }
    
    
    // Nos permite compartir las emisiones de un observador a multiples observadores,
    // a demas de poder recuperar items pasados con el parametro replay
    
    private func operatorShare() -> Void {
        
        let source = Observable<Int>
            .interval(.seconds(1), scheduler: self.scheduler)
            .take(20)
            .share(replay: 1, scope: .whileConnected)
        /// Replay : 2 // Guarda en memorio el total de veces solicitado
        /// Scope :  .forever // Obtiene el ultimo valor emitido por el ultimo subscriptor
        
        let suscriptorOne = source
            .subscribe({ event in
                print("suscribe 1: ", event.element ?? event)
            })
        
        let suscriptorTwo = source
            .subscribe({ event in
                print("suscribe 2: ", event.element ?? event)
            })
        
        Thread.sleep(forTimeInterval: 3.0)
        suscriptorOne.dispose()
        
        Thread.sleep(forTimeInterval: 3.0)
        suscriptorTwo.dispose()
        
        Thread.sleep(forTimeInterval: 3.0)
        let suscriptorThree = source
            .subscribe({ event in
                print("suscribe 3: ", event.element ?? event)
            })
        
        Thread.sleep(forTimeInterval: 6.0)
        suscriptorThree.dispose()
    }
}
