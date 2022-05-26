//
//  ScoreViewController.swift
//  QuizPractice
//
//  Created by HWB on 2022/5/26.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var correct = 0

    @IBOutlet weak var scoreCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreCountLabel.text = "\(correct)問正解"
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
}
