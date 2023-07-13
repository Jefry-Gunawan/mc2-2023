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
    var tensesId: Int
    var topicId: Int
    var vocabId: String
    var tensesName: String
}

let chapterData = ChapterData()

var chapterDf: DataFrame {
    chapterData.df
}

//var chapterList: [Chapter] = {
//    var chapters: [Chapter] = []
//    
//    if let topicId = topicID,
//       let chapterId = chapterID {
//        
//        let filtered1 = chapterDf.filter(on: "topic_id", Int.self, {$0 == topicId})
//        let filtered2 = filtered1.filter(on: "id", Int.self, {$0 == chapterId})
//        
//        for row in filtered2.rows {
//            if let name = row["name"] as? String,
//               let description = row["description"] as? String,
//               let tensesId = row["tenses_id"] as? Int,
//               let topicId = row["topic_id"] as? Int,
//               let vocabId = row["vocab_id"] as? String {
//                
//                let tensesfilter = tensesDf.filter(on: "id", Int.self, {$0 == tensesId})
//                
//                for tensesrow in tensesfilter.rows{
//                    if let tensesname = tensesrow["name"] as? String{
//                        let chapter = Chapter(name: name, description: description, tensesId: tensesId, topicId: topicId, vocabId: vocabId, tensesName: tensesname)
//                        chapters.append(chapter)
//                    }
//                }
//            }
//        }
//    }
//    return chapters
//}()

