//
//  ViewController.swift
//  RxTraining
//
//  Created by C330593 on 26/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    let traitsMaybe: HilosSchedulers = HilosSchedulers.instance
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var showClockCiewControllerButton: UIButton!
    
    // MARK: - IBActions
    
    @IBAction func showClockViewController(_ sender: Any) {
        let clockView = ClockViewController()
        present(clockView, animated: true, completion: nil)
    }
    
    @IBAction func showPokemonViewController(_ sender: Any) {
        let pokemonView = PokemonsViewController()
        present(pokemonView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
