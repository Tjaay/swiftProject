//
//  MathQuizViewController.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-03.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit

protocol MathQuizDelegate: class {
    func mathQuizVC(_ control: MathQuizViewController, didAddScore item: HighScore
    )
}

class MathQuizViewController: UIViewController {
    @IBOutlet weak var mathQuestionLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var choiceOneBtn: UIButton!
    @IBOutlet weak var choiceTwoBtn: UIButton!
    @IBOutlet weak var choiceThreeBtn: UIButton!
    @IBOutlet weak var choiceFourBtn: UIButton!
    
    let question = MathQuizQuestions()
    var questionIndex: Int = 0
    var correctAnswer: Int = 0
    var score: Int = 0
    var lives: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQuiz() {
        nextBtn.isHidden = true
        defaultButtonColors()
        questionNumberLabel.text = String(questionIndex + 1) + "/" + String(question.mathQuestions.count)
        let a = question.mathQuestions[questionIndex].choiceOne
        let b = question.mathQuestions[questionIndex].choiceTwo
        let c = question.mathQuestions[questionIndex].choiceThree
        let d = question.mathQuestions[questionIndex].choiceFour
        correctAnswer = question.mathQuestions[questionIndex].answer
        mathQuestionLabel.text = question.mathQuestions[questionIndex].question
        choiceOneBtn.setTitle(a, for: UIControlState.normal)
        choiceTwoBtn.setTitle(b, for: UIControlState.normal)
        choiceThreeBtn.setTitle(c, for: UIControlState.normal)
        choiceFourBtn.setTitle(d, for: UIControlState.normal)
        updateLabels()
    }
    
    func defaultButtonColors() {
        choiceOneBtn.backgroundColor = UIColor(red:0.13, green:0.48, blue:1.00, alpha:1.0)
        choiceTwoBtn.backgroundColor = UIColor(red:0.13, green:0.48, blue:1.00, alpha:1.0)
        choiceThreeBtn.backgroundColor = UIColor(red:0.13, green:0.48, blue:1.00, alpha:1.0)
        choiceFourBtn.backgroundColor = UIColor(red:0.13, green:0.48, blue:1.00, alpha:1.0)
    }
    
    func nextQuestion(){
        setQuiz()
        defaultButtonColors()
        enableBtns()
    }
    
    func disableBtns() {
        choiceOneBtn.isEnabled = false
        choiceTwoBtn.isEnabled = false
        choiceThreeBtn.isEnabled = false
        choiceFourBtn.isEnabled = false
    }
    
    func enableBtns(){
        choiceOneBtn.isEnabled = true
        choiceTwoBtn.isEnabled = true
        choiceThreeBtn.isEnabled = true
        choiceFourBtn.isEnabled = true
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        livesLabel.text = String(lives)
    }
    
    func resetQuiz() {
        score = 0
        lives = 3
        questionIndex = 0
        setQuiz()
    }
    
    func gameAlert(_ msg:String) {
        let alert = UIAlertController(title: "Game Over", message:
            msg, preferredStyle: UIAlertControllerStyle.alert)
        
        let done = UIAlertAction(title: "Add Score", style: .default,
                                 handler: {(action:UIAlertAction!) in
                                    print("you have pressed the ok button")
                                    })
        let again = UIAlertAction(title: "Play Again", style: .default,
                                  handler: {(action:UIAlertAction!) in
                                    self.resetQuiz()
                                    })
        alert.addTextField { (textField) in
            textField.text = "Some default text"
        }
        alert.addAction(done)
        alert.addAction(again)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func choicePicked(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            sender.backgroundColor = UIColor(red:0.17, green:0.60, blue:0.22, alpha:1.0)
            questionIndex += 1
            score += 10
            disableBtns()
            updateLabels()
            nextBtn.isHidden = false
        } else {
            sender.backgroundColor = UIColor(red:1.00, green:0.28, blue:0.13, alpha:1.0)
            lives = lives - 1
            updateLabels()
            if lives == 0 {
                gameAlert("Add your score to the High Scores List or play again!")
            }
        }
      
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        nextQuestion()
    }

}
