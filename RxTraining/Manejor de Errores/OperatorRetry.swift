//
//  OperatorRetry.swift
//  RxTraining
//
//  Created by C330593 on 29/07/22.
//

import Foundation
import RxSwift

class OperatorRetry: NSObject {
    
    /// ✅ Reintentar realizar la nueva operacion
    
    static var instance = { OperatorRetry() }()
    
    let disposeBag = DisposeBag()
    var isSimulatedError: Bool = true
    
    override init() {
        super.init()
        
        self.operatorRetry()
    }
    
    // Realiza la re invocacion N veces o puede ser infinita pero puede provocar fugas de memoria
    private func operatorRetry() -> Void {
        self.fruitDataStream()
            .retry(3)
            .subscribe { print($0) }
            .disposed(by: disposeBag)
    }
    
    private func fruitDataStream() -> Observable<String> {
        return Observable.create { observer in
            
            print("== Called the emission ===")
            
            if self.isSimulatedError {
                self.isSimulatedError = false
                observer.on(.error(SampleError()))
            }
            
            
            observer.on(.next("🍎"))
            observer.on(.next("🍐"))
            observer.on(.next("🍊"))
            observer.on(.next("🍇"))
            observer.on(.completed)
            return Disposables.create()
        }
    }
}
