//
//  TraitsComplete.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift

class TraitsComplete: NSObject {
    
    /// Realiza solo el envio de un evento solo cuando este haya completado
    ///  `error | completed`
    
    static var instance = { TraitsComplete() }()
    
    override init() {
        
        let disposedBag = DisposeBag()
        
        Completable
            .empty()
            .subscribe(
                onCompleted: {
                    print("Task Complete")
                },
                onError: { error in
                    print("Error: ", error)
                }
            )
            .disposed(by: disposedBag)
        
        
    }
}
