//
//  QuizView.swift
//  mc2-2023
//
//  Created by Rania Ori Sumargo on 27/06/23.
//

import SwiftUI

struct QuizView: View {
    @State private var currentIndex: Int = 0
    
    @State private var doneAnswering = false
    @State private var selectedAnswer = ""
    @State private var isLastQuestion = false
    
    @Binding var showQuizModal: Bool

//    struct Quiz: Identifiable {
//        var id: UUID = .init()
//        var question: String
//        var answerOptions: [String]
//        var correctAnswer: String
//    }
//
//
//    let quizList: [Quiz] = [
//        .init(question: "What is the name of Ducker's friend?", answerOptions: ["Ducker", "Duckster", "Mother Ducker", "Duck you!"] , correctAnswer: "Duckster"),
//        .init(question: "What was duckster doing?", answerOptions: ["Smoking", "Eating", "Studying", "Sleeping"], correctAnswer: "Eating"),
//        .init(question: "1 + 1 = brapa yaa", answerOptions: ["Jendela", "Duah", "Sebelas bang", "satu"], correctAnswer: "Duah"),
//        .init(question: "What's on the menu today?", answerOptions: ["Me N U", "Makanan", "Minuman", "Kosong"], correctAnswer: "Me N U"),
//        .init(question: "Siapa nama mentor kita?????", answerOptions: ["Yus", "Yulibar", "Kak Yus", "Semua benar"], correctAnswer: "Semua benar")
//    ]
    
    var quizList: [Quiz] = {
        var quizs: [Quiz] = []
        
        if let topicId = topicID,
           let chapterId = chapterID {
            
            let filtered1 = quizDf.filter(on: "topic_id", Int.self, {$0 == topicId})
            let filtered2 = filtered1.filter(on: "chapter_id", Int.self, {$0 == chapterId})
            
            for row in filtered2.rows {
                if let question = row["question"] as? String,
                   let answer = row["answer"] as? String,
                   let options = row["options"] as? String,
                   let explanation = row["explanation"] as? String,
                   let topicId = row["topic_id"] as? Int,
                   let chapterId = row["chapter_id"] as? Int {
                    
                    var answerOptions = options.components(separatedBy: "\\")
                    answerOptions = answerOptions.filter({$0 != ""})
                    
                    let quiz = Quiz(question: question, correctAnswer: answer, answerOptions: answerOptions, explanation: explanation, topicId: topicId, chapterId: chapterId)
                    
                    quizs.append(quiz)
                }
            }
        }
        
        return quizs
    }()

    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                ForEach(quizList.indices, id: \.self) { index in
                    if currentIndex == index {
                        QuestionView(quizList[currentIndex], geometry.size.width)

                    }
                    
                }
               
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 50)
        .background(Color("Pale Blue"))

    }
    
    func CheckAnswer(questionNumber: Int, userAnswer: String) -> String {
        let correctAnswer = quizList[questionNumber-1].correctAnswer
        if correctAnswer.elementsEqual(userAnswer) {
            return "green"
        }
        else {
            return "red"
        }
    }
    
    @ViewBuilder
    func QuestionView(_ question: Quiz, _ size: CGFloat) -> some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        Rectangle()
            .fill(.white)
            .cornerRadius(10)
            .overlay(alignment: .topLeading){
                HStack {
                    
                    Text("\(currentIndex+1) / \(quizList.count)")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.bottom, 10)
                    Spacer()
                }
                .frame(width: 100)
                .padding(.top, 25)
                .padding(.leading, 20)
            }
            .overlay(alignment: .topLeading) {
                VStack {
                    HStack {
                        Text("Question \(currentIndex + 1)")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(quizList[currentIndex].question)
                                .font(.title2)
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .frame(width: size, height: 130)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(quizList[currentIndex].answerOptions, id: \.self) { item in
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 100, height: 50)
                                .overlay(alignment: .center) {
                                    HStack {
                                        Spacer()
                                        Text(item)
                                        Spacer()
                                    }
                                    .frame(width: 130, height: 50)
                                    .padding(12)
                                    .background(Color("Light Blue"))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedAnswer == item ? Color("Dark Blue") : Color("Light Blue"), lineWidth: 7)
                                    }
                                    .cornerRadius(10)
                                }
                                .onTapGesture {
                                    selectedAnswer = item
                                }
                                .padding(.bottom, 20)
                        }
                    }
                    .padding()
                    Spacer()
//                    NavigationLink("", destination: ScoreView(), isActive: $isLastQuestion)
//                        .navigationBarHidden(true)
                    Button {
                        // cek apakah user sudah memilih jawaban
                        if (selectedAnswer != "") {
                            // cek benar atau salah sblm next question
                            if (selectedAnswer == quizList[currentIndex].correctAnswer) {
                                print("benar")
                            }
                            else {
                                print("salah")
                            }
                            
                            if currentIndex == 4 {
                                isLastQuestion = true
                                self.showQuizModal.toggle()
                                print(showQuizModal)
                            }
                            else {
                                currentIndex += 1
                            }
                            
                            selectedAnswer = ""
                        }
                        else {
                            
                        }
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("NEXT QUESTION")
                                .frame(height: 40)
                                .font(.body)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(12)
                        .background(Color("Dark Blue"))
                        .cornerRadius(10)
                    }
                    .padding()
                }
                .padding(.top, 40)
            }
            .navigationBarHidden(true)
    }
}

//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView()
//    }
//}

