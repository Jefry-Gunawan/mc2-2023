//
//  VocabModel.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 11/07/23.
//

import SwiftUI
import TabularData




struct Vocab: Identifiable{
    var id: UUID = .init()
    //var vocabId: String
    var name: String
    var definition: String
    var phonetic: String
    var example: String
    var translation: String
    var pos: String
}


let vocabData = VocabularyData()

var vocabDf: DataFrame {
    vocabData.df
}

var vocabList: [Vocab] = {
    var vocabularies: [Vocab] = []

    if let topicId = topicID,
       let chapterId = chapterID {
        
        
        let filtered = vocabDf.filter { row in
            if let vocabId = row["id"] as? Int {
                let vocabIds = chapterList.flatMap { $0.vocabId.split(separator: "\\").map(String.init) }
                return vocabIds.contains(String(vocabId))
            }
            return false
        }



        for row in filtered.rows {
            if let name = row["name"] as? String,
               let definition = row["definition"] as? String,
               let phonetic = row["phonetic"] as? String,
               let example = row["example"] as? String,
               let translation = row["translation"] as? String,
               let pos = row["pos"] as? String {

                let vocab = Vocab( name: name, definition: definition, phonetic: phonetic, example: example, translation: translation, pos: pos)
                vocabularies.append(vocab)
            }
            //  }
            //}
        }
    }
    return vocabularies
}()

//var vocabList: [Vocab] = {
//    var vocabularies: [Vocab] = []
//
//    if let topicId = topicID,
//       let chapterId = chapterID {
//
//        let currentChapter = chapterList.first(where: { $0.id == chapterId })
//        if let vocabId = currentChapter?.vocabId {
//            let vocabIds = vocabId.split(separator: "\\")
//
//            for id in vocabIds {
//                let filteredVocab = vocabDf.filter(on: "id", String.self, { ($0 as? String) == id })
//                for row in filteredVocab.rows {
//                    if let name = row["name"] as? String,
//                       let definition = row["definition"] as? String,
//                       let phonetic = row["phonetic"] as? String,
//                       let example = row["example"] as? String,
//                       let translation = row["translation"] as? String,
//                       let pos = row["pos"] as? String {
//                        let vocab = Vocab(name: name, definition: definition, phonetic: phonetic, example: example, translation: translation, pos: pos)
//                        vocabularies.append(vocab)
//                    }
//                }
//            }
//        }
//    }
//
//    return vocabularies
//}()






