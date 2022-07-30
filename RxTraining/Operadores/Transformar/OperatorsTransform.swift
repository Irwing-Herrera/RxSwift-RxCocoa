//
//  OperatorsTransform.swift
//  RxTraining
//
//  Created by C330593 on 28/07/22.
//

import Foundation
import RxSwift

class OperatorsTransform: NSObject {
    
    static var instance = { OperatorsTransform() }()
    let disposeBag = DisposeBag()
    
    let numbersArray = Observable<Int>.of(1,2,3,4,5,6,7,8,9,10)
    let otherNumbersArray = Observable<Int>.of(100,101,102,103,104,105)
    let stringNumbersArray = Observable<String>.of("200","201","202","203","204","205")
    
    override init() {
        super.init()
        
        //self.operatorMap()
        //self.operatorConcat()
        //self.operatorScan()
        //self.operatorReduce()
        //self.operatorToArray()
        //self.operatorFlatmap()
        //self.operatorConcatMap()
        self.operatorFlatMapLatest()
    }
    
    // MARK: - Private Methods
    
    private func operatorMap() -> Void {
        self.numbersArray
            .map({ number in number * 2})
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
        
        self.numbersArray
            .map({ number in "Convert to String \(number * 2)"})
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    private func operatorConcat() -> Void {
        self.numbersArray
            .concat(self.otherNumbersArray)
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
        
        self.numbersArray
            .map({ number in "\(number)"})
            .concat(self.stringNumbersArray)
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Acumular el Valor de los items emitidos iniciando con un valor cero
    private func operatorScan() -> Void {
        self.numbersArray
            .scan(0, accumulator: { oldValue, newValue in
                oldValue + newValue
            })
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
        
        self.numbersArray
            .scan(0, accumulator: { oldValue, newValue in
                oldValue + newValue
            })
            .takeLast(1) // -> Obtener solo el ultimo valor con un operador de filtro
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Similar a Scan, solo que totaliza
    private func operatorReduce() -> Void {
        self.numbersArray
            .reduce(0, accumulator: { oldValue, newValue in
                oldValue + newValue
            })
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Solo espera un onComplete y pasa por cada elemento
    private func operatorToArray() -> Void {
        self.numbersArray
            .toArray()
            .subscribe({ number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    /// Imagina una Secuencia Observable que consiste en objetos que son a su vez Observables y quieres crear una nueva Secuencia a partir de ellos.
    /// Aquí es donde FlatMap entra en juego. FlatMap fusiona la emisión de estos Observables resultantes y emite estos resultados fusionados como su propia secuencia.
    private func operatorFlatmap() -> Void {
        self.numbersArray
            .flatMap({ number -> Observable<String> in
                Observable
                    .just(number)
                    .map({ number in
                        "\(number) like String"
                    })
            })
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
        
        self.numbersArray
            .flatMap({ number -> Observable<String> in
                Observable
                    .of("A", "B")
                    .map({ letter in
                        letter + "\(number) like String"
                    })
            })
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Realiza lo mismo que el flatMap pero este mantiene un orden
    private func operatorConcatMap() -> Void {
        self.numbersArray
            .concatMap({ number -> Observable<String> in
                Observable
                    .of("A", "B")
                    .map({ letter in
                        letter + "\(number) like String"
                    })
            })
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    // Evitar recibir eventos inecesarios
    private func operatorFlatMapLatest() -> Void {
        self.numbersArray
            .flatMapLatest({ number -> Observable<String> in
                Observable
                    .of("A", "B")
                    .map({ letter in
                        letter + "\(number) like String"
                    })
            })
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
}
