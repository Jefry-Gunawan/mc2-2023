//
//  NewVocabView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 08/07/23.
//

import SwiftUI

struct VocabList : Identifiable {
    let id = UUID()
    let name: String
    let phonetic: String
    let pos: String
    let example1: String
    let example2: String
}

struct NewVocabView: View {
    
    let vocabularies: [VocabList] = [
        VocabList(
            name: "Exercise",
            phonetic: "| ˈeksərˌsīz |",
            pos: "noun",
            example1: "He exercises later.",
            example2: "Annie does exercise."
        ),
        VocabList(
            name: "Sleep",
            phonetic: "| slēp |",
            pos: "noun, verb",
            example1: "She sleeps in a bed.",
            example2: "Aliquam blandit ante."
        ),
        VocabList(
            name: "Drink",
            phonetic: "| driNGk |",
            pos: "noun, verb",
            example1: "Lorem ipsum dolor sit amet.",
            example2: "Aliquam blandit ante."
        )
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ForEach(Array(vocabularies.enumerated()), id: \.element.id) { (index, vocabulary) in
                Text("\(index + 1). \(vocabulary.name)")
                    .fontWeight(.bold)
                    .font(.title3)
                HStack{
                    Text(vocabulary.phonetic)
                    Text("  \(vocabulary.pos)")
                        .italic()
                }
                Text("Example:")
                    .fontWeight(.bold)
                Text(vocabulary.example1)
                    .fontWeight(.semibold)
                    .foregroundColor(vocabulary.name.localizedCaseInsensitiveContains("\(vocabulary.name)") ? .red : .black)
                Text(vocabulary.example2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
            }
        }
        .padding(.leading, -45)
    }
}

struct NewVocabView_Previews: PreviewProvider {
    static var previews: some View {
        NewVocabView()
    }
}
