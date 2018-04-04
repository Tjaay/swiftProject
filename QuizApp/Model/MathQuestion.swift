//
//  MathQuestion.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-03.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit

class MathQuestion: NSObject {
  var question:String
  var choiceOne: String
  var choiceTwo: String
  var choiceThree: String
  var choiceFour: String
  var answer: Int
  
  init( question: String, choiceOne: String, choiceTwo: String, choiceThree: String,
        choiceFour: String, answer: Int) {
    self.question = question
    self.choiceOne = choiceOne
    self.choiceTwo = choiceTwo
    self.choiceThree = choiceThree
    self.choiceFour = choiceFour
    self.answer = answer 
  }
}
