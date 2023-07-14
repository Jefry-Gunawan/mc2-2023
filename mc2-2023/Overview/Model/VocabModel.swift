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
}


let vocabData = VocabularyData()

var vocabDf: DataFrame {
    vocabData.df
}





