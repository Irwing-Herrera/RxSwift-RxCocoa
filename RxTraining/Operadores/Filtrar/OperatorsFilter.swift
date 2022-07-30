//
//  OperatorsFilter.swift
//  RxTraining
//
//  Created by C330593 on 28/07/22.
//

import Foundation
import RxSwift

class OperatorsFilter: NSObject {
    
    static var instance = { OperatorsFilter() }()
    let disposeBag = DisposeBag()
    let numbersArray = Observable<Int>.of(1,2,3,4,5,6,7,8,9)
    let numbersArraySingle = Observable<Int>.of(1)
    let numbersArrayDistinctUntilChanged = Observable<Int>.of(1,1,2,3,4,5,3,3,1,2,3,3,4)
    
    override init() {
        super.init()
        
        //self.operatorFilter()
        //self.operatorSingle()
        //self.operatorDistinctUntilChanged()
        //self.operatorTake()
        self.operatorSkip()
    }
    
    // MARK: - Private Methods
    
    private func operatorFilter() -> Void {
        self.numbersArray
            .filter({ number in number > 3})
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    private func operatorSingle() -> Void {
        self.numbersArraySingle
            .single()
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    private func operatorDistinctUntilChanged() -> Void {
        self.numbersArrayDistinctUntilChanged
            .distinctUntilChanged()
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    private func operatorTake() -> Void {
        self.numbersArray
            .take(3)
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    private func operatorSkip() -> Void {
        self.numbersArray
            .skip(3)
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
}

