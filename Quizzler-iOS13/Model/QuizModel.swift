//
//  QuizModel.swift
//  Quizzler-iOS13
//
//  Created by Noel Poo on 24/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


struct QuizModel {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    var questionNum: Int = 0
    var score: Int = 0
    var progress: Float = 0.0
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNum].correctAnswer{
            return true
        } else {
            return false
        }
    }
    
    func getProgress() -> Float {
        let progressPerc = Float(questionNum + 1) / Float(quiz.count)
        return progressPerc
    }
    
    func getQuestionText() -> String {
        let text = self.quiz[self.questionNum].question
        return text
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    func getCurrentAnswers(index: Int) -> String {
        return self.quiz[self.questionNum].answer[index]
    }
    
    mutating func updateScore(correct: Bool) {
        if questionNum + 1 < quiz.count {
            if correct{
                self.score += 1
            } else {
                self.score += 0
            }
        } else {
            self.score = 0
        }
        print("score: \(self.score)")
    }
    
    // mutating func is for changing self.values within the struct itself, it is normally immutable within the struct
    mutating func nextQuestion() {
        if questionNum + 1 < quiz.count{
            self.questionNum += 1
        } else {
            self.questionNum = 0
        }
    }
    
}




