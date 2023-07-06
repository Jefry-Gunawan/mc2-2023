import SwiftUI

struct ChapterView: View {
    var body: some View {
            VStack {
                VStack{
                    Rectangle()
                        .fill(Color("Blue"))
                        .frame(width: .infinity, height: 200)
                        .padding(EdgeInsets(.init(top: 25, leading: -10, bottom: -10, trailing: -10)))
                    
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
                            .padding(.top, -5)
                            
                            Text("In this session, you will learn how to use Simple Present Tense and Simple Past Tense. Help Ducker to solve some of the puzzles and problems in the class. Good Luck!")
                                .font(.body)
                                .lineLimit(7)
                                .padding(.top, 10)
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
                        
                        Image("Ducker")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                            .padding(.top, 75)
                            
                    }
                    .background(Color("Blue"))
                    .navigationTitle("Classroom")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbarBackground(
                        Color("Blue"),
                        for: .navigationBar)
                    
                    .roundedCorner(30, corners: [.bottomLeft, .bottomRight])
                    
                    
                }.padding(EdgeInsets(.init(top: -100, leading: -2, bottom: 0, trailing: -2)))
                
                //VStack for List
                VStack {
                    NavigationLink(destination: OverviewView()) {
                        CardView(title: "Overview")
                    }
                    .padding(2)
                    
                    NavigationLink(destination: VideoView()) {
                        CardView(title: "Video")
                    }
                    .padding(2)
                    
                    NavigationLink(destination: SpeakingView()) {
                        CardView(title: "Speaking")
                    }
                    .padding(2)
                    
                    NavigationLink(destination: QuizView()) {
                        CardView(title: "Quiz")
                    }
                    .padding(2)
                }
                .background(Color("White"))
                .padding(7)
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
