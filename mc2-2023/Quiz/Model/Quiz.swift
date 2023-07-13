//
//  Quiz.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 11/07/23.
//

import Foundation
import TabularData

struct Quiz: Identifiable {
    var id: UUID = .init()
    var question: String
    var correctAnswer: String
    var answerOptions: [String]
    var explanation: String
    var topicId: Int
    var chapterId: Int
}

let quizData = QuizData()

var quizDf: DataFrame {
    quizData.df
}
