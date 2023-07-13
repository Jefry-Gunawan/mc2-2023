//
//  NewVocabView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 08/07/23.
//

import SwiftUI

struct NewVocabView: View {
    
    func exampleText(vocabulary: Vocab) -> some View{
        var output = Text("")
        
        let exampleWords = vocabulary.example.split(separator: " ")
        
        for word in exampleWords {
            let temp = Text(String(word) + " ")
                .foregroundColor(isHighlighted(word: word, vocabulary: vocabulary) ? .red : .black)
            
            output = output + temp
        }
        
        return output
    }
    
    func isHighlighted(word: Substring, vocabulary: Vocab) -> Bool {
        let highlightedWords = ["all", "aboard", "blood", "pressure."]
        let lowercasedWord = word.lowercased()
        
        return lowercasedWord.localizedCaseInsensitiveContains(vocabulary.name) ||
        highlightedWords.contains(lowercasedWord)
    }
    
    var body: some View {

    
        var vocabList: [Vocab] = {
            var vocabularies: [Vocab] = []

            if let topicId = topicID,
               let chapterId = chapterID {


                for row in vocabDf.rows {
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

        
        
        VStack(alignment: .leading) {
            ForEach(vocabList.indices, id: \.self) { index in
                let vocabulary = vocabList[index]
                HStack{
                    Text("\(index + 1). \(vocabulary.name)")
                        .fontWeight(.bold)
                        .font(.title3)
                    Text("(\(vocabulary.translation))")
                        .font(.body)
                        .fontWeight(.medium)
                }
                HStack{
                    Text(vocabulary.phonetic)
                        .padding(.leading, 15)
                    Text("  \(vocabulary.pos)")
                        .italic()
                }
                Text("\(vocabulary.definition)")
                    .padding(.leading, 15)
                    .padding(.bottom, 5)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .environment(\.sizeCategory, .large)
                Text("Example:")
                    .padding(.leading, 15)
                    .fontWeight(.bold)
                
                exampleText(vocabulary: vocabulary)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .environment(\.sizeCategory, .large)
                
                    .padding(.leading, 15)
                
                    .padding(.bottom, 20)
            }
        }
        .padding(.horizontal, 10)
    }
    
    
    
}

struct NewVocabView_Previews: PreviewProvider {
    static var previews: some View {
        NewVocabView()
    }
}
