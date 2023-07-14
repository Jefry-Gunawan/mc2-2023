//
//  UsageView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 08/07/23.
//

import SwiftUI

struct UsageView: View {
    var tensesId: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            let tensesList: [Tenses] = {
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
            
            let tenses = tensesList.first
            
            if let tenses = tenses {
                let eachUsage = tenses.usage.split(separator: ">>")
                ForEach(eachUsage.indices, id: \.self) { index in
                    let usageComponents = eachUsage[index].split(separator: "~~")
                        let usageTitle = String(usageComponents[0])
                        let usageExamples = String(usageComponents[1]).split(separator: "\\")
                        
                        Text(usageTitle)
                            .fontWeight(.bold)
                            .font(.title3)
                        
                        Text("    Example:")
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading) {
                            ForEach(usageExamples.indices, id: \.self) { exampleIndex in
                                Text(String(usageExamples[exampleIndex]))
                                    .fontWeight(.semibold)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.bottom, 5)
                }
            }
        }
        .padding(.leading, 20)
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        UsageView(tensesId: 2)
    }
}
