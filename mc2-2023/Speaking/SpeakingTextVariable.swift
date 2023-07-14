//
//  SpeakingTextVariable.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 04/07/23.
//

import Foundation
import SwiftUI

struct SpeakingTextVariable: Identifiable {
    var id: String = UUID().uuidString
    var text: String
    var color: Color = Color.black
}

var speakingVariable1: [SpeakingTextVariable] {
    var out: [SpeakingTextVariable] = []
    let text = "I am pleased to tell you that neither your ankle nor your elbow is broken"
    let tempTranscript = text.components(separatedBy: " ")
    
    for i in tempTranscript {
        let tempVar = SpeakingTextVariable(text: i)
        out.append(tempVar)
    }
    
    return out
}

//var speakingVariable2: [SpeakingTextVariable] {
//    var out: [SpeakingTextVariable] = []
//    let text = "My name is Jehn"
//    let tempTranscript = text.components(separatedBy: " ")
//
//    for i in tempTranscript {
//        let tempVar = SpeakingTextVariable(text: i)
//        out.append(tempVar)
//    }
//
//    return out
//}
//
//var speakingVariable3: [SpeakingTextVariable] {
//    var out: [SpeakingTextVariable] = []
//    let text = "My name is Jihn"
//    let tempTranscript = text.lowercased().components(separatedBy: " ")
//
//    for i in tempTranscript {
//        let tempVar = SpeakingTextVariable(text: i)
//        out.append(tempVar)
//    }
//
//    return out
//}

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
