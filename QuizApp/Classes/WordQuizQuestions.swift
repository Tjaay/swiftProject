//
//  WordQuizQuestions.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-04.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit

class WordQuizQuestions {
    var wordQuestions = [WordQuestion]()
    
    init() {
        wordQuestions.append(WordQuestion(imageName: "dog", choiceOne: "cat", choiceTwo: "dog", choiceThree: "lizard", choiceFour: "bird", answer: 2))
        wordQuestions.append(WordQuestion(imageName: "cat", choiceOne: "dog", choiceTwo: "cheetah", choiceThree: "cat", choiceFour: "elephant", answer: 3))
        wordQuestions.append(WordQuestion(imageName: "car", choiceOne: "motorcycle", choiceTwo: "shoes", choiceThree: "shirt", choiceFour: "car", answer: 4))
        wordQuestions.append(WordQuestion(imageName: "clock", choiceOne: "clock", choiceTwo: "blanket", choiceThree: "printer", choiceFour: "television", answer: 1))
        wordQuestions.append(WordQuestion(imageName: "backpack", choiceOne: "lamp", choiceTwo: "backpack", choiceThree: "towel", choiceFour: "juice", answer: 2))
        wordQuestions.append(WordQuestion(imageName: "house", choiceOne: "car", choiceTwo: "house", choiceThree: "plug", choiceFour: "dumpster", answer: 2))
        wordQuestions.append(WordQuestion(imageName: "bike", choiceOne: "truck", choiceTwo: "drawer", choiceThree: "boot", choiceFour: "bike", answer: 4))
        wordQuestions.append(WordQuestion(imageName: "fan", choiceOne: "window", choiceTwo: "fan", choiceThree: "road", choiceFour: "pants", answer: 2))
        wordQuestions.append(WordQuestion(imageName: "phone", choiceOne: "cat", choiceTwo: "phone", choiceThree: "pencil", choiceFour: "bird", answer: 2))
        wordQuestions.append(WordQuestion(imageName: "book", choiceOne: "dvd", choiceTwo: "box", choiceThree: "book", choiceFour: "envelope", answer: 3))
    }
}
