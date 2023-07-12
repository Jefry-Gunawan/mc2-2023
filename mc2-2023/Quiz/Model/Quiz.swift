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

var quizList: [Quiz] = { 
    var quizs: [Quiz] = []
    
    if let topicId = topicID,
       let chapterId = chapterID {
        
        let filtered1 = quizDf.filter(on: "topic_id", Int.self, {$0 == topicId})
        let filtered2 = filtered1.filter(on: "chapter_id", Int.self, {$0 == chapterId})
        
        for row in filtered2.rows {
            if let question = row["question"] as? String,
               let answer = row["answer"] as? String,
               let options = row["options"] as? String,
               let explanation = row["explanation"] as? String,
               let topicId = row["topic_id"] as? Int,
               let chapterId = row["chapter_id"] as? Int {
                
                let answerOptions = options.components(separatedBy: "\\")
                
                let quiz = Quiz(question: question, correctAnswer: answer, answerOptions: answerOptions, explanation: explanation, topicId: topicId, chapterId: chapterId)
                
                quizs.append(quiz)
            }
        }
    }
    
    return quizs
}()
