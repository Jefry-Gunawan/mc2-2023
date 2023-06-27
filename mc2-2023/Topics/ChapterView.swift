import SwiftUI
import UIKit

struct ChapterView: View {
    var body: some View {
        ScrollView {
            VStack {
                
                Rectangle()
                    .fill(Color("Blue"))
                    .frame(height:120)
                
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("Beginner")
                            
                            HStack{
                                Text(" Simple Present Tense ")
                                    .font(.system(size: 8))
                                    .lineLimit(1)
                                    .frame(height: 20)
                                    .background(Color("White"))
                                    .cornerRadius(5)
                                Text(" Simple Past Tense ")
                                    .font(.system(size: 8))
                                    .lineLimit(1)
                                    .frame(height: 20)
                                    .background(Color("White"))
                                    .cornerRadius(5)
                            }
                            
                            Text("In this session, you will learn how to use Simple Present Tense and Simple Past Tense. Help Ducker to solve some of the puzzles and problems in the class. Good Luck!")
                                .font(.body)
                        }
                        .padding()
                        Image("Ducker")
                            .resizable()
                            .scaledToFit()
                    }
                    .background(Color("Blue"))
                    .navigationTitle("Classroom")
                    .toolbarBackground(
                        Color("Blue"),
                        for: .navigationBar)
                    
                    .roundedCorner(40, corners: [.bottomLeft, .bottomRight])
                    
                    
                }.padding(.top, -9)
                //VStack for List
                
                VStack {
                    NavigationLink(destination: EmptyView()) {
                        CardView(title: "Overview")
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CardView(title: "Video")
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CardView(title: "Speaking")
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CardView(title: "Quiz")
                    }
                }
                .background(Color("White"))
            }
        }.ignoresSafeArea()
    }
}

struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChapterView()
        }
    }
}
