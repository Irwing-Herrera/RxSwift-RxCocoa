//
//  PokemonsViewController.swift
//  RxTraining
//
//  Created by C330593 on 28/07/22.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    // MARK: - Life Cycle

    init() {
        let bundle = Bundle(for: PokemonsViewController.classForCoder())
        super.init(nibName: "PokemonsViewController", bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been imple mented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
