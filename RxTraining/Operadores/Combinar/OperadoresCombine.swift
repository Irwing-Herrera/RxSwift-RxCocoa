//
//  OperadoresCombine.swift
//  RxTraining
//
//  Created by C330593 on 28/07/22.
//

import Foundation
import RxSwift

class OperadoresCombine: NSObject {
    
    static var instance = { OperadoresCombine() }()
    let disposeBag = DisposeBag()
    
    let numbersArray = Observable<Int>.of(1,2,3,4,5)
    let otherNumbersArray = Observable<Int>.of(100,101,102,103,104,105)
    
    override init() {
        super.init()
        
        //self.operatorStartWith()
        //self.operatorMerge()
        //self.operatorSwitchLatest()
        //self.operatorZip()
        self.operatorCombineLatest()
    }
    
    
    // Agrega al inicio un elemento
    /// Si desea que un Observable emita una secuencia específica de elementos antes de que comience a emitir los elementos que normalmente se esperan de él, utilice el operador startWith.
    private func operatorStartWith() -> Void {
        self.numbersArray
            .startWith(0)
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Combinar ambos observables pero sin algun orden
    /// Puede combinar la salida de varios Observables para que actúen como un único Observable, utilizando el operador Merge.
    private func operatorMerge() -> Void {
        Observable
            .of(self.numbersArray, self.otherNumbersArray)
            .merge()
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Le da prioridad a los elementos mas recientes
    private func operatorSwitchLatest() -> Void {
        Observable
            .of(self.numbersArray, self.otherNumbersArray)
            .switchLatest()
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Combina en parejas
    /// El método Zip se utiliza si se desea combinar elementos emitidos por diferentes secuencias observables en una sola secuencia observable. Zip operará en secuencia estricta, por lo que los dos primeros elementos emitidos por Zip serán el primer elemento de la primera secuencia y el primer elemento de la segunda secuencia combinados. Tenga también en cuenta que Zip sólo emitirá tantos elementos como el número de elementos emitidos de la fuente de observables que menos elementos emita.
    
    private func operatorZip() -> Void {
        Observable
            .zip(self.numbersArray, self.otherNumbersArray)
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // TODO: no entendi
    private func operatorCombineLatest() -> Void {
        Observable
            .combineLatest(self.numbersArray, self.otherNumbersArray)
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
}
