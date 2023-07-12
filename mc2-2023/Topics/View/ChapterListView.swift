//
//  ChapterListView.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 22/06/23.
//

import SwiftUI

struct ChapterListView: View {
    var topicId: Int
    var topicName: String
    
    let chapterStatusList = ["done", "progress", "locked", "locked", "locked"]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(1...5, id: \.self) { i in
                    
                    switch chapterStatusList[i - 1] {
                    case "done":
                        NavigationLink(destination: ChapterView(), label: {
                            ZStack {
                                Text("")
                                    .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.width * 0.22)
                                    .foregroundColor(Color.white)
                                    .background(Color("Green"))
                                    .clipShape(Circle())
                                Text("\(i)")
                                    .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
                                    .foregroundColor(Color.black)
                                    .background(Color("Light Green"))
                                    .clipShape(Circle())
                                    .font(.title)
                            }
                        })
                        .simultaneousGesture(TapGesture().onEnded{
                            topicID = topicId
                            chapterID = 1
                        })
                        
                        if i < 5 {
                            ForEach(1...3, id: \.self){ j in
                                Capsule()
                                    .frame(width: 10, height: 20)
                                    .foregroundColor(Color("Green"))
                            }
                        }
                    case "progress":
                        NavigationLink(destination: ChapterView(), label: {
                            ZStack {
                                Text("")
                                    .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.width * 0.22)
                                    .background(Color("Yellow"))
                                    .clipShape(Circle())
                                Text("\(i)")
                                    .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
                                    .foregroundColor(Color.black)
                                    .background(Color("Light Yellow"))
                                    .clipShape(Circle())
                                    .font(.title)
                            }
                        }) .simultaneousGesture(TapGesture().onEnded{
                            topicID = topicId
                            chapterID = 2
                        })
                        
                        if i < 5 {
                            ForEach(1...3, id: \.self){ j in
                                Capsule()
                                    .frame(width: 10, height: 20)
                                    .foregroundColor(Color("Yellow"))
                            }
                        }
                    default :
                        ZStack {
                            Text("")
                                .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.width * 0.22)
                                .background(Color.gray)
                                .clipShape(Circle())
                            Image(systemName: "lock.fill")
                                .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
                                .foregroundColor(Color.black)
                                .background(Color.white.opacity(0.7))
                                .clipShape(Circle())
                                .font(.title)
                        }
                        .opacity(0.5)
                        
                        if i < 5 {
                            ForEach(1...3, id: \.self){ j in
                                Capsule()
                                    .frame(width: 10, height: 20)
                                    .foregroundColor(Color.gray)
                                    .opacity(0.5)
                            }
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.top, 30)
        .scrollIndicators(.hidden)
        .background(
            Image("Classroom Background")
                .resizable()
                .scaledToFill()
                .scaleEffect(CGSize(width: 1.3, height: 1.3))
                .opacity(0.2)
        )
        .navigationTitle(topicName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChapterListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChapterListView(topicId: 1, topicName: "")
        }
    }
}
