//
//  ChapterListView.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 22/06/23.
//

import SwiftUI

struct ChapterListView: View {
    
    let chapterStatus = "done"
    
    var body: some View {
        NavigationStack {
            VStack {
                ProgressBar(progress: 0.5)
                    .padding(.vertical)
                ScrollView {
                    ForEach(1...5, id: \.self) { i in
                        
                        switch chapterStatus {
                        case "done":
                            NavigationLink(destination: Text(String(i)), label: {
                                ZStack {
                                    Text("")
                                        .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.width * 0.22)
                                        .foregroundColor(Color.white)
                                        .background(Color("Green"))
                                        .clipShape(Circle())
                                    Text("\(i)")
                                        .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
                                        .foregroundColor(Color.white)
                                        .background(Color("Light Green"))
                                        .clipShape(Circle())
                                        .font(.title)
                                }
                            })
                            
                            if i < 5 {
                                ForEach(1...3, id: \.self){ j in
                                    Capsule()
                                        .frame(width: 10, height: 20)
                                        .foregroundColor(Color("Green"))
                                }
                            }
                        default:
                            NavigationLink(destination: Text(String(i)), label: {
                                ZStack {
                                    Text("")
                                        .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.width * 0.22)
                                        .background(Color("Yellow"))
                                        .clipShape(Circle())
                                    Text("\(i)")
                                        .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.width * 0.17)
                                        .foregroundColor(Color("Dark Blue"))
                                        .background(Color("Light Yellow"))
                                        .clipShape(Circle())
                                        .font(.title)
                                }
                            })
                            
                            if i < 5 {
                                ForEach(1...3, id: \.self){ j in
                                    Capsule()
                                        .frame(width: 10, height: 20)
                                        .foregroundColor(Color("Yellow"))
                                }
                            }
                        }
                    
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top)
            .scrollIndicators(.hidden)
            .background(
                Image("Classroom Background")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(CGSize(width: 1.3, height: 1.3))
                    .opacity(0.2)
            )
            .navigationTitle("School")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChapterListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListView()
    }
}
