//
//  SummaryView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 28/06/23.
//

import SwiftUI

struct SummaryView: View {
    var topicId: Int
    var chapterId: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showScoreModal = true
    
    struct Answers: Identifiable {
        var id: UUID = .init()
        var answer: String
    }
    
    struct Quiz: Identifiable {
        var id: UUID = .init()
        var question: String
        var answerOptions: [String]
        var correctAnswer: String
    }
    
    let quizList: [Quiz] = [
        .init(question: "What is the name of Ducker's friend?", answerOptions: ["Ducker", "Duckster", "Mother Ducker", "Duck you!"] , correctAnswer: "Duckster"),
        .init(question: "What was duckster doing?", answerOptions: ["Smoking", "Eating", "Studying", "Sleeping"], correctAnswer: "Eating"),
        .init(question: "1 + 1 = brapa yaa", answerOptions: ["Jendela", "Duah", "Sebelas bang", "satu"], correctAnswer: "Duah"),
        .init(question: "What's on the menu today?", answerOptions: ["Me N U", "Makanan", "Minuman", "Kosong"], correctAnswer: "Me N U"),
        .init(question: "Siapa nama mentor kita?????", answerOptions: ["Yus", "Yulibar", "Kak Yus", "Semua benar"], correctAnswer: "Semua benar")
    ]
    
    let userAnswer: [Answers] = [
        .init(answer: "Duck you!"),
        .init(answer: "Eating"),
        .init(answer: "Sebelas bang"),
        .init(answer: "Makanan"),
        .init(answer: "Semua benar")
    ]
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        if showScoreModal {
            ScoreView(showScoreModal: $showScoreModal, topicId: topicId, chapterId: chapterId)
        } else {
            VStack(alignment: .leading){
                Text("Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ScrollView(.vertical){
                    ForEach(quizList.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text("\(index+1) / \(quizList.count)")
                                .fontWeight(.bold)
                                .font(.title2)
                                .padding(.bottom, 10)
                            Text(quizList[index].question)
                            //                                        .font(.headline)
                                .font(.title2)
                                .padding(.bottom, 20)
                            LazyVGrid(columns: layout, spacing: 10) {
                                ForEach(quizList[index].answerOptions.indices) { idx in
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 100, height: 50)
                                        .overlay(alignment: .center) {
                                            HStack {
                                                Spacer()
                                                Text(quizList[index].answerOptions[idx])
                                                Spacer()
                                            }
                                            .frame(width: 130, height: 50)
                                            .padding(12)
                                            .background(Color("Light Blue"))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke((quizList[index].correctAnswer == quizList[index].answerOptions[idx]) ? Color.green :
                                                                (userAnswer[index].answer == quizList[index].answerOptions[idx] ? Color.red : Color("Light Blue")), lineWidth: 7)
                                            }
                                            .cornerRadius(10)
                                        }
                                        .padding(.bottom, 20)
                                }
                            }
                            VStack {
                                Text("The answer is AAA because Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc erat neque, feugiat nec ligula eu, tempor suscipit lectus.")
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.bottom,5)
                        
                    }
                    
                    //BUTTON CLOSE
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("CLOSE")
                            .frame(width: 360, height: 40)
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Dark Blue"))

                    }
                    .frame(width: 340, height: 50)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)
            .background(Color("Pale Blue"))
            .navigationBarHidden(true)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(topicId: 1, chapterId: 1)
    }
}
