//
//  Transcript.swift
//  mc2-2023
//
//  Created by Nattfeb on 12/07/23.
//

import SwiftUI
import TabularData

//Model : Transcript

struct Transcript: Identifiable{
    var id: UUID = .init()
    var transcriptId: Int
    var name: String
    var convo: String
    var chapterId: Int
    var topicId: Int
    var toolTip: String
    var chapterName: String
}

let transcriptData = TranscriptData()

var transcriptDf: DataFrame {
    transcriptData.df
}

//var transcriptList: [Transcript] = {
//    var transcripts: [Transcript] = []
//
//
//    if let topicId = topicID,
//       let chapterId = chapterID {
//
//        let filtered1 = transcriptDf.filter(on: "topic_id", Int.self, {$0 == topicId})
//        let filtered2 = filtered1.filter(on: "id", Int.self, {$0 == chapterId})
//
//        for row in filtered2.rows {
//            if let transcriptId = row["id"] as? Int,
//               let name = row["name"] as? String,
//               let conversation = row["conversation"] as? String,
//               let chapterId = row["chapter_id"] as? Int,
//               let topicId = row["topic_id"] as? Int,
//               let tooltip = row["tooltip"] as? String {
//
//                let transcript = Transcript(transcriptId: transcriptId, name: name, conversation: conversation, chapterId: chapterId, topicId: topicId, tooltip: tooltip)
//                transcripts.append(transcript)
//
//            }
//        }
//    }
//    return transcripts
//}()

