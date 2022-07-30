//
//  ClockViewController.swift
//  RxTraining
//
//  Created by C330593 on 27/07/22.
//

import UIKit
import RxSwift

class ClockViewController: UIViewController {
    
    // MARK: - Private Variables
    
    let disposeBag = DisposeBag()

    // MARK: - IBOutlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var getTimeButton: UIButton!
    
    // MARK: - Life Cycle
    
    init() {
        let bundle = Bundle(for: ClockViewController.classForCoder())
        super.init(nibName: "ClockViewController", bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been imple mented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getTimeButton.rx.tap
            .map { [unowned self] in self.getNowTime() }
            .bind(to: self.dateLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private Methods
    
    private func getNowTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        return "\(hour)h:\(minute)m:\(second)s"
    }

}
