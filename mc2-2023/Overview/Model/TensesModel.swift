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




