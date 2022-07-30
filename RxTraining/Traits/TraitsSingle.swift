//
//  TraitsSingle.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift

class TraitsSingle: NSObject {
    
    /// Es un Observable que solo permite un item o un error
    ///  `next | error`
    
    static var instance = { TraitsSingle() }()
    
    override init() {
        
        let disposedBag = DisposeBag()
        
        Single<String>
            .just("Single Item")
            .subscribe(
                onSuccess: { (element: String) in
                    print(element)
                }, onError: { (error: Error) in
                    print("Error: ", error)
                }
            )
            .disposed(by: disposedBag)
    }
}
