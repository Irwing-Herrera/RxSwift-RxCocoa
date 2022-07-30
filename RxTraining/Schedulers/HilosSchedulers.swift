//
//  HilosSchedulers.swift
//  RxTraining
//
//  Created by C330593 on 29/07/22.
//

import Foundation
import RxSwift

class HilosSchedulers: NSObject {
    
    /// Tipo de Schedulers
    /// - MainScheduler
    ///  - ✅ Actualizar componentes de la vista UI
    /// - SerialDispatchQueueScheduler
    ///  - ✅ Realiza peticion a una API de terceros
    ///  - ✅ Consultar un valor en las preferencias del usuario
    ///  - ✅ Consultar informacion de cache en local
    /// - ConcurrentDispatchQueueScheduler
    ///  - ✅ Realiza una tarea que tiene extenso computo. Por ejemplo: Leer un archivo de configuracion inicial de la aplicacion
    /// - OperationDispatchQueueScheduler
    ///  - ✅ Realiza una tarea que requiere bastante computo y manipulacion de proceso. Por ejemplo: Descarga un video y estar notificandoel avance de la descarga
    
    
    static var instance = { HilosSchedulers() }()
    
    let disposeBag = DisposeBag()
    let globalScheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    let serialScheduler = SerialDispatchQueueScheduler(qos: .default)
    
    override init() {
        super.init()
        
        self.animalsDataStream()
            .subscribeOn(serialScheduler)
            .logObservable()
            .observeOn(MainScheduler.instance)
            .logObserver()
            .disposed(by: disposeBag)
    }
    
    private func animalsDataStream() -> Observable<String> {
        return Observable.create { observer in
            observer.on(.next("🐮"))
            observer.on(.next("🐯"))
            observer.on(.next("🐶"))
            observer.on(.next("🐹"))
            observer.on(.completed)
            return Disposables.create()
        }
    }
}
