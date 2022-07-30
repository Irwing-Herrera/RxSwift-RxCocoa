//
//  TraitsMaybe.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import Foundation
import RxSwift

class TraitsMaybe: NSObject {
    
    /// Realiza solo el envio de un evento ya sea cualquiera de los siguientes
    ///  `next | error | completed`
    
    static var instance = { TraitsMaybe() }()
    
    override init() {
        
        let disposedBag = DisposeBag()
        
        Maybe<String>
            .just("Single item (maybe will by emmitted or not)")
            .subscribe(
                onSuccess: { element in
                    print(element)
                },
                onError: { error in
                    print("Error: ", error)
                },
                onCompleted: {
                    print("Task Complete")
                }
            )
            .disposed(by: disposedBag)
    }
}
