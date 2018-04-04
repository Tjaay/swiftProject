//
//  WordQuizViewController.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-04.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit
import CoreData

protocol WordQuizDelegate: class {
    func wordQuizVC(_ control: WordQuizViewController, didAddScore item: WordHighScore
    )
}

class WordQuizViewController: UIViewController {
    @IBOutlet weak var wordLivesLabel: UILabel!
    @IBOutlet weak var wordsQuestionsLabel: UILabel!
    @IBOutlet weak var wordsScoreLabel: UILabel!
    @IBOutlet weak var choiceOneBtn: UIButton!
    @IBOutlet weak var choiceTwoBtn: UIButton!
    @IBOutlet weak var choiceThreeBtn: UIButton!
    @IBOutlet weak var choiceFourBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var questionImage: UIImageView!
    
    var managedObjectContext: NSManagedObjectContext!
    weak var delegate:WordQuizDelegate?
    var highScore:WordHighScore?
    
    var questionIndex: Int = 0
    var correctAnswer: Int = 0
    var score: Int = 0
    var lives: Int = 3
    
 
    let question = WordQuizQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choicePicked(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            sender.backgroundColor = UIColor(red:0.17, green:0.60, blue:0.22, alpha:1.0)
            questionIndex += 1
            score += 10
            disableBtns()
            updateLabels()
            if questionIndex == question.wordQuestions.count {
               gameAlert("GAME WON!")
            }
            nextBtn.isHidden = false
        } else {
            sender.backgroundColor = UIColor(red:1.00, green:0.28, blue:0.13, alpha:1.0)
            lives = lives - 1
            updateLabels()
           if lives == 0 {
               gameAlert("GAME OVER!")
            }
        }
        
    }
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        nextQuestion()
    }
    
  
    func setQuiz() {
        nextBtn.isHidden = true
        defaultButtonColors()
        wordsQuestionsLabel.text = String(questionIndex + 1) + "/" + String(question.wordQuestions.count)
        let a = question.wordQuestions[questionIndex].choiceOne
        let b = question.wordQuestions[questionIndex].choiceTwo
        let c = question.wordQuestions[questionIndex].choiceThree
        let d = question.wordQuestions[questionIndex].choiceFour
        correctAnswer = question.wordQuestions[questionIndex].answer
        questionImage.image = UIImage(named: question.wordQuestions[questionIndex].imageName)
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
        wordsScoreLabel.text = String(score)
        wordLivesLabel.text = String(lives)
    }
    
    func resetQuiz() {
        score = 0
        lives = 3
        questionIndex = 0
        setQuiz()
    }
    
    func gameAlert(_ msg:String) {
        highScore = WordHighScore(context: managedObjectContext)
        
        let alert = UIAlertController(title: msg, message:
            "Submit your high score or play again", preferredStyle: UIAlertControllerStyle.alert)
        
        let done = UIAlertAction(title: "Add Score", style: .default,
                                 handler: {(action:UIAlertAction!) in
                                    self.highScore!.name =  alert.textFields![0].text
                                    self.highScore!.score = String(self.score )
                                    do {
                                        try self.managedObjectContext.save()
                                    } catch {
                                        print("Core Data Error")
                                    }
                                    self.delegate?.wordQuizVC(self, didAddScore: self.highScore!)
        })
        let again = UIAlertAction(title: "Play Again", style: .default,
                                  handler: {(action:UIAlertAction!) in
                                    self.resetQuiz()
        })
        alert.addTextField { (textField) in
            textField.text = "Enter your name here"
        }
        alert.addAction(done)
        alert.addAction(again)
        present(alert, animated: true, completion: nil)
    }
    
 
    

    
}

