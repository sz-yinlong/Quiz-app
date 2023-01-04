

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    
    @objc func change() {
      view.backgroundColor = .clear  //change your color
    }
 
    
    
    
    @IBAction func answerButtonpressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // true,false
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
       
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            //answerForm.text = right
        } else {
            sender.backgroundColor = UIColor.red
            //answerForm.text = wrong
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
            
    }
       
    
        
    
    
        @objc func updateUI() {
         
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
}
    
    

    
    
   
        
        
        
        
        
        
        
        
        
        
    
    

