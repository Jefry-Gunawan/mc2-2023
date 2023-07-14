//
//  OverviewViewTenses.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 26/06/23.
//

import SwiftUI

struct OverviewViewTenses: View {
    
    var tensesId: Int
    
    var body: some View {
        
        var tensesList: [Tenses] = {
            var tenses: [Tenses] = []
            let tenseId = tensesId
            
            for row in tensesDf.rows {
                if let id = row["id"] as? Int,
                   let name = row["name"] as? String,
                   let positive = row["positive"] as? String,
                   let negative = row["negative"] as? String,
                   let question = row["question"] as? String,
                   let usage = row["usage"] as? String,
                   let specialCharacters = row["special_characters"] as? String {
                    
                    if tenseId == id {
                        let tense = Tenses(name: name, positive: positive, negative: negative, question: question, usage: usage, specialCharacters: specialCharacters)
                        tenses.append(tense)
                    }
                }
            }
            
            return tenses
        }()
        if let tenses = tensesList.first {
            VStack(alignment: .leading){
                ScrollView(.vertical){
                    VStack(alignment: .leading) {
                        
                        Group {
                            Text("\(tenses.name)")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding(.top, 20)
                            Text("Sentence Structure")
                                .fontWeight(.bold)
                                .font(.title2)
                                .padding(.top, 20)
                        }
                        
                        StructureView(tensesId: tensesId)
                        
                        
                        //MARK: Usage
                        VStack(alignment: .leading) {
                            Text("Usage")
                                .fontWeight(.bold)
                                .font(.title2)
                                .padding(.top, 30)
                                .padding(.bottom, 5)
                            // .padding(.leading, 30)
                            
                            UsageView(tensesId: tensesId)
                                .padding(.bottom, 20)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.bottom,5)
                }
            }
            .padding(.horizontal, 10)
            .background(Color("Pale Blue"))
        }
    }
}

struct OverviewViewTenses_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OverviewViewTenses(tensesId: 2)
        }
    }
}
