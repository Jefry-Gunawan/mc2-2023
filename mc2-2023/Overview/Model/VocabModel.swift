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
    var name: String
    var definition: String
    var phonetic: String
    var example: String
    var translation: String
    var pos: String
    var topicId: Int
    var chapterId: Int
}



let vocabData = VocabularyData()

var vocabDf: DataFrame {
    vocabData.df
}
var vocabList: [Vocab] = {
    var vocabularies: [Vocab] = []
    
    for row in vocabDf.rows {
        if let name = row["name"] as? String,
           let definition = row["definition"] as? String,
           let phonetic = row["phonetic"] as? String,
           let example = row["example"] as? String,
           let translation = row["translation"] as? String,
           let pos = row["pos"] as? String {
            
            let vocab = Vocab(name: name, definition: definition, phonetic: phonetic, example: example, translation: translation, pos: pos)
            vocabularies.append(vocab)
        }
    }
    
    return vocabularies
}()

