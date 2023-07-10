//
//  SpeakingTextVariable.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 04/07/23.
//

import Foundation
import SwiftUI

class SpeakingTextVariable: Identifiable {
    var id: String = UUID().uuidString
    @Published var text: String
    @Published var color: Color = Color.black
    
    init(text: String) {
        self.text = text
    }
}

//class SpeakingTextViewModel: ObservableObject {
//    @Published var textArray: [SpeakingTextVariable] = []
//    
//    static func checkAnswer(transcript: String) {
//        let tempTranscript = transcript.lowercased().components(separatedBy: " ")
//        print(tempTranscript)
//        
//        for var word in textArray {
//            if tempTranscript.contains(word.text.lowercased()) {
//                word.color = .green
//            } else {
//                word.color = .red
//            }
//        }
//    }
//    
//    static func changeSentenceToVariable(sentence: String) {
//        let words = sentence.components(separatedBy: " ")
//        
//        for word in words {
//            textArray.append(SpeakingTextVariable(text: word))
//        }
//    }
//}
