//
//  TensesModel.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 11/07/23.
//

import SwiftUI
import TabularData

struct Tenses: Identifiable{
    var id: UUID = .init()
    //var id: Int
    var name: String
    var positive: String
    var negative: String
    var question: String
    var usage: String
    var specialCharacters: String
}



let tensesData = TensesData()

var tensesDf: DataFrame {
    tensesData.df
}

var tensesList: [Tenses] = {
    var tenses: [Tenses] = []

    if let topicId = topicID,
       let chapterId = chapterID {

        //let tensesfiltered = tensesDf.filter(on: "id", Int.self, {$0 == chapter.tensesId})

        for row in tensesDf.rows {
            if let name = row["name"] as? String,
               let positive = row["positive"] as? String,
               let negative = row["negative"] as? String,
               let question = row["question"] as? String,
               let usage = row["usage"] as? String,
               let specialCharacters = row["special_characters"] as? String {

                let tense = Tenses(name: name, positive: positive, negative: negative, question: question, usage: usage, specialCharacters: specialCharacters)
                tenses.append(tense)
            }
        }
    }

    return tenses
}()


//var tensesList: [Tenses] = {
//    var tenses: [Tenses] = []
//
//    if let topicId = topicID,
//       let chapterId = chapterID {
//
//        let filteredChapter = chapterDf.filter(on: "topic_id", Int.self, { $0 == topicId })
//                                      .filter(on: "id", Int.self, { $0 == chapterId })
//
//        if let row = filteredChapter.rows.first,
//           let tensesId = row["tenses_id"] as? Int {
//
//            let filteredTenses = tensesDf.filter(on: "id", Int.self, { $0 == tensesId })
//
//            for row in filteredTenses.rows {
//                if let name = row["name"] as? String,
//                   let positive = row["positive"] as? String,
//                   let negative = row["negative"] as? String,
//                   let question = row["question"] as? String,
//                   let usage = row["usage"] as? String,
//                   let specialCharacters = row["special_characters"] as? String {
//
//                    let tense = Tenses(name: name, positive: positive, negative: negative, question: question, usage: usage, specialCharacters: specialCharacters)
//                    tenses.append(tense)
//                }
//            }
//        }
//    }
//
//    return tenses
//}()
