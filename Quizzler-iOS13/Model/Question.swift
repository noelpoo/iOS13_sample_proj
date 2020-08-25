//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Noel Poo on 21/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var answer: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
