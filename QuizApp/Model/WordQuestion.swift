//
//  WordQuestion.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-04.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit

class WordQuestion: NSObject {
    var imageName:String
    var choiceOne: String
    var choiceTwo: String
    var choiceThree: String
    var choiceFour: String
    var answer: Int
    
    init( imageName: String, choiceOne: String, choiceTwo: String, choiceThree: String,
          choiceFour: String, answer: Int) {
        self.imageName = imageName
        self.choiceOne = choiceOne
        self.choiceTwo = choiceTwo
        self.choiceThree = choiceThree
        self.choiceFour = choiceFour
        self.answer = answer
    }
}
