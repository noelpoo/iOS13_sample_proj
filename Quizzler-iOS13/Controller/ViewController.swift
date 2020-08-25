

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    
    
    var quizBrain = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let answerIsCorrect = quizBrain.checkAnswer(userAnswer)
        
        if answerIsCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.updateScore(correct: answerIsCorrect)
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2,
                                     target: self,
                                     selector: #selector(updateUI),
                                     userInfo: true,
                                     repeats: false)
        //updateUI()
        
    }

    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.score)"
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        buttonOne.setTitle(quizBrain.getCurrentAnswers(index: 0), for: .normal)
        buttonTwo.setTitle(quizBrain.getCurrentAnswers(index: 1), for: .normal)
        buttonThree.setTitle(quizBrain.getCurrentAnswers(index: 2), for: .normal)
        //trueButton.backgroundColor = UIColor.clear
        //falseButton.backgroundColor = UIColor.clear
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
        buttonThree.backgroundColor = UIColor.clear
    }

}


