//
//  QuizViewController.swift
//  QuizPractice
//
//  Created by HWB on 2022/5/26.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        csvArray = loadCSV(fileName: "quiz")
        setQuiz()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    // set quiz on view
    func setQuiz(){
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        // check the answer
        if sender.tag == Int(quizArray[1]){
            correctCount += 1
        } else {
            print("wrong")
        }
        nextQuiz()
        print(sender.tag)
    }
    
    // set the next quiz
    func nextQuiz() {
        quizCount += 1
        if quizCount < csvArray.count {
            setQuiz()
        } else {
            toScoreView()
        }
    }
    
    func toScoreView(){
        performSegue(withIdentifier: "toScoreVC", sender: nil)
        
    }
    
    
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do{
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
}
