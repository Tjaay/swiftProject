//
//  MathQuizQuestions.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-03.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//

import UIKit

class MathQuizQuestions {
  var mathQuestions = [MathQuestion]()
  
  init() {
    mathQuestions.append(MathQuestion(question: "What is 5 + 5?", choiceOne: "10", choiceTwo: "25", choiceThree: "55", choiceFour: "11", answer: 1))
    
    mathQuestions.append(MathQuestion(question: "What is 4 + 3?", choiceOne: "1", choiceTwo: "6", choiceThree: "7", choiceFour: "43", answer: 3))
    
    mathQuestions.append(MathQuestion(question: "What is 8 + 9?", choiceOne: "16", choiceTwo: "17", choiceThree: "89", choiceFour: "33", answer: 2))
    
    mathQuestions.append(MathQuestion(question: "What is 15 + 15?", choiceOne: "25", choiceTwo: "1515", choiceThree: "30", choiceFour: "77", answer: 3))
    
    mathQuestions.append(MathQuestion(question: "What is 25 + 15", choiceOne: "33", choiceTwo: "5", choiceThree: "25", choiceFour: "50", answer: 4))
    
    mathQuestions.append(MathQuestion(question: "What is 10 - 9?", choiceOne: "1", choiceTwo: "61", choiceThree: "19", choiceFour: "8", answer: 1))
    
    mathQuestions.append(MathQuestion(question: "What is 25 - 15?", choiceOne: "25", choiceTwo: "10", choiceThree: "99", choiceFour: "20", answer: 2))
    
    mathQuestions.append(MathQuestion(question: "What is 33 - 17?", choiceOne: "16", choiceTwo: "22", choiceThree: "39", choiceFour: "19", answer: 1))
    
    mathQuestions.append(MathQuestion(question: "What is 66 - 42", choiceOne: "92", choiceTwo: "19", choiceThree: "22", choiceFour: "33", answer: 3))
    
    mathQuestions.append(MathQuestion(question: "What is 18 - 16?", choiceOne: "10", choiceTwo: "11", choiceThree: "55", choiceFour: "2", answer: 4))
    
    mathQuestions.append(MathQuestion(question: "What is 6 * 6?", choiceOne: "22", choiceTwo: "66", choiceThree: "36", choiceFour: "4", answer: 3))
    
    mathQuestions.append(MathQuestion(question: "What is 5 * 5?", choiceOne: "25", choiceTwo: "44", choiceThree: "10", choiceFour: "15", answer: 1))
    
    mathQuestions.append(MathQuestion(question: "What is 9 * 9?", choiceOne: "18", choiceTwo: "81", choiceThree: "99", choiceFour: "7", answer: 2))
    
    mathQuestions.append(MathQuestion(question: "What is 12 * 12?", choiceOne: "144", choiceTwo: "121", choiceThree: "24", choiceFour: "1212", answer: 1))
    
    mathQuestions.append(MathQuestion(question: "What is 3 * 3?", choiceOne: "6", choiceTwo: "33", choiceThree: "4", choiceFour: "9", answer: 4))
    
    mathQuestions.append(MathQuestion(question: "What is 82 / 2?", choiceOne: "34", choiceTwo: "22", choiceThree: "44", choiceFour: "8", answer: 3))
    
    mathQuestions.append(MathQuestion(question: "What is 48 / 4?", choiceOne: "14", choiceTwo: "44", choiceThree: "12", choiceFour: "99", answer: 3))
    
    mathQuestions.append(MathQuestion(question: "What is 77 / 11?", choiceOne: "7", choiceTwo: "85", choiceThree: "5", choiceFour: "1", answer: 1))
    
    mathQuestions.append(MathQuestion(question: "What is 63 / 3?", choiceOne: "10", choiceTwo: "21", choiceThree: "55", choiceFour: "49", answer: 2))
    
    mathQuestions.append(MathQuestion(question: "What is 84 / 6?", choiceOne: "88", choiceTwo: "18", choiceThree: "23", choiceFour: "14", answer: 4))
  }
  
}
