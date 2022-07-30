//
//  OperatorCatchErrorJustReturn.swift
//  RxTraining
//
//  Created by C330593 on 29/07/22.
//

import Foundation
import RxSwift

class OperatorCatchErrorJustReturn: NSObject {
    
    /// ✅ Notificacion de Usurio
    /// ✅ Presentar informacion de cache
    
    static var instance = { OperatorCatchErrorJustReturn() }()
    
    let disposeBag = DisposeBag()
    var isSimulatedError: Bool = true
    
    override init() {
        super.init()
        
        self.operatorCatchErrorJustReturn()
    }
    
    // Realiza lo mismo que el catchError pero se simplefica el codigo en el operador
    private func operatorCatchErrorJustReturn() -> Void {
        self.fruitDataStream()
            .catchErrorJustReturn("🥑")
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
