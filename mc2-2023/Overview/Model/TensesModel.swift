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

var tensesList: [Tenses] = {
    var tenses: [Tenses] = []
    
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
    
    return tenses
}()
