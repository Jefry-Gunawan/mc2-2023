//
//  QuizView.swift
//  mc2-2023
//
//  Created by Rania Ori Sumargo on 27/06/23.
//

import SwiftUI

struct QuizView: View {
    var number: Int
    
    @State private var currentIndex: Int = 0
    
    @State private var doneAnswering = false
    @State private var color_1 = "black"
    @State private var color_2 = "black"
    @State private var color_3 = "black"
    @State private var color_4 = "black"
    
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
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    ForEach(quizList.indices, id: \.self) { index in
                        if currentIndex == index {
                            QuestionView(quizList[currentIndex], geometry.size.width)
//                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                        
                    }
                   
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 50)
            .background(Color("Pale Blue"))
        }
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
            .overlay(alignment: .topTrailing){
                HStack {
                    Spacer()
                    Text("\(currentIndex + 1) / \(quizList.count)")
                        .font(.system(size: 25))
                }
                .frame(width: 100)
                .padding(.top, 25)
                .padding(.trailing, 30)
            }
            .overlay(alignment: .topLeading) {
                VStack {
                    HStack {
                        Text("Question \(currentIndex + 1)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
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
                            Button {
                                
                                //cek bener atau salah
                                if (item == quizList[currentIndex].correctAnswer) {
                                    print("bener")
                                }
                                else {
                                    print("salah")
                                }
                                if currentIndex == 4 {
                                    currentIndex = 0
                                }
                                else {
                                    currentIndex += 1
                                }
                                
                            } label: {
                                HStack {
                                    Spacer()
                                    Text(item)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(12)
                                .background(Color("Light Blue"))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
                .padding(.top, 40)
            }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(number: 3)
    }
}

