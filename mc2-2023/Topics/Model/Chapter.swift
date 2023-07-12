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



