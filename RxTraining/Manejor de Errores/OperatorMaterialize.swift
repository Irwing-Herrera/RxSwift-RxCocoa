//
//  OperatorMaterialize.swift
//  RxTraining
//
//  Created by C330593 on 29/07/22.
//

import Foundation
import RxSwift

class OperatorMaterialize: NSObject {
    
    /// ✅ Personalizar errores de APIS
    
    static var instance = { OperatorMaterialize() }()
    
    let disposeBag = DisposeBag()
    var isSimulatedError: Bool = true
    
    override init() {
        super.init()
        
        self.operatorMaterialize()
    }
    
    /// Convierte la mision del Obsevable en 2 flujos posibles
    ///  1: Data
    ///  2: Error
    
    private func operatorMaterialize() -> Void {
        let fruitDataStreamShared: Observable<Event<String>> = self.fruitDataStream()
            .materialize()
            .share()
        
        fruitDataStreamShared
            .compactMap { $0.element }
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        fruitDataStreamShared
            .compactMap { $0.error?.localizedDescription }
            .subscribe { print($0) }
            .disposed(by: disposeBag)
    }
    
    private func fruitDataStream() -> Observable<String> {
        return Observable.create { observer in
            
            print("== Called the emission ===")
            
            if self.isSimulatedError {
                self.isSimulatedError = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                   observer.on(.error(SampleError()))
                }
                
            } else {
                
                observer.on(.next("🍎"))
                observer.on(.next("🍐"))
                observer.on(.next("🍊"))
                observer.on(.next("🍇"))
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    observer.on(.completed)
                }
            }
            return Disposables.create()
        }
    }
}
