//
//  OperatorCatchError.swift
//  RxTraining
//
//  Created by C330593 on 29/07/22.
//

import Foundation
import RxSwift

class OperatorCatchError: NSObject {
    
    /// ✅ Notificacion de Usurio
    /// ✅ Presentar informacion de cache
    /// ✅ Reintentar realizar la nueva operacion
    /// ✅ Registrar error en los logs
    /// ✅ Personalizar errores de APIS
    
    static var instance = { OperatorCatchError() }()
    
    let disposeBag = DisposeBag()
    var isSimulatedError: Bool = true
    
    override init() {
        super.init()
        
        self.operatorCatchError()
    }
    
    
    // Imprime un elemento y finaliza el flujo
    // Manipular el error ayuda a mantener la Susbcripcion Activa
    private func operatorCatchError() -> Void {
        self.fruitDataStream()
            .catchError({ error in Observable.just("🥑")})
            .subscribe { print($0) }
            .disposed(by: disposeBag)
    }
    
    private func fruitDataStream() -> Observable<String> {
        return Observable.create { observer in
            
            if self.isSimulatedError {
                observer.on(.error(SampleError()))
            }
            
            print("== Called the emission ===")
            observer.on(.next("🍎"))
            observer.on(.next("🍐"))
            observer.on(.next("🍊"))
            observer.on(.next("🍇"))
            observer.on(.completed)
            return Disposables.create()
        }
    }
}
