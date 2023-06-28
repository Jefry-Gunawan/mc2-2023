//
//  SummaryView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 28/06/23.
//

import SwiftUI

struct SummaryView: View {
    
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
    
    let options = ["AAA", "BBB", "CCC", "DDD"]
    @State var answer = false
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Summary")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            GeometryReader { geometry in
                ScrollView(.vertical){
                    ForEach(quizList.indices, id: \.self) { index in
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(20)
                            .frame(width: geometry.size.width, height: 400)
                            .padding(.bottom, 20)
//                            .shadow(radius: 5, x: 0, y: 6)
                            .overlay(alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("\(index+1) / \(quizList.count)")
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .padding(.bottom, 10)
                                    Text(quizList[index].question)
                                        .font(.headline)
                                        .padding(.bottom, 20)
                                    LazyVGrid(columns: layout, spacing: 10) {
                                        ForEach(quizList[index].answerOptions.indices) { idx in
                                            Rectangle()
                                                .fill((quizList[index].correctAnswer == quizList[index].answerOptions[idx]) ? Color.green :
                                                        (userAnswer[index].answer == quizList[index].answerOptions[idx] ? Color.red : Color("Light Blue")))
                                                .cornerRadius(10)
                                                .frame(width: 100, height: 50)
                                               // .shadow(color: (index == 0 && answer == false) ? .red : (index == 0 && answer == true) ? .green : .black.opacity(0.3), radius: 2, x: 0, y: 1)
                                                .overlay(alignment: .center) {
                                                    Text("\(quizList[index].answerOptions[idx])")
                                                }
                                                .padding(.bottom, 20)
                                        }
                                    }
                                    Text("The answer is AAA because Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc erat neque, feugiat nec ligula eu, tempor suscipit lectus.")
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 20)
                            }
                    }
                    
                    //BUTTON CLOSE
                    Button(action: {}) {
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
        }
        .padding(.horizontal, 20)
        .background(Color("Pale Blue"))
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}



/*
 
 var body: some View {
     VStack(alignment: .leading){
         Text("Summary")
             .font(.largeTitle)
             .fontWeight(.bold)
         
         GeometryReader { geometry in
             ScrollView(.vertical){
                 ForEach(0..<10) { index in
                     Rectangle()
                         .fill(.white)
                         .cornerRadius(20)
                         .frame(width: geometry.size.width, height: 400)
                         .padding(.bottom, 20)
                         .shadow(radius: 5, x: 0, y: 6)
                         .overlay(alignment: .top){
                             VStack(alignment: .leading) {
                                 Text("\(index+1)/10")
                                     .fontWeight(.bold)
                                     .font(.title2)
                                     .padding(.bottom, 10)
                                 Text("This is the first question This is the first question This is the first question")
                                     .font(.headline)
                                     .padding(.bottom, 20)
                                 LazyVGrid(columns: layout, spacing: 10) {
                                     ForEach(0..<options.count) { index in
                                         Rectangle()
                                             .fill((index == 0 && answer == false) ? Color.red : (index == 0 && answer == true) ? Color.green : Color("Light Blue"))
                                             .cornerRadius(10)
                                             .frame(width: 100, height: 50)
                                            // .shadow(color: (index == 0 && answer == false) ? .red : (index == 0 && answer == true) ? .green : .black.opacity(0.3), radius: 2, x: 0, y: 1)
                                             .overlay(alignment: .center) {
                                                 Text("\(options[index])")
                                             }
                                             .padding(.bottom, 20)
                                     }
                                 }
                                 Text("The answer is AAA because Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc erat neque, feugiat nec ligula eu, tempor suscipit lectus.")
                                 
                             }
                             .padding(.horizontal, 20)
                             .padding(.vertical, 20)
                         }
                 }
                 
                 //BUTTON CLOSE
                 Button(action: {}) {
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
     }
     .padding(.horizontal, 20)
     .background(Color("Pale Blue"))
 }
 
 */
