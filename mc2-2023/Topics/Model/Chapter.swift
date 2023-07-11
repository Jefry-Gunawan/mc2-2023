//
//  Chapter.swift
//  mc2-2023
//
//  Created by Nattfeb on 11/07/23.
//

import SwiftUI
import TabularData

//Model : Chapter

struct Chapter: Identifiable{
    var id: UUID = .init()
    var name: String
    var description: String
    var score: Int
    var tensesId: Int
    var topicId: Int
    var vocabId: Int
}

let chapterData = ChapterData()

var chapterDf: DataFrame {
    chapterData.df
}

var chapterList: [Chapter] = {
    var chapters: [Chapter] = []
    
    for row in chapterDf.rows {
        if let name = row["name"] as? String,
           let description = row["description"] as? String,
           let score = row["score"] as? Int,
           let tensesId = row["tenses_id"] as? Int,
           let topicId = row["topic_id"] as? Int,
           let vocabId = row["vocab_id"] as? Int {
            
            let chapter = Chapter(name: name, description: description, score: score, tensesId: tensesId, topicId: topicId, vocabId: vocabId)
            chapters.append(chapter)
        }
    }
    
    return chapters
}()

